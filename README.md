# Infra Terraform

A practical and production-oriented **Infrastructure as Code (IaC)** repository for learning and implementing **Terraform with Microsoft Azure**.

This repository focuses on how Terraform is used to design, provision, manage, and maintain cloud infrastructure in a reusable, scalable, and enterprise-friendly way.

---

## 🚀 Repository Goal

The goal is to understand Terraform from fundamentals to production-level Infrastructure as Code practices.

```text
Terraform Configuration
        ↓
Provider
        ↓
Resources
        ↓
Variables
        ↓
Modules
        ↓
Terraform Init
        ↓
Terraform Plan
        ↓
Terraform Apply
        ↓
Azure Infrastructure
        ↓
Terraform State
        ↓
Continuous Infrastructure Management
```

The focus is not only on writing `.tf` files, but also on understanding:

```text
WHAT
 ↓
WHY
 ↓
HOW
 ↓
WHEN TO USE
 ↓
PRODUCTION USE
 ↓
BEST PRACTICES
```

---

# 📂 Repository Structure

```text
infra-terraform/
│
├── basics/
│   ├── provider/
│   ├── resources/
│   ├── variables/
│   ├── outputs/
│   └── locals/
│
├── modules/
│   ├── resource-group/
│   ├── storage-account/
│   ├── virtual-network/
│   └── key-vault/
│
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
│
├── state/
│   ├── local-state/
│   └── remote-backend/
│
├── advanced/
│   ├── for-each/
│   ├── count/
│   ├── dynamic-blocks/
│   ├── data-sources/
│   ├── depends-on/
│   └── lifecycle/
│
├── azure/
│   ├── resource-groups/
│   ├── storage/
│   ├── networking/
│   ├── identity/
│   └── compute/
│
├── docs/
│   ├── terraform-flow/
│   ├── state-management/
│   ├── modules/
│   └── production-practices/
│
├── README.md
└── .gitignore
```

The exact structure may evolve as the repository grows.

---

# ☁️ Cloud Platform

The primary cloud platform used in this repository is:

**Microsoft Azure**

Terraform communicates with Azure through the AzureRM provider.

```text
Terraform
    ↓
AzureRM Provider
    ↓
Azure Resource Manager
    ↓
Azure Resources
```

---

# 🛠️ Core Technologies

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| HCL | Terraform configuration language |
| AzureRM Provider | Manage Azure resources |
| Microsoft Azure | Cloud infrastructure |
| Git | Version control |
| GitHub | Source code hosting |

CI/CD automation is maintained separately in the `infra-pipeline` repository.

---

# 🧱 Terraform Fundamentals

This repository covers the core Terraform building blocks.

## Provider

Defines the cloud/platform Terraform will communicate with.

```text
Terraform
   ↓
Provider
   ↓
Azure
```

---

## Resources

Resources represent infrastructure objects that Terraform manages.

Examples:

```text
Resource Group
Storage Account
Virtual Network
Subnet
Network Security Group
Key Vault
Virtual Machine
Azure Kubernetes Service
```

---

## Variables

Variables make Terraform configurations reusable and configurable.

```text
Hardcoded Value
      ↓
Variable
      ↓
Different Environment Values
```

Example:

```hcl
variable "location" {
  type    = string
  default = "East US"
}
```

---

## Outputs

Outputs expose useful information after Terraform operations.

Examples:

```text
Resource ID
Storage Account Name
Virtual Network ID
Public IP Address
```

---

## Locals

Locals are used for reusable expressions and calculated values within a Terraform configuration.

---

# 🔄 Terraform Workflow

The standard Terraform workflow is:

```text
Write Configuration
       ↓
terraform fmt
       ↓
terraform init
       ↓
terraform validate
       ↓
terraform plan
       ↓
terraform apply
       ↓
Infrastructure Created/Updated
```

---

# 📌 Important Terraform Commands

### Initialize

```bash
terraform init
```

Downloads providers/modules and initializes the working directory.

---

### Format

```bash
terraform fmt
```

Formats Terraform configuration consistently.

---

### Validate

```bash
terraform validate
```

Checks whether the Terraform configuration is syntactically and structurally valid.

---

### Plan

```bash
terraform plan
```

