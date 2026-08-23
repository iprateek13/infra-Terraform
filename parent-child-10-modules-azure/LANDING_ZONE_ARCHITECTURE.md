# Azure Landing Zone Architecture & Resource Provisioning Flow

This document provides a complete guide to the enterprise **Azure Landing Zone Architecture** implemented in this repository (`parent-child-10-modules-azure`). It details how the **10 Azure Child Modules** interlink across 4 architecture layers to establish a secure, scalable, and automated cloud environment for `dev`, `test`, and `prod`.

---

## 1. High-Level Azure Landing Zone Blueprint

The Landing Zone design follows the **Microsoft Cloud Adoption Framework (CAF)** principles, separating governance, security, networking, and compute into distinct operational tiers:

```mermaid
graph TD
    subgraph Subscription["Azure Subscription Boundary"]
        subgraph Layer1["1. Governance & Management Layer"]
            RG["azurerm_resource_group<br/>(Resource Groups per tier/environment)"]
        end

        subgraph Layer2["2. Security & Shared Services Layer"]
            LAW["azurerm_log_analytics_workspace<br/>(Central Audit & Monitoring)"]
            KV["azurerm_key_vault<br/>(Secrets, Keys & Passwords)"]
            ST["azurerm_storage_account<br/>(Diagnostics & Blob Storage)"]
        end

        subgraph Layer3["3. Network Infrastructure Layer"]
            VNET["azurerm_virtual_network<br/>(Address Space / VNet)"]
            SNET["azurerm_subnet<br/>(Subnet Segmentation)"]
            NSG["azurerm_network_security_group<br/>(Ingress/Egress Firewall Rules)"]
            PIP["azurerm_public_ip<br/>(Public Ingress Endpoint)"]
        end

        subgraph Layer4["4. Compute & Workload Layer"]
            NIC["azurerm_network_interface<br/>(VNet Interface Card)"]
            VM["azurerm_linux_virtual_machine<br/>(Enterprise Workload Compute)"]
        end
    end

    %% Dependency Connections
    RG --> LAW
    RG --> KV
    RG --> ST
    RG --> VNET
    RG --> NSG
    RG --> PIP
    
    VNET --> SNET
    SNET --> NIC
    PIP --> NIC
    
    NIC --> VM
    ST -.->|Boot Diagnostics| VM
    KV -.->|Admin Credentials| VM
    LAW -.->|Logs & Telemetry| VM

    classDef gov fill:#e1f5fe,stroke:#0288d1,stroke-width:2px;
    classDef sec fill:#fff3e0,stroke:#f57c00,stroke-width:2px;
    classDef net fill:#e8f5e9,stroke:#388e3c,stroke-width:2px;
    classDef cmp fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px;

    class Layer1,RG gov;
    class Layer2,LAW,KV,ST sec;
    class Layer3,VNET,SNET,NSG,PIP net;
    class Layer4,NIC,VM cmp;
```

---

## 2. Resource Execution Sequence & Dependency Flow

Terraform provisions resources strictly following the logical dependency tree below. Parent modules enforce explicit `depends_on` blocks to guarantee order of execution during `terraform apply`:

```
========================================================================================
                               RESOURCE PROVISIONING FLOW
========================================================================================

STEP 1: RESOURCE GROUP
  └── azurerm_resource_group
        │
        ├──► STEP 2: SHARED SERVICES & NETWORK FOUNDATION (Parallel Execution)
        │     ├── azurerm_log_analytics_workspace (Audit & Diagnostics Hub)
        │     ├── azurerm_key_vault               (Secrets & Identity Encryption)
        │     ├── azurerm_storage_account         (Storage & Diagnostics)
        │     ├── azurerm_virtual_network         (Network Address Space)
        │     ├── azurerm_network_security_group (Firewall Rules)
        │     └── azurerm_public_ip               (Public IP Allocation)
        │
        ├──► STEP 3: NETWORK SUBNETTING (Requires Virtual Network)
        │     └── azurerm_subnet                  (Subnet Slicing within VNet)
        │
        ├──► STEP 4: NETWORK INTERFACE (Requires Subnet + Public IP)
        │     └── azurerm_network_interface       (Binds Subnet IP + Public IP)
        │
        └──► STEP 5: COMPUTE WORKLOAD (Requires NIC + Storage + Key Vault)
              └── azurerm_linux_virtual_machine   (Deploy Linux Compute Instance)
========================================================================================
```

