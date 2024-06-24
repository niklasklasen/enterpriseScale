using 'main.bicep'

var varTenantRootId = 'contoso' // Tenant root variable must be the same as the scope that the custom policy definitions are deployed to.

// Policy definition parameter

param parPolicyDefinition = [
  {
    name: 'Deny-Subnet-Without-Nsg'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-Subnet-Without-Nsg.json')
  }
  {
    name: 'Deny-MgmtPorts-From-Internet'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-MgmtPorts-From-Internet.json')
  }
  {
    name: 'Deny-VNET-Peer-Cross-Sub'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-VNET-Peer-Cross-Sub.json')
  }
  {
    name: 'Audit-PrivateLinkDnsZones'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Audit-PrivateLinkDnsZones.json')
  }
  {
    name: 'Deploy-Vm-autoShutdown'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Vm-autoShutdown.json')
  }
  {
    name: 'Audit-Disks-UnusedResourcesCostOptimization'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Audit-Disks-UnusedResourcesCostOptimization.json')
  }
  {
    name: 'Audit-PublicIpAddresses-UnusedResourcesCostOptimization'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Audit-PublicIpAddresses-UnusedResourcesCostOptimization.json')
  }
  {
    name: 'Audit-ServerFarms-UnusedResourcesCostOptimization'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Audit-ServerFarms-UnusedResourcesCostOptimization.json')
  }
  {
    name: 'Audit-AzureHybridBenefit'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Audit-AzureHybridBenefit.json')
  }
  {
    name: 'Append-AppService-httpsonly'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Append-AppService-httpsonly.json')
  }
  {
    name: 'Append-AppService-latestTLS'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Append-AppService-latestTLS.json')
  }
  {
    name: 'Deny-AppServiceApiApp-http'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-AppServiceApiApp-http.json')
  }
  {
    name: 'Deny-AppServiceFunctionApp-http'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-AppServiceFunctionApp-http.json')
  }
  {
    name: 'Deny-AppServiceWebApp-http'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-AppServiceWebApp-http.json')
  }
  {
    name: 'Deploy-MySQL-sslEnforcement'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-MySQL-sslEnforcement.json')
  }
  {
    name: 'Deny-MySql-http'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-MySql-http.json')
  }
  {
    name: 'Deploy-PostgreSQL-sslEnforcement'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-PostgreSQL-sslEnforcement.json')
  }
  {
    name: 'Deny-PostgreSql-http'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-PostgreSql-http.json')
  }
  {
    name: 'Append-Redis-sslEnforcement'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Append-Redis-sslEnforcement.json')
  }
  {
    name: 'Append-Redis-disableNonSslPort'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Append-Redis-disableNonSslPort.json')
  }
  {
    name: 'Deny-Redis-http'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-Redis-http.json')
  }
  {
    name: 'Deploy-SqlMi-minTLS'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-SqlMi-minTLS.json')
  }
  {
    name: 'Deny-SqlMi-minTLS'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-SqlMi-minTLS.json')
  }
  {
    name: 'Deploy-SQL-minTLS'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-SQL-minTLS.json')
  }
  {
    name: 'Deny-Sql-minTLS'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-Sql-minTLS.json')
  }
  {
    name: 'Deny-Storage-minTLS'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deny-Storage-minTLS.json')
  }
  {
    name: 'Deploy-Storage-sslEnforcement'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Storage-sslEnforcement.json')
  }
]

// Policy set definition parameter variables

var varPolicySetDefinitionEsEnforceAlzSandboxParameters = loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-ALZ-Sandbox.parameters.json')
var varPolicySetDefinitionEsEnforceAlzDecommParameters = loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-ALZ-Decomm.parameters.json')
var varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters = loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-Guardrails-KeyVault.parameters.json')
var varPolicySetDefinitionEsEnforceACSBParameters = loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-ACSB.parameters.json')
var varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters = loadJsonContent('policySetDefinitions/policy_set_definition_es_Audit-UnusedResourcesCostOptimization.parameters.json')
var varPolicySetDefinitionEsEnforceEncryptTransitParameters = loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-EncryptTransit.parameters.json')
var varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters = loadJsonContent('policySetDefinitions/policy_set_definition_es_Deny-PublicPaaSEndpoints.parameters.json')

// Policy set definition paratmeter

