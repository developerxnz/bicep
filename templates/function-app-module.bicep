/*

Standard Requirements
- App Service Plan
- Function App
  - Requires Access to Keyvault
- Storage Account

*/

import { teamTags } from '../types/types.bicep'
import { GenerateStorageResourceName }  from '../functions/naming.bicep'

@description('App Service Plan Name')
param appServiceResourceId string

param tags teamTags

param appname string

param appSettings object

var storageAccountName = GenerateStorageResourceName(tags, appname)

module storageAccountDeployment '../modules/Storage/storage.standard.bicep' = {
  name: '${storageAccountName}Deployment'
  params: {
    storageAccountName: storageAccountName
    tags:tags
  }
}

module site '../modules/compute/function-app.bicep' = {
  name: '${appname}Deployment'
  params: {
    appsettings: appSettings
    appname:appname
    appServiceResourceId:appServiceResourceId
    storageaAcountResourceId: storageAccountDeployment.outputs.resourceId
    tags:tags
  }
}

output resourceId string = site.outputs.resourceId
