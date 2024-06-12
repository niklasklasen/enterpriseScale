targetScope = 'tenant'

param parManagementGroupId string
param parManagementGroupName string
param parParentId string

resource managementGroup 'Microsoft.Management/managementGroups@2023-04-01' = {
  name: parManagementGroupId
  properties: {
    displayName: parManagementGroupName
    details: {
      parent: {
        id: parParentId
      }
    }
  }
}

output outManagementGroupId string = managementGroup.id
