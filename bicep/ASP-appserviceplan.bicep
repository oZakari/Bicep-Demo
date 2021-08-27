param appServicePlanInfo object

resource ASP 'Microsoft.Web/serverfarms@2021-01-01' = {
  name: 'asp-${appServicePlanInfo.name}'
  location: resourceGroup().location
  kind: 'app'
  properties: {
    perSiteScaling: false
    targetWorkerCount: 0
    maximumElasticWorkerCount: 1
  }
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 1
  }
}
