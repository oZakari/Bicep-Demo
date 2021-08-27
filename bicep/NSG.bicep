param deploymentInfo object
param stage object

var nsgInfo = deploymentInfo.vnInfo

module NSG 'NSG-NSG.bicep' = [for (nsg, index) in nsgInfo: {
  name: 'dp-nsg-${nsg.name}'
  params: {
    networkSecurityGroupInfo: nsg
  }
}]


