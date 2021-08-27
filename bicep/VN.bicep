param deploymentInfo object
param stage object

var vnInfo = deploymentInfo.vnInfo

module PIP 'VN-virtualnetwork.bicep' = [for (vn, index) in vnInfo: {
  name: 'dp-vn-virtualnetwork-${vn.name}'
  params: {
    virtualNetworkInfo: vn
  }
}]


