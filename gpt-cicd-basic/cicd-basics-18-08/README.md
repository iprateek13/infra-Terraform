# Parent → Child Terraform Bootstrap (No Backend Initially)

This project creates the backend infrastructure first using Terraform modules:

1. Resource Group
2. Storage Account
3. Private Blob Container (`tfstate`)

The Azure backend is intentionally NOT configured initially.

## Run

From `parent-modules/dev`:

```powershell
terraform init
terraform plan
terraform apply
```

After the Resource Group, Storage Account, and `tfstate` container are successfully created, add this backend block to `provider.tf`:

```hcl
backend "azurerm" {
  resource_group_name  = "example-resources"
  storage_account_name = "examplestorac"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
}
```

Then migrate the existing local state:

```powershell
terraform init -migrate-state
```

Note: Storage account names must be globally unique in Azure. Change `storage_account_name` if `examplestorac` is already taken.
