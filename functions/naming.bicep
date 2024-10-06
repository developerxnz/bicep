import { teamTags } from '../types/types.bicep'

/*

Scope:
Global

Character Length:
3 and 24

Valid Characters:
May contain numbers and lowercase letters only.
Your storage account name must be unique within Azure. No two storage accounts can have the same name.

*/

@export()
func GenerateStorageResourceName(tags teamTags, name string) string => 'stg-${tags.env}${name}'

/*

Scope: 
Global or per domain. See note below.

Character Length: 
2 - 60 

Valid Characters:
Alphanumeric, hyphens and Unicode characters that can be mapped to Punycode

Can't start or end with hyphen.

*/

@export()
@description('Generates an App(Function/Web) Name')
func GenerateAppResourceName(tags teamTags, name string) string => '${tags.env}-${tags.instance}-${name}'
