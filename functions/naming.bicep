import { teamTags } from '../types/types.bicep'

/*

Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only.
Your storage account name must be unique within Azure. No two storage accounts can have the same name.

*/

@export()
func GenerateStorageResourceName(tags teamTags, name string) string => 'stg-${tags.env}${name}!'
