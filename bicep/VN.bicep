param deploymentInfo object
param stage object

var vnInfo = deploymentInfo.vnInfo

@batchSize(1)
module AS 'VN-networksecuritygroup.bicep' = [for (vn, index) in vnInfo: {
  name: 'dp-networksecuritygroup-${vn.name}'
  params: {
    networkSecurityGroupInfo: vn
  }
}]

module PIP 'VN-virtualnetwork.bicep' = [for (vn, index) in vnInfo: {
  name: 'dp-virtualnetwork-${vn.name}'
  params: {
    virtualNetworkInfo: vn
  }
}]


