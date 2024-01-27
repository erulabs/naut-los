require "option_parser"

dev = false
build = false
run = false
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
    puts parser
    exit
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

if dev
  puts "dev"
elsif build
  puts "build"
end

if run
  puts "run"
end

if !dev && !build && !run
  puts "Usage: nautilos [options]"
  puts parser
  exit(1)
end
