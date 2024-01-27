# Nautílos
Nautílos deploys virtually anything to Kubernetes, no config required. A successor to [deploy-node-app](https://github.com/kubesail/deploy-node-app). Nautílos is written in [Crystal](https://crystal-lang.org/) and has zero depencencies.

#### Why?

Kubernetes is an immensely powerful standard. However, it is also a complex standard. While Kubernetes runs very well on developers laptops, in every cloud provider, and at the enterprise scale, it is *not* important for developers who just want to get their code deployed in a standard way. With Nautílos, developers can focus on their application while knowing their SRE team will be ecstatic that you've done all the setup already!

## Introduction
Nautílos looks at your codebase, potentially asks you a few questions, and then deploys your code to any Kubernetes cluster, with (possibly) zero config.

Under the hood, we're automatically generating [Dockerfiles](https://docs.docker.com/engine/reference/builder/), [Kustomization YAML](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/), and [Skaffold](https://skaffold.dev/) configurations. If tools like `skaffold` and `kubectl` are not installed, Nautílos will handle that as well!

Nautílos works best with the following ecosystems:

- Node.js (including Next.js)
- Ruby (including Rails)
- Python (including Jekyll)
- Static HTML
- more coming soon!

## Install

## Usage

The `nautilos` command supports several high level actions: `dev`, `build`, and `run`. These are directly analogous to Skaffold's functions, but pre-generate all configuration required.

```
# Develop my application - works great with Docker-desktop (With k8s enable), Orbstack, Rancher Desktop, etc!
# Note that you can also develop against remote clusters!
nautilos dev
```

```
# Generate configuration and build my container image. Use `--write-config` to write generated configuration files to disk.
nautilos build
```

```
# All in one - generate configuration, build images, and deploy them.
nautilos run
```
