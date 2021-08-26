param appServiceInfo object

resource WS 'Microsoft.Web/sites@2021-01-01' = {
  name: 'wa-${appServiceInfo.name}'
  kind: 'app'
  location: resourceGroup().location
  properties: {
    enabled: true
    httpsOnly: true
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'wa-demo-asp.bicep')
  }
}
