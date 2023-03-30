$resourceGroupName = "avd-insights"
$workspaceName = "avd-insights"
$location = "westus"
$skuName = "PerGB2018"
$skuCapacity = 1000

New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzOperationalInsightsWorkspace `
    -ResourceGroupName $resourceGroupName `
    -WorkspaceName $workspaceName `
    -Location $location `
    -SkuName $skuName `
    -SkuCapacity $skuCapacity
