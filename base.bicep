/*

Default settings exported to any files that imports it

*/

@export()
@description('Application Specific Tags')
var defaultTags = {
  env: 'development'
  instance: 'development'
  team: 'foo'
  build: 'build' //would need to pass this in to the az deployment as addional param
}
