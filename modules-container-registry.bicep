module registry 'modules/Container/container.registry.bicep' = {
  name: 'ContainRegistry'
  params: {
    registryName: 'sleuth'
    sku: 'Basic'
  }
}

