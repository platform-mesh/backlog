# Platform Mesh Backlog

Central project management hub for [Platform Mesh](https://platform-mesh.io) — grouping cross-cutting roadmap items, epics, and upstream coordination tickets into the roadmap.

## About Platform Mesh

Platform Mesh builds upon the Kubernetes API and resource model to let you discover, order, and orchestrate services across any provider through kubectl. It supports multi-tenant control planes, KRM-based declarative API management, seamless service-provider integration, and decentralised marketplace interfaces for publishing and consuming APIs.

Platform Mesh is part of [ApeiroRA](https://apeirora.eu/content/projects/) (IPCEI-CIS) and has been donated to the [NeoNephos Foundation](https://neonephos.org), a Linux Foundation initiative.

For more information, visit the [project website](https://platform-mesh.io) or browse the [GitHub organization](https://github.com/platform-mesh).

## About This Repository

This repository is the **central backlog** for Platform Mesh. It is not a code repository — it is used purely for planning, tracking, and prioritization of work that spans multiple components or relates to upstream projects.

Use this repo to:

- Track **epics** that span multiple repositories
- Coordinate **upstream** work (e.g. kcp, multicluster-runtme, kubebind, api-syncagent etc. contributions)
- Propose **cross-cutting features** that affect the platform as a whole
- Record **architecture decisions** (ADRs)
- Define **initiatives** that group related epics

## Getting Started

### Browse Work

- **Open issues:** [platform-mesh/backlog/issues](https://github.com/platform-mesh/backlog/issues)
- **Project boards:** [platform-mesh projects](https://github.com/orgs/platform-mesh/projects) — for a visual overview of what's in progress
- **Initiatives:** see [Current Initiatives](#current-initiatives) below for the active strategic themes

### Create an Issue

1. Go to [New Issue](https://github.com/platform-mesh/backlog/issues/new/choose)
2. Pick the template that fits your work (Epic, Task, Feature Request, ADR, or Initiative)
3. Fill in the required fields — the template will guide you

### Contribute

If you'd like to contribute to Platform Mesh, start with:

- [Contributing Guide](https://github.com/platform-mesh/.github/blob/main/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/platform-mesh/.github/blob/main/CODE_OF_CONDUCT.md)

For bugs in a specific component, file the issue in that component's repo. For anything cross-cutting, file it here.

## Issue Types

We use GitHub issue templates to keep tickets consistent. When creating an issue, pick the type that fits:

| Type | Title Prefix | When to Use |
|------|-------------|-------------|
| **Initiative** | `[Initiative]:` | Top-level strategic themes that group related epics |
| **Epic** | `epic:` | Large features spanning multiple tasks; includes demo planning |
| **Task** | `task:` | Concrete development work items with implementation details |
| **Feature Request** | `feature:` | Propose new capabilities or enhancements |
| **ADR** | `[Adr]:` | Architecture Decision Records |

### Labels

| Label | Purpose |
|-------|---------|
| `status/refined` | Issue is refined and ready for work |
| `status/needs-refinement` | Issue needs further detail |
| `status/to-be-refined` | Issue is queued for refinement |

## Current Initiatives

Active strategic themes driving the roadmap:

- [Platform Mesh Evolution](https://github.com/platform-mesh/backlog/issues/187)
- [Observability, Metering, Audit Logging](https://github.com/platform-mesh/backlog/issues/188)
- [Production Setup](https://github.com/platform-mesh/backlog/issues/189)
- [AI Enablement](https://github.com/platform-mesh/backlog/issues/190)
- [Collaboration](https://github.com/platform-mesh/backlog/issues/191)

## Project Boards

Track work visually using the org-level [project boards](https://github.com/orgs/platform-mesh/projects):

| Board | Description |
|-------|-------------|
| [Platform Mesh & Kube Projects - Backlog](https://github.com/orgs/platform-mesh/projects/1) | Main project board for the team |
| [OpenMesh - Backlog](https://github.com/orgs/platform-mesh/projects/5) | Platform Mesh, OpenMFP, and associated project work |
| [Platform Mesh - Bug Tracker](https://github.com/orgs/platform-mesh/projects/7) | Bug tracking across the platform |
| [PlatformMesh - RoadMap](https://github.com/orgs/platform-mesh/projects/12) | Roadmap planning |

## Repository Directory

Public repositories in the Platform Mesh organization, grouped by purpose.

### Core Platform

| Repository | Description |
|------------|-------------|
| [account-operator](https://github.com/platform-mesh/account-operator) | Manages core Account resource and related Workspaces |
| [resource-broker](https://github.com/platform-mesh/resource-broker) | Synchronising, translating and lifecycling resources between clusters |
| [virtual-workspaces](https://github.com/platform-mesh/virtual-workspaces) | Virtual workspace implementations |
| [platform-mesh-operator](https://github.com/platform-mesh/platform-mesh-operator) | Platform Mesh operator |
| [extension-manager-operator](https://github.com/platform-mesh/extension-manager-operator) | Extension manager operator |
| [golang-commons](https://github.com/platform-mesh/golang-commons) | Shared Go libraries |
| [subroutines](https://github.com/platform-mesh/subroutines) | Subroutines lifecycle package |
| [kube-bind-provider](https://github.com/platform-mesh/kube-bind-provider) | kube-bind Provider wrapper |
| [ocm](https://github.com/platform-mesh/ocm) | Open Component Model integration |

### IAM & Security

| Repository | Description |
|------------|-------------|
| [iam-service](https://github.com/platform-mesh/iam-service) | Identity and access management service |
| [iam-ui](https://github.com/platform-mesh/iam-ui) | IAM user interface |
| [rebac-authz-webhook](https://github.com/platform-mesh/rebac-authz-webhook) | ReBAC authorization webhook |
| [security-operator](https://github.com/platform-mesh/security-operator) | Security operator |

### UI & Portal

| Repository | Description |
|------------|-------------|
| [portal](https://github.com/platform-mesh/portal) | Portal application |
| [portal-ui-lib](https://github.com/platform-mesh/portal-ui-lib) | Portal UI library |
| [portal-server-lib](https://github.com/platform-mesh/portal-server-lib) | Portal server library |

### Infrastructure & Operations

| Repository | Description |
|------------|-------------|
| [helm-charts](https://github.com/platform-mesh/helm-charts) | Public Helm charts |
| [custom-images](https://github.com/platform-mesh/custom-images) | Custom container images used in the platform-mesh setup |
| [upstream-images](https://github.com/platform-mesh/upstream-images) | Upstream container images |

### Examples & Getting Started

| Repository | Description |
|------------|-------------|
| [provider-quickstart](https://github.com/platform-mesh/provider-quickstart) | Provider "Hello World" — how to become a provider in PM |
| [example-mongodb-multiclusterruntime](https://github.com/platform-mesh/example-mongodb-multiclusterruntime) | MongoDB multicluster-runtime example |
| [kubernetes-mcp-server](https://github.com/platform-mesh/kubernetes-mcp-server) | MCP server for Kubernetes and OpenShift |
| [kubernetes-graphql-gateway](https://github.com/platform-mesh/kubernetes-graphql-gateway) | Kubernetes GraphQL gateway |

### Architecture & Docs

| Repository | Description |
|------------|-------------|
| [architecture](https://github.com/platform-mesh/architecture) | Architecture documentation and diagrams |
| [community](https://github.com/platform-mesh/community) | Community, TSC discussions, meetings |
| [platform-mesh.github.io](https://github.com/platform-mesh/platform-mesh.github.io) | Website source (platform-mesh.io) |
| [.github](https://github.com/platform-mesh/.github) | Org-level community health files |


## Links

- **Website:** [platform-mesh.io](https://platform-mesh.io)
- **GitHub Org:** [github.com/platform-mesh](https://github.com/platform-mesh)
- **Community:** [github.com/platform-mesh/community](https://github.com/platform-mesh/community)
- **Security Policy:** [SECURITY.md](https://github.com/platform-mesh/.github/blob/main/SECURITY.md)
