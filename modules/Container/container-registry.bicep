param registryName string

param sku 'Basic' | 'Standard' | 'Premium' | null

module registry 'br/public:avm/res/container-registry/registry:0.5.1' = {
  name: 'registryDeployment'
  params: {
    // Required parameters
    name: registryName
    
    // Non-required parameters
    acrSku: sku
    managedIdentities: {
      systemAssigned: true
    }
    location: resourceGroup().location
    zoneRedundancy: 'Disabled'
  }
}
