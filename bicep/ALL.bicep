param deploymentInfo object
param stage object

module SA 'SA.bicep' = if (stage.WA == 1) {
  name: 'dp-SA'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
  }
}

module NSG 'NSG.bicep' = if (stage.NSG == 1) {
  name: 'dp-NSG'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
  }
}

module VN 'VN.bicep' = if (stage.VN == 1) {
  name: 'dp-VN'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
  }
  dependsOn: [
    NSG
  ]
}

module ASP 'ASP.bicep' = if (stage.ASP == 1) {
  name: 'dp-ASP'
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
  dependsOn: [
    ASP
  ]
}
