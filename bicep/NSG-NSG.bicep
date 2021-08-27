param networkSecurityGroupInfo object

resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: 'vn-${networkSecurityGroupInfo.name}'
  location: resourceGroup().location
  properties: {
    securityRules: []
  }
}
