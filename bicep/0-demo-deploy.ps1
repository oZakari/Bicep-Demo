$rgname = 'dev-bicep-demo'
$region = 'CentralUS'
Write-Warning -Message "RG is: [$rgname] in Region: [$region]"

$MyParametersDeployALL = @{
    ResourceGroupName     = $rgname
    TemplateParameterFile = "C:\Repos\Bicep-Demo\Bicep-Demo\bicep\0-param-dev-env.json"
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

# Deploy Single layer, inner dev loop - WA only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\WA.bicep

# Deploy Single layer, inner dev loop - SA only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\SA.bicep