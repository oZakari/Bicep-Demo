param saInfo object

resource SA 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: saInfo.name
  location: resourceGroup().location
  sku: {
    name:'Standard_LRS'
  }
  kind: saInfo.kind
}
