param deploymentInfo object
param stage object

var waInfo = deploymentInfo.waInfo

module PIP 'wa-appservice.bicep' = [for (wa, index) in waInfo: {
  name: 'dp-wa-appservice-${wa.name}'
  params: {
    webappinfo: wa
  }
}]


