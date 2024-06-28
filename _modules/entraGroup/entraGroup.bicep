provider microsoftGraph

param parDisplayName string
param parMailEnabled bool = false
param parMailNickname string = parUniqueName
param parSecurityEnabled bool = true
param parUniqueName string

resource resEntraGroup 'Microsoft.Graph/groups@v1.0' = {
  displayName: parDisplayName
  mailEnabled: parMailEnabled
  mailNickname: parMailNickname
  securityEnabled: parSecurityEnabled
  uniqueName: parUniqueName
}
