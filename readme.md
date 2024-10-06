# Example Bicep Setup

Uses dev containers so that you don't need to install things locally
https://code.visualstudio.com/docs/devcontainers/create-dev-container

## Dev Container Setup
Running in container
Dev Containers: Open Folder in Container

Working with containers
https://code.visualstudio.com/docs/devcontainers/containers

Adding Terminal Option
Preferences: Open Remote Settings (JSON) (Dev Container) to open them)


## Modules
Contains Custom Modules using AVM (version specific)
Could eventually moved out to its own repo and registry
https://www.miru.ch/how-to-build-a-bicep-module-library/

## Templates
Contains Resource specific setup e.g. Function App, Web App

## Types
Contains specific Custom Types


## Testing
Testing bicep via what-if
- requires resource group to exist

az deployment group what-if --resource-group testbicep --name rollout01 --template-file example.bicep --parameters params.bicepparam


## Push tp ACR

az bicep publish --file localfilename.bicep --target br:sleuth.azurecr.io/bicep/modules/pathorfilename:0.0.1
