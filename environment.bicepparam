using 'example.bicep'

import { GenerateStorageResourceName } from 'functions/naming.bicep'
import { defaultTags } from 'base.bicep'

/*

Assign value from imported defaultTags

*/
param tags = defaultTags


param appSettings =  {
  mysetting: 'myvalue'
}

/*

Base Service Name used to generate app service, web/function app names
e.g. foo-serviceplan, foo-api, foo-jobs, foo-evt

*/
param baseServiceName =  'foo'
