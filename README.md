# enterpriseScale

Deploy Management Groupe Module
az deployment tenant create --name <DEPLOYMENTNAME> --location <METADATALOCATION> --template-file 'managementGroups/main.bicep' --parameters 'managementGroups/param.global.bicepparam'
