param (
    [string]$Artifacts = (Get-Item -Path $PSScriptRoot | ForEach-Object Parent | ForEach-Object FullName),
    [string]$Subscription = "ES-CE-LR-INT-ZTROCINSKI",
    [string]$Region = "Central US",
    [string]$RGName = "dev-bicep-demo"
)

$Params = @{
    ResourceGroupName     = $RGName
    TemplateParameterFile = "$Artifacts\bicep\0-param-dev-env.json"
    Verbose               = $true
    WhatIf                = $false
}

Set-AzContext -Subscription $Subscription

New-AzResourceGroup -Name $RGName -Location $Region -Force

Write-Warning -Message "Value of Artifacts is $Artifacts"

New-AzResourceGroupDeployment @Params -TemplateFile "$Artifacts\bicep\SA.bicep"