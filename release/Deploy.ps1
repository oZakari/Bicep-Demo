param (
    [string]$Artifacts = (Get-Item -Path $PSScriptRoot | ForEach-Object Parent | ForEach-Object FullName),
    [string]$Region = "Central US",
    [string]$RGName = "dev-bicep-demo"
)

$TemplateFile = "$Artifacts/bicep/SA.bicep"
$TemplateParameterFile = "$Artifacts/bicep/0-param-dev-env.json"

$Params = @{
    ResourceGroupName     = $RGName
    TemplateParameterFile = $TemplateParameterFile
    TemplateFile          = $TemplateFile
    Verbose               = $true
    WhatIf                = $false
}
$Params.getenumerator() | ForEach-Object {
    Write-Verbose $_.Key -Verbose
    Write-Warning $_.Value 
}
Write-Warning -Message "Value of Artifacts is $Artifacts" 
Write-Warning -Message "Value of RGName is $RGName" 
Write-Warning -Message "Value of Region is $Region" 
Get-item -path $Artifacts 
Get-item -path $TemplateFile
Get-item -path $TemplateParameterFile

New-AzResourceGroup -Name $RGName -Location $Region -Force

New-AzResourceGroupDeployment @Params