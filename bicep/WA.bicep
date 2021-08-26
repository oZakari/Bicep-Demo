param deploymentInfo object
param stage object

var waInfo = deploymentInfo.waInfo

@batchSize(1)
module AS 'wa-appserviceplan.bicep' = [for (wa, index) in waInfo: {
  name: 'dp-appserviceplan-${wa.name}'
  params: {
    appServicePlanInfo: wa
  }
}]

module PIP 'wa-appservice.bicep' = [for (wa, index) in waInfo: {
  name: 'dp-appservice-${wa.name}'
  params: {
    appServiceInfo: wa
  }
}]


