param webappinfo object

resource ASP 'Microsoft.Web/serverfarms@2021-01-15' existing = {
  name: 'asp-${webappinfo.asp}'
}

resource WS 'Microsoft.Web/sites@2021-01-01' = {
  name: 'wa-${webappinfo.name}'
  kind: 'app'
  location: resourceGroup().location
  properties: {
    enabled: true
    httpsOnly: true
    serverFarmId: ASP.id
  }
}
