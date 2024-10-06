import  { teamTags } from '../../types/types.bicep'
import { GenerateStorageResourceName }  from '../../functions/naming.bicep'

param appName string

param appServiceResourceId string

param storageAccountResourceId string

@description('Application Settings')
param appSettings object

@description('Resource Tags to apply')
param tags teamTags

module site 'br/public:avm/res/web/site:0.8.0' = {
  name: 'FunctionApp'
  params: {
    // Required parameters
    kind: 'app,linux'
    name: appName
    serverFarmResourceId: appServiceResourceId

    // Non-required parameters
    storageAccountResourceId: storageAccountResourceId
    appSettingsKeyValuePairs: appSettings

    tags: tags
  }
}

output resourceId string = site.outputs.resourceId
