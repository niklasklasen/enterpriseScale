targetScope = 'managementGroup'

param parPolicyDefinition array
param parPolicySetDefinition array

module modPolicyDefinition '../../_modules/policyDefinition/policyDefinition.bicep' = [for policy in parPolicyDefinition: {
  name: '${policy.libDefinition.name}-Deployment'
  params: {
    parDescription: policy.libDefinition.properties.description
    parDisplayName: policy.libDefinition.properties.displayName
    parMetadata: policy.libDefinition.properties.metadata
    parMode: policy.libDefinition.properties.mode
    parParameters: policy.libDefinition.properties.parameters
    parPolicyName: policy.libDefinition.name
    parPolicyRule: policy.libDefinition.properties.policyRule
    parPolicyType: policy.libDefinition.properties.policyType
  }
}]

module modPolicySetDefinition '../../_modules/policySetDefinition/policySetDefinition.bicep' = [for policySet in parPolicySetDefinition: {
  dependsOn: [
    modPolicyDefinition
  ]
  name: '${policySet.libSetDefinition.name}-Deployment'
  params: {
    parPolicySetChildDefinitions: policySet.libSetChildDefinitions
    parPolicySetDescription: policySet.libSetDefinition.properties.description
    parPolicySetDefinitionGroups: policySet.libSetDefinition.properties.policyDefinitionGroups
    parPolicySetDisplayName: policySet.libSetDefinition.properties.displayName
    parPolicySetMetadata: policySet.libSetDefinition.properties.metadata
    parPolicySetName: policySet.libSetDefinition.name
    parPolicySetParameters: policySet.libSetDefinition.properties.parameters
    parPolicySetType: policySet.libSetDefinition.properties.policyType
  }
}]