---

## 3. Detailed 10-Child-Module Breakdown

| Layer | Child Module Folder | Primary Resource | Input Dependency | Output / Downstream Consumer |
| :--- | :--- | :--- | :--- | :--- |
| **1. Governance** | [`azurerm_resource_group`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_resource_group) | `azurerm_resource_group` | None (Root container) | Used by all 9 remaining child modules |
| **2. Security & Shared** | [`azurerm_log_analytics_workspace`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_log_analytics_workspace) | `azurerm_log_analytics_workspace` | Resource Group | Collects diagnostic logs from VMs, Network, KV |
| | [`azurerm_key_vault`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_key_vault) | `azurerm_key_vault` | Resource Group | Stores VM Admin Credentials and SSH keys |
| | [`azurerm_storage_account`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_storage_account) | `azurerm_storage_account` | Resource Group | VM Boot Diagnostics, Storage Blobs, Disks |
| **3. Network** | [`azurerm_virtual_network`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_virtual_network) | `azurerm_virtual_network` | Resource Group | Defines `address_space` for subnets |
| | [`azurerm_subnet`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_subnet) | `azurerm_subnet` | Virtual Network | Provides IP range for NICs |
| | [`azurerm_network_security_group`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_network_security_group) | `azurerm_network_security_group` | Resource Group | Security rules applied to Network Interfaces / Subnets |
| | [`azurerm_public_ip`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_public_ip) | `azurerm_public_ip` | Resource Group | Allocated public IP attached to Network Interface |
| **4. Compute** | [`azurerm_network_interface`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_network_interface) | `azurerm_network_interface` | Subnet, Public IP | Network adapter for Virtual Machine |
| | [`azurerm_linux_virtual_machine`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/child_module/azurerm_linux_virtual_machine) | `azurerm_linux_virtual_machine` | Network Interface, Storage | Runs application workloads |

---

## 4. Multi-Environment Parent Module Architecture

The environment configurations in `parent_module/` (`dev`, `prod`, `test`) reuse the same set of 10 child modules by feeding environment-specific values via `terraform.tfvars`:

```mermaid
graph LR
    subgraph Environments["Parent Module Environments"]
        DEV["parent_module/dev<br/>(Dev tfvars)"]
        TEST["parent_module/test<br/>(Test tfvars)"]
        PROD["parent_module/prod<br/>(Prod tfvars)"]
    end

    subgraph ReusableModules["Child Modules Repository (child_module/)"]
        M1["azurerm_resource_group"]
        M2["azurerm_storage_account"]
        M3["azurerm_virtual_network"]
        M4["azurerm_subnet"]
        M5["azurerm_network_security_group"]
        M6["azurerm_public_ip"]
        M7["azurerm_network_interface"]
        M8["azurerm_linux_virtual_machine"]
        M9["azurerm_key_vault"]
        M10["azurerm_log_analytics_workspace"]
    end

    DEV -->|calls for_each| ReusableModules
    TEST -->|calls for_each| ReusableModules
    PROD -->|calls for_each| ReusableModules
```

---

## 5. Deployment Instructions

To deploy the Landing Zone for any target environment (e.g., `dev`):

```bash
# 1. Navigate to target environment parent directory
cd parent_module/dev

# 2. Initialize Terraform modules and Azure provider
terraform init

# 3. Validate code formatting and variables
terraform validate

# 4. Generate & inspect the execution plan
terraform plan

# 5. Apply infrastructure rollout
terraform apply --auto-approve
```
