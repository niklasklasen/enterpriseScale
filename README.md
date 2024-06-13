# enterpriseScale

Deploy Management Groupe Module
az deployment tenant create --name <DEPLOYMENTNAME> --location <METADATALOCATION> --template-file 'managementGroups/main.bicep' --parameters 'managementGroups/param.global.bicepparam'

Deploy Policy Module - Definitions

Deploy Policy Module - Assignments