Shows the changes Terraform intends to make.

---

### Apply

```bash
terraform apply
```

Applies the planned infrastructure changes.

---

### Destroy

```bash
terraform destroy
```

Removes infrastructure managed by the Terraform configuration.

This command should be used carefully, especially against shared or production environments.

---

# 🧩 Terraform Modules

Modules are used to create reusable Terraform configurations.

Example:

```text
Root Module
     ↓
Storage Account Module
     ↓
Azure Storage Account
```

A typical module:

```text
modules/
└── storage-account/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

The goal is to avoid repeatedly writing the same infrastructure configuration.

---

# 🌍 Environment Separation

Production infrastructure should not be treated exactly like development infrastructure.

A common structure is:

```text
environments/
│
├── dev/
├── staging/
└── prod/
```

Each environment can have different:

```text
Configuration
Variables
Subscriptions
State
Scaling
Security
Networking
```

Conceptually:

```text
Reusable Modules
       ↓
Environment Configuration
       ↓
Terraform Plan
       ↓
Environment Deployment
```

---

# 🗄️ Terraform State

Terraform state is one of the most important concepts in Terraform.

Terraform uses state to maintain a mapping between:

```text
Terraform Configuration
        ↕
Terraform State
        ↕
Real Infrastructure
```

Example:

```text
main.tf
   ↓
Terraform State
   ↓
Azure Resource
```

Terraform uses this information to determine what needs to be created, modified, or destroyed.

---

# 💻 Local State vs Remote State

## Local State

By default Terraform can maintain state locally:

```text
terraform.tfstate
```

This is useful for:

- Learning
- Experiments
- Simple local development

But it is generally not appropriate for shared production infrastructure.

---

## Remote State

For team/enterprise environments, state is commonly stored remotely.

Example:

```text
Terraform
    ↓
Azure Storage Account
    ↓
Blob Container
    ↓
Terraform State
```

Benefits include:

```text
Centralized State
+
Team Collaboration
+
Access Control
+
Durability
+
Controlled State Management
```

---

# 🔒 State Security

Terraform state can contain sensitive infrastructure information.

Therefore:

```text
Never commit terraform.tfstate
```

to Git.

The repository `.gitignore` excludes Terraform state files.

Production state should be protected using:

```text
Access Control
Encryption
Least Privilege
Remote Backend
State Locking
Backup / Recovery
```

---

# 🔐 Variables and Secrets

Sensitive values should not be hardcoded in Terraform code.

Avoid:

```hcl
client_secret = "my-secret"
```

Instead use appropriate secret-management/authentication mechanisms.

For local development:

```text
terraform.tfvars
```

can contain environment-specific values, but it should not be committed when it contains secrets.

A safe example can be committed:

```text
terraform.tfvars.example
```

---

# 🔑 Azure Authentication

Terraform needs an identity with permission to manage Azure resources.

Conceptually:

```text
Terraform
    ↓
Azure Authentication
    ↓
Microsoft Entra ID
    ↓
Identity
    ↓
Azure RBAC
    ↓
Azure Resources
```

In automated CI/CD environments, the preferred authentication mechanism can be implemented separately through the `infra-pipeline` repository.

---

# 🏗️ Azure Infrastructure Covered

This repository will progressively cover resources such as:

```text
Resource Groups
        ↓
Storage Accounts
        ↓
Virtual Networks
        ↓
Subnets
        ↓
NSGs
        ↓
VNet Peering
        ↓
Private Endpoints
        ↓
Key Vault
        ↓
Compute
        ↓
Azure Kubernetes Service
```

The exact resources will expand as the repository evolves.

---

# 🧠 Terraform Meta-Arguments

Important Terraform concepts covered include:

### `count`

Creates multiple instances based on a count.

```text
count = 3
      ↓
Resource 1
Resource 2
Resource 3
```

### `for_each`

Creates resources from a collection.

```text
for_each
   ↓
Map / Set
   ↓
Multiple Resource Instances
```

### `depends_on`

Explicitly defines a dependency when Terraform cannot infer it automatically.

### `lifecycle`

Controls resource lifecycle behavior such as:

```text
create_before_destroy
prevent_destroy
ignore_changes
```

---

# 📊 Data Sources

Data sources allow Terraform to read information about existing infrastructure.

Conceptually:

```text
Existing Azure Resource
        ↓
