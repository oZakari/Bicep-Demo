param deploymentInfo object
param stage object

var aspInfo = deploymentInfo.aspInfo

module asp 'ASP-appserviceplan.bicep' = [for (asp, index) in aspInfo: {
  name: 'dp-asp-${asp.name}'
  params: {
    appServicePlanInfo: asp
  }
}]


