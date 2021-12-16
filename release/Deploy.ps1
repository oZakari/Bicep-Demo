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

Write-Warning -Message "Value of Artifacts is $Artifacts" -Verbose
Write-Warning -Message "Value of RGName is $RGName" -Verbose
Write-Warning -Message "Value of Region is $Region" -Verbose
Write-Warning -Message "Value of Subscription is $Subscription" -Verbose
Get-item -path $Artifacts -Verbose
Get-item -path $TemplateFile -Verbose
Get-item -path $TemplateParameterFile -Verbose

$Params.getenumerator() | ForEach-Object {

    Write-Verbose $_.Key -Verbose

    Write-Warning $_.Value -Verbose

}

Set-AzContext -Subscription $Subscription

New-AzResourceGroup -Name $RGName -Location $Region -Force

New-AzResourceGroupDeployment @Params -TemplateFile "$Artifacts\bicep\SA.bicep"