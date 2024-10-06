metadata name = 'Function App Configuration'
metadata description = 'This module deploys a Function app along with a storage account.'
metadata owner = 'Azure/module-maintainers'

import  { teamTags } from '../../types/types.bicep'

param appServiceResourceId string

param appname string

param storageaAcountResourceId string

param tags  teamTags

param appsettings object

module site 'br/public:avm/res/web/site:0.8.0' = {
  name: 'FunctionApp'
  params: {
    // Required parameters
    kind: 'functionapp'
    name: appname
    serverFarmResourceId: appServiceResourceId

    // Non-required parameters
    storageAccountRequired: true
    appSettingsKeyValuePairs: appsettings
    storageAccountResourceId: storageaAcountResourceId

    tags: tags
  }
}


output resourceId string = site.outputs.resourceId
