# enterpriseScale

Deploy Management Groupe Module
az deployment tenant create --name <DEPLOYMENTNAME> --location <METADATALOCATION> --template-file 'managementGroups/main.bicep' --parameters 'managementGroups/param.global.bicepparam'

Deploy Policy Module - Definitions
az deployment mg create --name "policy-definition" --location "swedencentral" --management-group-id "contoso" --template-file "policyFramework/policyDefinitions/main.bicep" --parameters "policyFramework/policyDefinitions/param.REGION.bicepparam"

Deploy Policy Module - Assignments