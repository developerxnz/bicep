/*

Standard Requirements
- App Service Plan
- Function App
  - Requires Access to Keyvault
- Storage Account

*/

import { teamTags } from '../types/types.bicep'
import { GenerateStorageResourceName }  from '../functions/naming.bicep'

param tags teamTags

param appName string

param appSettings object

param appServiceResourceId string

var storageAccountName = GenerateStorageResourceName(tags, appName)

module storageAccount '../modules/Storage/storage.standard.bicep' = {
  name: '${storageAccountName}Deployment'
  params: {
    storageAccountName:storageAccountName
    tags:tags
  }
}

module site '../modules/compute/web-app.bicep' = {
  name: '${appName}Deployment'
  params: {
    appSettings: appSettings
    appName:appName
    appServiceResourceId:appServiceResourceId
    storageAccountResourceId:storageAccount.outputs.resourceId
    tags:tags
  }
}

output resourceId string = site.outputs.resourceId
