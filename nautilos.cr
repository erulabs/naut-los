require "option_parser"
require "dockerfile.cr"
require "kustomization.cr"
require "scanner.cr"
require "skaffold.cr"

dev = false
build = false
run = false
write = false
parser = OptionParser.new do |parser|
  parser.on("-v", "--version", "version") do
    puts "Version #{File.read("VERSION")}"
    exit
  end
  parser.on("-h", "--help", "Show this help") do
    puts parser
    exit
  end
  parser.on("-w", "--write", "Leave configuration files on disk") do
    write = true
  end
  parser.on("dev", "dev") do
    dev = true
  end
  parser.on("build", "build") do
    build = true
  end
  parser.on("run", "run") do
    build = true
    run = true
  end
end

parser.parse

if dev || build || run
  scanResult = scanner()
  wrote_dockerfile = dockerfile_build(write, scanResult)
  wrote_kustomization = kustomization_build(write, scanResult)
  wrote_skaffold = skaffold_build(write, scanResult)
end

if run
  puts "run"
elsif build
  puts "build"
elsif dev
  puts "dev"
end

if !dev && !build && !run
  puts "Usage: nautilos [options]"
  puts parser
  exit(1)
end

if !write
  File.delete("Dockerfile") if wrote_dockerfile && File.exists?("Dockerfile")
  File.delete("kustomization.yaml") if wrote_kustomization && File.exists?("kustomization.yaml")
  File.delete("skaffold.yaml") if wrote_skaffold && File.exists?("skaffold.yaml")
end
