| Landing Zone |
|:--------------|
|[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://ms.portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnil0blue%2Flandingzone%2Fmaster%2Fpolicy%2Ftoptemplate.json) |

The Deploy button deploys the landing zone policies across the subscription.

Also, a Terraform Action Pipeline will create the landing zone Vnets/Subnets to Azure when any of the manifest files under the migration folder are updated. 

