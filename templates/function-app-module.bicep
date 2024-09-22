/*

Standard Requirements
- App Service Plan
- Function App
  - Requires Access to Keyvault
- Storage Account

*/

import { teamTags } from '../types/types.bicep'

@description('App Service Plan Name')
param appServiceName string

param tags teamTags

param functionAppName string

param storageAccountName string

module serverfarm '../modules/compute/app-service-plan.bicep' = {
  name: '${appServiceName}Deployment'
  params: {
    tags: tags
    appServiceName:appServiceName
  }
}

module storageAccountDeployment '../modules/Storage/storage.standard.bicep' = {
  name: '${storageAccountName}Deployment'
  params: {
    storageAccountName:storageAccountName
    tags:tags
  }
}

module site '../modules/compute/function-app.bicep' = {
  name: '${functionAppName}Deployment'
  params: {
    appServiceName:appServiceName
    functionAppName:functionAppName
    storageAccountName:storageAccountName
    tags:tags
  }
}
