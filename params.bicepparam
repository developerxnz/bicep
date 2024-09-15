using 'example.bicep'

/*

1 - 60 characters
Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode
- https://en.wikipedia.org/wiki/Punycode
Your website farm name must be unique within the containing Resource Group.

*/
param appServiceName = 'foo-plan'

/*

2 - 60 characters
Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode. Can't start or end with hyphen.
- https://en.wikipedia.org/wiki/Punycode
Name must be unique within global or per domain. See note below.

*/

param functionAppName = 'foo-api'

param applicationTags = {
  env: 'development'
  instance: 'development'
  team: 'foo'
  build: 'build' //would need to pass this in to the az deployment as addional param
}

/*

Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only.
Your storage account name must be unique within Azure. No two storage accounts can have the same name.

*/

param storageAccountName =  '{environment}-{group}-{applicationName}'
