param deploymentInfo object
param stage object

module VN 'VN.bicep' = if (stage.VN == 1) {
  name: 'dp-VN'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
  }
}

module WA 'WA.bicep' = if (stage.WA == 1) {
  name: 'dp-WA'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
  }
}
