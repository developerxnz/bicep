import { teamTags } from '../../types/types.bicep'

metadata name = 'App Service Plan'
metadata summary = '''
Add documenation for module
'''

@description('App Service Plan Name')
param appServiceName string

@allowed([ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ])
param appServiceWorkerCount int = 1

@description('App Service Plan Sku')
@allowed([ 'S1', 'S2' ])
param SkuName string = 'S1'

@description('App Service Plan Kind .e.g linux, windows')
@allowed([
  'Linux'
  'Windows'
  'FunctionApp'
])
param Kind string = 'Linux'

param tags teamTags

module serverfarm 'br/public:avm/res/web/serverfarm:0.2.2' = {
  name: 'AppServicePlan'
  params: {
    // Required parameters
    name: appServiceName
    skuCapacity: appServiceWorkerCount
    skuName: SkuName

    // Non-required parameters
    kind: Kind
    location: resourceGroup().location
    perSiteScaling: true
    tags: tags
    zoneRedundant: false
  }
}
