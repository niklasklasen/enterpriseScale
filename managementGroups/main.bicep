targetScope = 'tenant'

@description('Tenant ID of the Tenant where the Management Group structur is to be built in.')
param parTenantRootId string

@description('Top level Management Group name, replacement for Contoso in the presentation material')
param parParentManagementGroupName string

@description('Management Group ID for the top level Management Group. No spaces are allowed.')
param parParentManagementGroupId string

var varManagementGroups = [
  { // Company Root Management Group
    name: '${parParentManagementGroupId}-Deployment'
    displayName: parParentManagementGroupName
    id: parParentManagementGroupId
    parentId: parTenantRootId
  }
  { // Platform Management Group
    name: 'Platform-MG-Deployment'
    displayName: 'Platform'
    id: '${parParentManagementGroupId}-platform'
    parentId: parParentManagementGroupId
  }
  { // Landing Zone Management Group
    name: 'LandingZone-MG-Deployment'
    displayName: 'Landing Zone'
    id: '${parParentManagementGroupId}-landingZone'
    parentId: parParentManagementGroupId
  }
  { // Decommissioned Management Group
    name: 'Decommissioned-MG-Deployment'
    displayName: 'Decommissioned'
    id: '${parParentManagementGroupId}-decommissioned'
    parentId: parParentManagementGroupId
  }
  { // Sandbox Management Group
    name: 'Sandbox-MG-Deployment'
    displayName: 'Sandbox'
    id: '${parParentManagementGroupId}-sandbox'
    parentId: parParentManagementGroupId
  }
  { // Connectivity Management Group
    name: 'Connectivity-MG-Deployment'
    displayName: 'Connectivity'
    id: '${parParentManagementGroupId}-connectivity'
    parentId: '${parParentManagementGroupId}-platform'
  }
  { // Identity Management Group
    name: 'Identity-MG-Deployment'
    displayName: 'Identity'
    id: '${parParentManagementGroupId}-identity'
    parentId: '${parParentManagementGroupId}-platform'
  }
  { // Management Management Group
    name: 'Management-MG-Deployment'
    displayName: 'Management'
    id: '${parParentManagementGroupId}-management'
    parentId: '${parParentManagementGroupId}-platform'
  }
  { // Online Management Group
    name: 'Online-MG-Deployment'
    displayName: 'Online'
    id: '${parParentManagementGroupId}-online'
    parentId: '${parParentManagementGroupId}-landingZone'
  }
  { // Corp Management Group
    name: 'Corp-MG-Deployment'
    displayName: 'Corp'
    id: '${parParentManagementGroupId}-corp'
    parentId: '${parParentManagementGroupId}-landingZone'
  }
]

// Module to deploy Management Groups
@batchSize(1)
module modParentManagementGroup '../_modules/managementGroup/managementGroup.bicep' = [for managementGroup in varManagementGroups: {
  name: managementGroup.name
  params: {
    parManagementGroupId: managementGroup.id
    parManagementGroupName: managementGroup.displayName
    parParentId: managementGroup.parentId
  }
}]
