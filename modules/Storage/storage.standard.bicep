import { teamTags } from '../../types/types.bicep'

/*

- Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only.
- Your storage account name must be unique within Azure. No two storage accounts can have the same name.

*/

param storageAccountName string

param tags teamTags

module storageAccount 'br/public:avm/res/storage/storage-account:0.13.2' = {
  name: 'storageAccountDeployment'
  params: {
    // Required parameters
    name: storageAccountName
    // Non-required parameters
    kind: 'Storage'
    location: '<location>'
    tags: tags
  }
}
