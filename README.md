# enterpriseScale

Deploy Management Groupe Module
```bash
az deployment tenant create --name "management-groups" --location "swedencentral" --template-file 'managementGroups/main.bicep' --parameters 'managementGroups/param.global.bicepparam'
```
Deploy Policy Module - Definitions
```bash
az deployment mg create --name "policy-definitions" --location "swedencentral" --management-group-id "contoso" --template-file "policyFramework/policyDefinitions/main.bicep" --parameters "policyFramework/policyDefinitions/param.REGION.bicepparam"
```
Deploy Policy Module - Assignments
```bash
az deployment mg create --name "policy-assignments" --location "swedencentral" --management-group-id "contoso" --template-file "policyFramework/policyAssignments/main.bicep" --parameters "policyFramework/policyAssignments/param.REGION.bicepparam"
```