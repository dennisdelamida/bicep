param rgLocation string = resourceGroup().location
param storageNames array = [
  'contoso'
  'fabrikam'
  'megabric'
]
param bussname array = [
  'yoyo'
  'tomtom'
  'jj'
]

resource createStorages 'Microsoft.Storage/storageAccounts@2021-06-01' = [for name in storageNames: {
  name: '${name}${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]

resource teststrorage 'Microsoft.ServiceBus/namespaces@2021-11-01' = [for name in bussname: {
  name: '${name}${uniqueString(resourceGroup().id)}'
  location: rgLocation
  sku: {
    name: 'Basic' 
  }
  
}]
 
