$resourceGroupName = "avd-insights"
$workspaceName = "avd-insights"
$location = "westus"
$sku = "PerGB2018"
$subName = "SubscriptionName"

Add-AzAccount

Get-AzSubscription -SubscriptionName $subName | Select-AzSubscription

New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzOperationalInsightsWorkspace `
    -ResourceGroupName $resourceGroupName `
    -Name $workspaceName `
    -Location $location `
    -Sku $sku
