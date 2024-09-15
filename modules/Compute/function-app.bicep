import  { teamTags } from '../../types/types.bicep'

param functionAppName string

param appServiceName string

resource appService 'Microsoft.Web/serverfarms@2022-09-01' existing = {  
  name: appServiceName
}

param storageAccountName string

param tags teamTags

resource storageAccount 'Microsoft.Web/serverfarms@2022-09-01' existing = {  
  name: storageAccountName
}

module site 'br/public:avm/res/web/site:0.8.0' = {
  name: 'FunctionApp'
  params: {
    // Required parameters
    kind: 'functionapp'
    name: functionAppName
    serverFarmResourceId: appService.id

    // Non-required parameters
    storageAccountResourceId: storageAccount.id

    tags: tags
  }
}
