targetScope = 'tenant'

param parManagementGroupId string
param parManagementGroupName string
param parParentId string

resource resManagementGroup 'Microsoft.Management/managementGroups@2023-04-01' = {
  name: parManagementGroupId
  properties: {
    displayName: parManagementGroupName
    details: {
      parent: {
        id: '/providers/Microsoft.Management/managementGroups/${parParentId}'
      }
    }
  }
}

output outManagementGroupId string = resManagementGroup.id