param parPolicySetDefinition = [
  {
    name: 'Enforce-ALZ-Sandbox'
    libSetDefinition: loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-ALZ-Sandbox.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'SandboxDenyVnetPeering'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-VNET-Peer-Cross-Sub'
        definitionParameters: varPolicySetDefinitionEsEnforceAlzSandboxParameters.SandboxDenyVnetPeering.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SandboxNotAllowed'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c112d4e-5bc7-47ae-a041-ea2d9dccd749'
        definitionParameters: varPolicySetDefinitionEsEnforceAlzSandboxParameters.SandboxNotAllowed.parameters
        definitionGroups: []
      }
    ]
  }
  {
    name: 'Enforce-ALZ-Decomm'
    libSetDefinition: loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-ALZ-Decomm.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'DecomShutdownMachines'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Vm-autoShutdown'
        definitionParameters: varPolicySetDefinitionEsEnforceAlzDecommParameters.DecomShutdownMachines.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'DecomDenyResources'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c'
        definitionParameters: varPolicySetDefinitionEsEnforceAlzDecommParameters.DecomDenyResources.parameters
        definitionGroups: []
      }
    ]
  }
  {
    name: 'Enforce-Guardrails-KeyVault'
    libSetDefinition: loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-Guardrails-KeyVault.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'KvCertLifetime'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/12ef42cb-9903-4e39-9c26-422d29570417'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvCertLifetime.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KvFirewallEnabled'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/55615ac9-af46-4a59-874e-391cc3dfb490'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvFirewallEnabled.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KvKeysExpire'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/152b15f7-8e1f-4c1f-ab71-8c010ba5dbc0'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvKeysExpire.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KvKeysLifetime'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5ff38825-c5d8-47c5-b70e-069a21955146'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvKeysLifetime.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KvPurgeProtection'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0b60c0b2-2dc2-4e1c-b5c9-abbed971de53'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvPurgeProtection.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KvSecretsExpire'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/98728c90-32c7-4049-8429-847dc0f4fe37'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvSecretsExpire.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KvSecretsLifetime'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b0eb591a-5e70-4534-a8bf-04b9c489584a'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvSecretsLifetime.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KvSoftDelete'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
        definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvSoftDelete.parameters
        definitionGroups: []
      }
    ]
  }
  {
    name: 'Enforce-ACSB'
    libSetDefinition: loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-ACSB.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'GcIdentity'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3cf2ab00-13f1-4d0c-8971-2ac904541a7e'
        definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.GcIdentity.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'GcLinux'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/331e8ea8-378a-410f-a2e5-ae22f38bb0da'
        definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.GcLinux.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'GcWindows'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/385f5831-96d4-41db-9a3c-cd3af78aaae6'
        definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.GcWindows.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'LinAcsb'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fc9b3da7-8347-4380-8e70-0a0361d8dedd'
        definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.LinAcsb.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'WinAcsb'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/72650e9f-97bc-4b2a-ab5f-9781a9fcecbc'
        definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.WinAcsb.parameters
        definitionGroups: []
      }
    ]
  }
  {
    name: 'Audit-UnusedResources'
    libSetDefinition: loadJsonContent('policySetDefinitions//policy_set_definition_es_Audit-UnusedResourcesCostOptimization.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'AuditAzureHybridBenefitUnusedResourcesCostOptimization'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Audit-AzureHybridBenefit'
        definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditAzureHybridBenefitUnusedResourcesCostOptimization.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AuditDisksUnusedResourcesCostOptimization'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Audit-Disks-UnusedResources'
        definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditDisksUnusedResourcesCostOptimization.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AuditPublicIpAddressesUnusedResourcesCostOptimization'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Audit-PIP-UnusedResources'
        definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditPublicIpAddressesUnusedResourcesCostOptimization.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AuditServerFarmsUnusedResourcesCostOptimization'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Audit-SF-UnusedResources'
        definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditServerFarmsUnusedResourcesCostOptimization.parameters
        definitionGroups: []
      }
    ]
  }
  {
    name: 'Enforce-EncryptTransit'
    libSetDefinition: loadJsonContent('policySetDefinitions/policy_set_definition_es_Enforce-EncryptTransit.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'AKSIngressHttpsOnlyEffect'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1a5b4dca-0b6f-4cf5-907c-56316bc1bf3d'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.AKSIngressHttpsOnlyEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'APIAppServiceHttpsEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceApiApp-http'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.APIAppServiceHttpsEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AppServiceHttpEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-httpsonly'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.AppServiceHttpEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AppServiceminTlsVersion'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-latestTLS'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.AppServiceminTlsVersion.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'FunctionLatestTlsEffect'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.FunctionLatestTlsEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'FunctionServiceHttpsEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceFunctionApp-http'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.FunctionServiceHttpsEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MySQLEnableSSLDeployEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MySQL-sslEnforcement'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.MySQLEnableSSLDeployEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MySQLEnableSSLEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-MySql-http'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.MySQLEnableSSLEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'PostgreSQLEnableSSLDeployEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-PostgreSQL-sslEnforcement'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.PostgreSQLEnableSSLDeployEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'PostgreSQLEnableSSLEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-PostgreSql-http'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.PostgreSQLEnableSSLEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'RedisDenyhttps'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Redis-http'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.RedisDenyhttps.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'RedisdisableNonSslPort'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-disableNonSslPort'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.RedisdisableNonSslPort.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'RedisTLSDeployEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-sslEnforcement'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.RedisTLSDeployEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SQLManagedInstanceTLSDeployEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SqlMi-minTLS'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLManagedInstanceTLSDeployEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SQLManagedInstanceTLSEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-SqlMi-minTLS'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLManagedInstanceTLSEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SQLServerTLSDeployEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SQL-minTLS'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLServerTLSDeployEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SQLServerTLSEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Sql-minTLS'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLServerTLSEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageDeployHttpsEnabledEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Storage-sslEnforcement'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.StorageDeployHttpsEnabledEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageHttpsEnabledEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-minTLS'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.StorageHttpsEnabledEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'WebAppServiceHttpsEffect'
        definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceWebApp-http'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.WebAppServiceHttpsEffect.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'WebAppServiceLatestTlsEffect'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
        definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.WebAppServiceLatestTlsEffect.parameters
        definitionGroups: []
      }
    ]
  }
  {
    name: 'Deny-PublicPaaSEndpoints'
    libSetDefinition: loadJsonContent('policySetDefinitions/policy_set_definition_es_Deny-PublicPaaSEndpoints.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'ACRDenyPaasPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0fdf0491-d080-4575-b627-ad0e843cba0f'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.ACRDenyPaasPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AFSDenyPaasPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/21a8cd35-125e-4d13-b82d-2e19b7208bb7'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AFSDenyPaasPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AKSDenyPaasPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/040732e8-d947-40b8-95d6-854c95024bf8'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AKSDenyPaasPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'ApiManDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/df73bd95-24da-4a4f-96b9-4e8b94b402bd'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.ApiManDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AppConfigDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3d9f5e4c-9947-4579-9539-2a7695fbc187'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AppConfigDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AsDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b5ef780-c53c-4a64-87f3-bb9c8c8094ba'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AsDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AseDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2d048aca-6479-4923-88f5-e2ac295d9af3'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AseDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AutomationDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/955a914f-bf86-4f0e-acd5-e0766b0efcb6'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AutomationDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'BatchDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/74c5a0ae-5e48-4738-b093-65e23a060488'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.BatchDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'BotServiceDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e8168db-69e3-4beb-9822-57cb59202a9d'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.BotServiceDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'CosmosDenyPaasPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/797b37f7-06b8-444c-b1ad-fc62867f335a'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.CosmosDenyPaasPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'FunctionDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/969ac98b-88a8-449f-883c-2e9adb123127'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.FunctionDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'KeyVaultDenyPaasPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/405c5871-3e91-4644-8a63-58e19d68ff5b'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.KeyVaultDenyPaasPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MariaDbDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fdccbe47-f3e3-4213-ad5d-ea459b2fa077'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.MariaDbDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MlDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/438c38d2-3772-465a-a9cc-7a6666a275ce'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.MlDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'MySQLFlexDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c9299215-ae47-4f50-9c54-8a392f68a052'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.MySQLFlexDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'PostgreSQLFlexDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e1de0e3-42cb-4ebc-a86d-61d0c619ca48'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.PostgreSQLFlexDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'RedisCacheDenyPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/470baccb-7e51-4549-8b1a-3e5be069f663'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.RedisCacheDenyPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'SqlServerDenyPaasPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b8ca024-1d5c-4dec-8995-b1a932b41780'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.SqlServerDenyPaasPublicIP.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'StorageDenyPaasPublicIP'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b2982f36-99f2-4db5-8eff-283140c09693'
        definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.StorageDenyPaasPublicIP.parameters
        definitionGroups: []
      }
    ]
  }
]
