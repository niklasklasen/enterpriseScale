using 'main.bicep'

// Development - Loop through all files in policyDefinitions
var varTenantRootId = 'd7cfa7c7-1c24-448a-8f1d-01e4c1803842' // Tenant root variable must be the same as the scope that the custom policy definitions are deployed to.

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
    name: 'Deploy-Diagnostics-AVDScalingPlans'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-AVDScalingPlans.json')
  }
  {
    name: 'Deploy-Diagnostics-WVDAppGroup'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-WVDAppGroup.json')
  }
  {
    name: 'Deploy-Diagnostics-WVDWorkspace'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-WVDWorkspace.json')
  }
  {
    name: 'Deploy-Diagnostics-WVDHostPools'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-WVDHostPools.json')
  }
  {
    name: 'Deploy-Diagnostics-ACI'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-ACI.json')
  }
  {
    name: 'Deploy-Diagnostics-ACR'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-ACR.json')
  }
  {
    name: 'Deploy-Diagnostics-AnalysisService'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-AnalysisService.json')
  }
  {
    name: 'Deploy-Diagnostics-ApiForFHIR'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-ApiForFHIR.json')
  }
  {
    name: 'Deploy-Diagnostics-APIMgmt'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-APIMgmt.json')
  }
  {
    name: 'Deploy-Diagnostics-ApplicationGateway'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-ApplicationGateway.json')
  }
  {
    name: 'Deploy-Diagnostics-AA'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-AA.json')
  }
  {
    name: 'Deploy-Diagnostics-Bastion'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-Bastion.json')
  }
  {
    name: 'Deploy-Diagnostics-CDNEndpoints'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-CDNEndpoints.json')
  }
  {
    name: 'Deploy-Diagnostics-CognitiveServices'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-CognitiveServices.json')
  }
  {
    name: 'Deploy-Diagnostics-CosmosDB'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-CosmosDB.json')
  }
  {
    name: 'Deploy-Diagnostics-Databricks'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-Databricks.json')
  }
  {
    name: 'Deploy-Diagnostics-DataExplorerCluster'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-DataExplorerCluster.json')
  }
  {
    name: 'Deploy-Diagnostics-DataFactory'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-DataFactory.json')
  }
  {
    name: 'Deploy-Diagnostics-DLAnalytics'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-DLAnalytics.json')
  }
  {
    name: 'Deploy-Diagnostics-EventGridSub'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-EventGridSub.json')
  }
  {
    name: 'Deploy-Diagnostics-EventGridTopic'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-EventGridTopic.json')
  }
  {
    name: 'Deploy-Diagnostics-EventGridSystemTopic'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-EventGridSystemTopic.json')
  }
  {
    name: 'Deploy-Diagnostics-ExpressRoute'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-ExpressRoute.json')
  }
  {
    name: 'Deploy-Diagnostics-Firewall'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-Firewall.json')
  }
  {
    name: 'Deploy-Diagnostics-FrontDoor'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-FrontDoor.json')
  }
  {
    name: 'Deploy-Diagnostics-Function'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-Function.json')
  }
  {
    name: 'Deploy-Diagnostics-HDInsight'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-HDInsight.json')
  }
  {
    name: 'Deploy-Diagnostics-iotHub'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-iotHub.json')
  }
  {
    name: 'Deploy-Diagnostics-LoadBalancer'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-LoadBalancer.json')
  }
  {
    name: 'Deploy-Diagnostics-LogAnalyticsWorkspace'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-LogAnalyticsWorkspace.json')
  }
  {
    name: 'Deploy-Diagnostics-LogicAppsISE'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-LogicAppsISE.json')
  }
  {
    name: 'Deploy-Diagnostics-MariaDB'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-MariaDB.json')
  }
  {
    name: 'Deploy-Diagnostics-MediaService'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-MediaService.json')
  }
  {
    name: 'Deploy-Diagnostics-MlWorkspace'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-MlWorkspace.json')
  }
  {
    name: 'Deploy-Diagnostics-MySQL'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-MySQL.json')
  }
  {
    name: 'Deploy-Diagnostics-NetworkSecurityGroups'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-NetworkSecurityGroups.json')
  }
  {
    name: 'Deploy-Diagnostics-NIC'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-NIC.json')
  }
  {
    name: 'Deploy-Diagnostics-PostgreSQL'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-PostgreSQL.json')
  }
  {
    name: 'Deploy-Diagnostics-PowerBIEmbedded'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-PowerBIEmbedded.json')
  }
  {
    name: 'Deploy-Diagnostics-RedisCache'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-RedisCache.json')
  }
  {
    name: 'Deploy-Diagnostics-Relay'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-Relay.json')
  }
  {
    name: 'Deploy-Diagnostics-SignalR'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-SignalR.json')
  }
  {
    name: 'Deploy-Diagnostics-SQLElasticPools'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-SQLElasticPools.json')
  }
  {
    name: 'Deploy-Diagnostics-SQLMI'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-SQLMI.json')
  }
  {
    name: 'Deploy-Diagnostics-TimeSeriesInsights'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-TimeSeriesInsights.json')
  }
  {
    name: 'Deploy-Diagnostics-TrafficManager'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-TrafficManager.json')
  }
  {
    name: 'Deploy-Diagnostics-VirtualNetwork'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-VirtualNetwork.json')
  }
  {
    name: 'Deploy-Diagnostics-VM'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-VM.json')
  }
  {
    name: 'Deploy-Diagnostics-VMSS'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-VMSS.json')
  }
  {
    name: 'Deploy-Diagnostics-VNetGW'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-VNetGW.json')
  }
  {
    name: 'Deploy-Diagnostics-WebServerFarm'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-WebServerFarm.json')
  }
  {
    name: 'Deploy-Diagnostics-Website'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-Website.json')
  }
  {
    name: 'Deploy-Diagnostics-VWanS2SVPNGW'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-Diagnostics-VWanS2SVPNGW.json')
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
  {
    name: 'Deploy-ASC-SecurityContacts'
    libDefinition: loadJsonContent('policyDefinitions/policy_definition_es_Deploy-ASC-SecurityContacts.json')
  }
]
