az login
az account set --subscription "your subscription name"

az group create --name "avd-insights" --location westus

az monitor log-analytics workspace create \
  --resource-group "avd-insights" \
  --workspace-name "avd-insights" \
  --location westus \ 
  --sku-name PerGB2018