Terraform Data Source
        ↓
Read Information
        ↓
Use in Configuration
```

This is useful when Terraform needs to work with infrastructure that it does not necessarily create itself.

---

# 🔁 Terraform Dependency Graph

Terraform builds a dependency graph to determine resource creation and modification order.

Example:

```text
Resource Group
      ↓
Virtual Network
      ↓
Subnet
      ↓
Private Endpoint
```

Terraform uses dependencies to determine the appropriate execution order.

---

# 🏢 Production / Enterprise Practices

This repository emphasizes production-oriented Terraform practices.

### Reusability

Use modules instead of duplicating infrastructure code.

### Consistency

Use:

```text
Naming Standards
Tagging
Variables
Locals
Reusable Modules
```

### Security

Follow:

```text
Least Privilege
Private Connectivity
Encryption
Secure Defaults
Secret Management
```

### State Management

Use:

```text
Remote State
Access Control
State Locking
Backup / Recovery
```

### Environment Isolation

Separate:

```text
Dev
Staging
Production
```

### Change Management

Use:

```text
Terraform Plan
      ↓
Review
      ↓
Approval
      ↓
Apply
```

---

# 💰 Infrastructure Cost Awareness

Infrastructure design directly affects cloud cost.

Terraform changes should be evaluated for:

```text
Compute Cost
Storage Cost
Networking Cost
Data Transfer
High Availability
Scaling
```

Cost estimation and CI/CD integration are covered separately in the `infra-pipeline` repository.

---

# 🔗 Relationship With Infra Pipeline

This repository focuses on:

```text
Terraform
+
Azure
+
IaC
+
Modules
+
State
+
Infrastructure Design
```

The `infra-pipeline` repository focuses on:

```text
Git
+
GitHub
+
GitHub Actions
+
CI/CD
+
DevSecOps
+
Security Scanning
+
Terraform Automation
```

Together:

```text
                 infra-terraform
                       │
                 Terraform Code
                       │
                       ▼
                  Git / GitHub
                       │
                       ▼
                infra-pipeline
                       │
                GitHub Actions
                       │
          ┌────────────┼────────────┐
          ▼            ▼            ▼
       Validate      Security      Plan
          │            │            │
          └────────────┼────────────┘
                       ▼
                    Apply
                       │
                       ▼
                     Azure
```

This separation keeps the Terraform codebase and CI/CD automation independently maintainable.

---

# 🎯 Learning Objectives

By working through this repository, the goal is to understand:

- Terraform fundamentals
- HCL
- Providers
- Resources
- Variables
- Outputs
- Locals
- Data sources
- Modules
- Root modules
- Child modules
- Meta-arguments
- Dependencies
- Lifecycle rules
- Terraform state
- State drift
- Remote backend
- State locking
- Environment separation
- Terraform best practices
- AzureRM provider
- Azure resource provisioning
- Infrastructure security
- Production Terraform architecture

---

# 🗺️ Learning Flow

The recommended learning sequence is:

```text
Terraform Basics
      ↓
HCL
      ↓
Provider
      ↓
Resources
      ↓
Variables
      ↓
Outputs
      ↓
Locals
      ↓
Data Sources
      ↓
Terraform Commands
      ↓
State
      ↓
Drift
      ↓
Modules
      ↓
Meta-Arguments
      ↓
Remote Backend
      ↓
Environment Separation
      ↓
Azure Infrastructure
      ↓
Production Best Practices
      ↓
Terraform CI/CD
```

---

# 🏁 Final Goal

The final objective is to build a strong understanding of how Terraform is used in real-world Azure environments:

```text
Infrastructure Requirement
        ↓
Terraform Design
        ↓
Reusable Modules
        ↓
Environment Configuration
        ↓
Terraform Plan
        ↓
Review
        ↓
Terraform Apply
        ↓
Azure Infrastructure
        ↓
State Management
        ↓
Continuous Infrastructure Management
```

The repository will evolve from **Terraform fundamentals** into a practical **enterprise-oriented Azure Infrastructure as Code implementation**.
