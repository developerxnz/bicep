@export()
type environment = 'development' | 'test' | 'production' | 'sandbox'

@export()
type instance = 'development' | 'test' | 'production' | 'sandbox'

@export()
type teamTags = {
  env: environment
  instance: instance
  team: string
  build: string
}
