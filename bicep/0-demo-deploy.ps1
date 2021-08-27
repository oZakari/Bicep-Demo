$rgname = 'bicepdemo'
$region = 'CentralUS'
Write-Warning -Message "Path is: [$artifacts1]"
Write-Warning -Message "RG is: [$rgname] in Region: [$region]"

$MyParametersDeployALL = @{
    ResourceGroupName     = $rgname
    TemplateParameterFile = "$artifacts1\0-param-env1.json"
    Verbose               = $true
    WhatIf                = $false
}

break

New-AzResourceGroup -Name $rgname -Location $region -Force

# Orchestrate the deployment of all resources - VM and Storage or other
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\ALL.bicep

# Deploy Single layer, inner dev loop - VM only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\VN.bicep

# Deploy Single layer, inner dev loop - Storage only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\ASP.bicep

# Deploy Single layer, inner dev loop -  only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\WA.bicep