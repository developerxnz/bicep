import { teamTags } from 'types/types.bicep'

param appServiceName string

param tags teamTags

param storageAccountName string

param functionAppName string

module servicePlanDeployment 'templates/function-app-module.bicep' = {
  name: 'ServicePlanDeployment'
  params: {
    appServiceName: appServiceName
    tags: tags
    functionAppName:functionAppName
    storageAccountName:storageAccountName
  }
}
