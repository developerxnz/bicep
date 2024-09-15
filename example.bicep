import { teamTags } from 'types/types.bicep'

param appServiceName string

param applicationTags teamTags

param storageAccountName string

param functionAppName string

module servicePlanDeployment 'templates/function-app-module.bicep' = {
  name: 'ServicePlanDeployment'
  params: {
    appServiceName: appServiceName
    tags: applicationTags
    functionAppName:functionAppName
    storageAccountName:storageAccountName
  }
}
