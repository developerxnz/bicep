import { teamTags } from 'types/types.bicep'
import { GenerateAppResourceName } from 'functions/naming.bicep'

param baseServiceName string

param tags teamTags

param appSettings object

var appServiceName = '${baseServiceName}-serviceplan'

module appService 'modules/compute/app-service-plan.bicep' = {
  name: '${appServiceName}-Deployment'
  params: {
    tags: tags
    appServiceName:appServiceName
  }
}

module apiDeployment 'templates/function-app-module.bicep' = {
  name: 'apiDeployment'
  params: {
    appname: GenerateAppResourceName(tags, '${baseServiceName}-api')
    appServiceResourceId:appService.outputs.resourceId
    appSettings:appSettings
    tags: tags
  }
}

module jobsDeployment 'templates/function-app-module.bicep' = {
  name: 'jobsDeployment'
  params: {
    appname:GenerateAppResourceName(tags, '${baseServiceName}-jobs')
    appServiceResourceId:appService.outputs.resourceId
    appSettings:appSettings
    tags: tags
  }
}

module eventProcessorDeployment 'templates/web-app-module.bicep' = {
  name: 'fooApiDeployment'
  params: {
    appName:GenerateAppResourceName(tags, '${baseServiceName}-evt')
    appServiceResourceId:appService.outputs.resourceId
    appSettings:appSettings
    tags: tags
  }
}
