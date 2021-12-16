param deploymentInfo object
param stage object

var saInfo = deploymentInfo.saInfo

module SA 'SA-storageaccount.bicep' = [for (sa, index) in saInfo: {
  name: 'dp-sa-storage-${sa.name}'
  params: {
    saInfo: sa
  }
}] 

output satInfo array = saInfo 
