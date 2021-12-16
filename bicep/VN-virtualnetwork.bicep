param virtualNetworkInfo object

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: 'vn-${virtualNetworkInfo.name}'
  location: resourceGroup().location
  tags: {
    tagName1: 'Demo'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [ 
        '10.10.0.0/16'
      ]
    }
    subnets: [
      { 
        name: 'Subnet1'
        properties: {
          addressPrefix: '10.10.5.0/24'
        }
      }
    ]
  }
}
