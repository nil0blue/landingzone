| Landing Zone |
|:--------------|
|[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnil0blue%2Flandingzone%2Fmaster%2Fpolicy%2Ftoptemplate.json) |
|The Deploy button deploys the landing zone policies across the subscription.|


|When the Terraform variables file under the migration folder is updated, the terraform action pipeline is triggered to create or update the landing zone Vnets/Subnets/VPN Gateway and Local Gateway resources in the subscription which will facilitate the Migration setup. The action pipeline makes use of the action published in the nil0blue/terraform-azure-pipeline repository |



## Prerequisites
A service principal needs to be created for Terraform and it's client id and secret must be noted.
A storage account must be created with a container. This is used for storing the terraform state.

## The foundation.tf manifest must be modified to supply the storage account and container name
```terraform
terraform {
  backend "azurerm" {
    storage_account_name = "storage_account_name"
    container_name       = "storage_container_name"
  }
}
```

## The following secrets must be added to the GitHub Account

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `arm_client_id` | `string` | | Azure Service Principal client_id |
| `arm_client_secret` | `string` | | Azure Service Principal client_secret |
| `arm_subscription_id` | `string` | | Azure subscription |
| `arm_tenant_id` | `string` | | Azure Tenant id |
| `arm_access_key` | `string` | | Azure Storage access key |
| `variables` | `string` | `""` | Comma-separated string of Terraform variables |
| `path` | `string` | `.` | Path to Terraform directory, defaults to the working directory |
| `varfile` | `string` | `.` | Name of tfvars file, defaults to variables.tfvars |
        
        
        
