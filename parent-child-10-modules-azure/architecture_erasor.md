# Architecture Diagram - Restructured Azure Parent-Child Landing Zone

This document details the updated 2-folder architecture with `child_module` (10 Azure child modules) and `parent_module` (`dev`, `prod`, `test` environments) aligned with the **Azure Landing Zone Architecture**.

For full documentation and provisioning sequence details, see [`LANDING_ZONE_ARCHITECTURE.md`](file:///c:/DevOps%20Insiders/Terraform/parent-child-10-modules-azure/LANDING_ZONE_ARCHITECTURE.md).

---

## 1. Erasor.io Markup Syntax

Copy and paste into [Erasor.io](https://app.erasor.io/):

```erasor
// Azure Landing Zone Architecture Layers
Azure Landing Zone [icon: azure] {
  Governance Tier [icon: folder] {
    azurerm_resource_group [icon: azure-resource-groups]
  }
  
  Security & Shared Services Tier [icon: folder] {
    azurerm_log_analytics_workspace [icon: azure-log-analytics]
    azurerm_key_vault [icon: azure-key-vaults]
    azurerm_storage_account [icon: azure-storage-accounts]
  }
  
  Network Infrastructure Tier [icon: folder] {
    azurerm_virtual_network [icon: azure-virtual-networks]
    azurerm_subnet [icon: azure-subnets]
    azurerm_network_security_group [icon: azure-network-security-groups]
    azurerm_public_ip [icon: azure-public-ips]
  }
  
  Compute Workload Tier [icon: folder] {
    azurerm_network_interface [icon: azure-network-interfaces]
    azurerm_linux_virtual_machine [icon: azure-virtual-machines]
  }
}

// Parent Environment Management
Parent Module [icon: folder] {
  dev [icon: folder]
  test [icon: folder]
  prod [icon: folder]
}

// Relationships
Parent Module > Azure Landing Zone
Azure Landing Zone.Governance Tier > Azure Landing Zone.Security & Shared Services Tier
Azure Landing Zone.Governance Tier > Azure Landing Zone.Network Infrastructure Tier
Azure Landing Zone.Network Infrastructure Tier > Azure Landing Zone.Compute Workload Tier
Azure Landing Zone.Security & Shared Services Tier > Azure Landing Zone.Compute Workload Tier
```

---

## 2. Mermaid Landing Zone Dependency Graph

```mermaid
graph TD
    subgraph Parent["Parent Environments (parent_module/)"]
        DEV["dev/"]
        TEST["test/"]
        PROD["prod/"]
    end

    subgraph LZ["Azure Landing Zone Architecture Tiers (child_module/)"]
        subgraph Tier1["1. Governance"]
            C1["azurerm_resource_group"]
        end

        subgraph Tier2["2. Security & Management"]
            C2["azurerm_storage_account"]
            C9["azurerm_key_vault"]
            C10["azurerm_log_analytics_workspace"]
        end

        subgraph Tier3["3. Network Infrastructure"]
            C3["azurerm_virtual_network"]
            C4["azurerm_subnet"]
            C5["azurerm_network_security_group"]
            C6["azurerm_public_ip"]
        end

        subgraph Tier4["4. Compute Workload"]
            C7["azurerm_network_interface"]
            C8["azurerm_linux_virtual_machine"]
        end
    end

    DEV --> LZ
    TEST --> LZ
    PROD --> LZ

    C1 --> C2 & C9 & C10 & C3 & C5 & C6
    C3 --> C4
    C4 & C6 --> C7
    C7 & C2 & C9 --> C8

    style Parent fill:#f8f9fa,stroke:#333;
    style Tier1 fill:#e1f5fe,stroke:#0288d1;
    style Tier2 fill:#fff3e0,stroke:#f57c00;
    style Tier3 fill:#e8f5e9,stroke:#388e3c;
    style Tier4 fill:#f3e5f5,stroke:#7b1fa2;
```
