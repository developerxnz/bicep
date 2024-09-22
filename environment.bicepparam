using 'example.bicep'

import { GenerateStorageResourceName } from 'functions/naming.bicep'
import { defaultTags } from 'base.bicep'

/*

Assign value from imported defaultTags

*/
param tags = defaultTags

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

param storageAccountName =  GenerateStorageResourceName(tags, 'fapi')
