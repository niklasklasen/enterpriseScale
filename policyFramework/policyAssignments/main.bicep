targetScope = 'managementGroup'


param parPolicyAssignmentsBuiltIn array
param parPolicyAssignmentsCustom array

module modPolicyAssignmentBuiltIn '../../_modules/policyAssignment/policyAssignment.bicep' = [for policy in parPolicyAssignmentsBuiltIn: {
  scope: managementGroup(policy.scope)
  name: '${policy.name}-Deployment'
  params: {
    parPolicyAssignmentDefinitionId: policy.definitionId
    parPolicyAssignmentDescription: policy.description
    parPolicyAssignmentEnforcementMode: policy.enforcementMode
    parPolicyAssignmentIdentityType: policy.idetityType
    parPolicyAssignmentLocation: policy.location
    parPolicyAssignmentName: policy.name
    parPolicyAssingmentParameters: policy.parameters
  }
}]

module modPolicyAssignmentCustom '../../_modules/policyAssignment/policyAssignment.bicep' = [for policy in parPolicyAssignmentsCustom: {
  scope: managementGroup(policy.scope)
  name: '${policy.name}-Deployment'
  params: {
    parPolicyAssignmentDefinitionId: policy.definitionId
    parPolicyAssignmentDescription: policy.description
    parPolicyAssignmentEnforcementMode: policy.enforcementMode
    parPolicyAssignmentIdentityType: policy.idetityType
    parPolicyAssignmentLocation: policy.location
    parPolicyAssignmentName: policy.name
    parPolicyAssingmentParameters: policy.parameters
  }
}]
