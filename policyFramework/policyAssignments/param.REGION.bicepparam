using 'main.bicep'

// Management Groups, used for policy scope
var varMangmtGroupIds = {
  root: 'contoso'
  platform: 'contoso-platform'
  platformIdentity: 'contoso-platform-identity'
  platformManagement: 'contoso-platform-management'
  platformConnectivity: 'contoso-platform-connectivity'
  landingZones: 'contoso-landing-zones'
  landingZonesCorp: 'contoso-landing-zones-corp'
  landingZonesOnline: 'contoso-landing-zones-online'
  decommissioned: 'contoso-decommisioned'
  sandbox: 'contoso-sandbox'
}

// var varTenantRootId = '4d7d49f0-57c4-41e8-86b7-74fe38a737a5'


// Policy Assignments - Built In Policies
param parPolicyAssignmentsBuiltIn = [
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c112d4e-5bc7-47ae-a041-ea2d9dccd749'
    scope: varMangmtGroupIds.platformIdentity
    name: 'Deny-Public-IP'
    description: 'This policy denies creation of Public IPs under the assigned scope.'
    displayName: 'Deny the creation of public IP'
    enforcementMode: 'Default'
    idetityType: 'None'
    location: 'null'
    userAssignedIdentity: {}
    parameters: {
      effect: {
        value: 'Deny'
      }
      listOfResourceTypesNotAllowed: {
        value: [
          'Microsoft.Network/publicIPAddresses'
        ]
      }
    }
  }
  { // Add Deny IP forwarding to Management?
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/88c0b9da-ce96-4b03-9635-f29a937e2900'
    scope: varMangmtGroupIds.landingZones
    name: 'Deny-IP-Forwarding'
    description: 'This policy denies the network interfaces which enabled IP forwarding. The setting of IP forwarding disables Azures check of the source and destination for a network interface. This should be reviewed by the network security team."'
    displayName: 'Network interfaces should disable IP forwarding'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {}
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9'
    scope: varMangmtGroupIds.landingZones
    name: 'Deny-Storage-http'
    description: 'Audit requirement of Secure transfer in your storage account. Secure transfer is an option that forces your storage account to accept requests only from secure connections (HTTPS). Use of HTTPS ensures authentication between the server and the service and protects data in transit from network layer attacks such as man-in-the-middle, eavesdropping, and session-hijacking.'
    displayName: 'Secure transfer to storage accounts should be enabled'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {
      effect: {
        value: 'Deny'
      }
    }
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/36d49e87-48c4-4f2e-beed-ba4ed02b71f5'
    scope: varMangmtGroupIds.landingZones
    name: 'Deploy-SQL-Threat'
    description: 'This policy ensures that Threat Detection is enabled on SQL Servers.'
    displayName: 'Deploy Threat Detection on SQL servers'
    enforcementMode: 'Default'
    idetityType: 'SystemAssigned'
    userAssignedIdentity: {}
    location: 'westeurope'
    parameters: {}
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
    scope: varMangmtGroupIds.landingZones
    name: 'Audit-AppGW-WAF'
    description: 'Assign the WAF should be enabled for Application Gateway audit policy.'
    displayName: 'Web Application Firewall (WAF) should be enabled for Application Gateway'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {
      effect: {
        value: 'Audit'
      }
    }
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/83a86a26-fd1f-447c-b59d-e51f44264114'
    scope: varMangmtGroupIds.landingZonesCorp
    name: 'Deny-Public-IP-On-NIC'
    description: 'This policy denies network interfaces from having a public IP associated to it under the assigned scope.'
    displayName: 'Deny network interfaces having a public IP associated'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {}
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c112d4e-5bc7-47ae-a041-ea2d9dccd749'
    scope: varMangmtGroupIds.landingZonesCorp
    name: 'Deny-HybridNetworking'
    description: 'Denies deployment of vWAN/ER/VPN gateway resources in the Corp landing zone.'
    displayName: 'Deny the deployment of vWAN/ER/VPN gateway resources'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {      
      listOfResourceTypesNotAllowed: {
        value: [
          'microsoft.network/expressroutecircuits'
          'microsoft.network/expressroutegateways'
          'microsoft.network/expressrouteports'
          'microsoft.network/virtualwans'
          'microsoft.network/vpngateways'
          'microsoft.network/p2svpngateways'
          'microsoft.network/vpnsites'
          'microsoft.network/virtualnetworkgateway'
        ]
      }
      effect: {
        value: 'Deny'
      }
    }
  }
  {
    definitionId: 'providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8'
    scope: varMangmtGroupIds.root
    name: 'Deploy-ASC-Monitoring'
    description: 'Enable Monitoring in Microsoft Defender for Cloud.'
    displayName: 'Enable Monitoring in Microsoft Defender for Cloud'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {}
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policySetDefinitions/e77fc0b3-f7e9-4c58-bc13-cb753ed8e46e'
    scope: varMangmtGroupIds.root
    name: 'Deploy-MDFC-OssDb'
    description: 'Enable Advanced Threat Protection on your non-Basic tier open-source relational databases to detect anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases. See https://aka.ms/AzDforOpenSourceDBsDocu.'
    displayName: 'Configure Advanced Threat Protection to be enabled on open-source relational databases'
    enforcementMode: 'Default'
    idetityType: 'SystemAssigned'
    userAssignedIdentity: {}
    location: 'westeurope'
    parameters: {}
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policySetDefinitions/9cb3cc7a-b39b-4b82-bc89-e5a5d9ff7b97'
    scope: varMangmtGroupIds.root
    name: 'Deploy-MDFC-SqlAtp'
    description: 'Enable Azure Defender on your SQL Servers and SQL Managed Instances to detect anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases.'
    displayName: 'Configure Azure Defender to be enabled on SQL Servers and SQL Managed Instances'
    enforcementMode: 'Default'
    idetityType: 'SystemAssigned'
    userAssignedIdentity: {}
    location: 'westeurope'
    parameters: {}
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d'
    scope: varMangmtGroupIds.root
    name: 'Deny-UnmanagedDisk'
    description: 'Deny virtual machines that do not use managed disk. It checks the managed disk property on virtual machine OS Disk fields.'
    displayName: 'Deny virtual machines and virtual machine scale sets that do not use managed disk'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {}
  }
  {
    definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c112d4e-5bc7-47ae-a041-ea2d9dccd749'
    scope: varMangmtGroupIds.root
    name: 'Deny-Classic-Resources'
    description: 'Denies deployment of classic resource types under the assigned scope.'
    displayName: 'Deny the deployment of classic resource'
    enforcementMode: 'Default'
    idetityType: 'None'
    userAssignedIdentity: {}
    location: 'null'
    parameters: {
      listOfResourceTypesNotAllowed: {
        value: [
          'Microsoft.ClassicCompute/capabilities'
          'Microsoft.ClassicCompute/checkDomainNameAvailability'
          'Microsoft.ClassicCompute/domainNames'
          'Microsoft.ClassicCompute/domainNames/capabilities'
          'Microsoft.ClassicCompute/domainNames/internalLoadBalancers'
          'Microsoft.ClassicCompute/domainNames/serviceCertificates'
          'Microsoft.ClassicCompute/domainNames/slots'
          'Microsoft.ClassicCompute/domainNames/slots/roles'
          'Microsoft.ClassicCompute/domainNames/slots/roles/metricDefinitions'
          'Microsoft.ClassicCompute/domainNames/slots/roles/metrics'
          'Microsoft.ClassicCompute/moveSubscriptionResources'
          'Microsoft.ClassicCompute/operatingSystemFamilies'
          'Microsoft.ClassicCompute/operatingSystems'
          'Microsoft.ClassicCompute/operations'
          'Microsoft.ClassicCompute/operationStatuses'
          'Microsoft.ClassicCompute/quotas'
          'Microsoft.ClassicCompute/resourceTypes'
          'Microsoft.ClassicCompute/validateSubscriptionMoveAvailability'
          'Microsoft.ClassicCompute/virtualMachines'
          'Microsoft.ClassicCompute/virtualMachines/diagnosticSettings'
          'Microsoft.ClassicCompute/virtualMachines/metricDefinitions'
          'Microsoft.ClassicCompute/virtualMachines/metrics'
          'Microsoft.ClassicInfrastructureMigrate/classicInfrastructureResources'
          'Microsoft.ClassicNetwork/capabilities'
          'Microsoft.ClassicNetwork/expressRouteCrossConnections'
          'Microsoft.ClassicNetwork/expressRouteCrossConnections/peerings'
          'Microsoft.ClassicNetwork/gatewaySupportedDevices'
          'Microsoft.ClassicNetwork/networkSecurityGroups'
          'Microsoft.ClassicNetwork/operations'
          'Microsoft.ClassicNetwork/quotas'
          'Microsoft.ClassicNetwork/reservedIps'
          'Microsoft.ClassicNetwork/virtualNetworks'
          'Microsoft.ClassicNetwork/virtualNetworks/remoteVirtualNetworkPeeringProxies'
          'Microsoft.ClassicNetwork/virtualNetworks/virtualNetworkPeerings'
          'Microsoft.ClassicStorage/capabilities'
          'Microsoft.ClassicStorage/checkStorageAccountAvailability'
          'Microsoft.ClassicStorage/disks'
          'Microsoft.ClassicStorage/images'
          'Microsoft.ClassicStorage/operations'
          'Microsoft.ClassicStorage/osImages'
          'Microsoft.ClassicStorage/osPlatformImages'
          'Microsoft.ClassicStorage/publicImages'
          'Microsoft.ClassicStorage/quotas'
          'Microsoft.ClassicStorage/storageAccounts'
          'Microsoft.ClassicStorage/storageAccounts/blobServices'
          'Microsoft.ClassicStorage/storageAccounts/fileServices'
          'Microsoft.ClassicStorage/storageAccounts/metricDefinitions'
          'Microsoft.ClassicStorage/storageAccounts/metrics'
          'Microsoft.ClassicStorage/storageAccounts/queueServices'
          'Microsoft.ClassicStorage/storageAccounts/services'
          'Microsoft.ClassicStorage/storageAccounts/services/diagnosticSettings'
          'Microsoft.ClassicStorage/storageAccounts/services/metricDefinitions'
          'Microsoft.ClassicStorage/storageAccounts/services/metrics'
          'Microsoft.ClassicStorage/storageAccounts/tableServices'
          'Microsoft.ClassicStorage/storageAccounts/vmImages'
          'Microsoft.ClassicStorage/vmImages'
          'Microsoft.ClassicSubscription/operations'
        ]      
      }
      effect: {
        value: 'Deny'
      }
    }
  }
]
