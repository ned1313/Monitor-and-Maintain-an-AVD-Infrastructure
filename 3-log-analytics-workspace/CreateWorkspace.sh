az login
az account set --subscription "your subscription name"

az group create --name "avd-insights" --location westus

az monitor log-analytics workspace create \
  --resource-group myresourcegroup \
  --workspace-name "avd-insights" \
  --location westus \
  --sku-capacity 1000 \
  --sku-name PerGB2018
