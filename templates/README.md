# Description

The Templates folder contains predefined templates that simplify the creation of resources.

The templates make use of custom modules and AVM (Azure Verified Modules)

Templates are use to combine modules when creating common resources.

Function Application
---
[Function App Module](function-app-module.bicep)

A Function App requires the following
- App Service Plan (Microsoft.Web/serverfarms)
- An App itself (Microsoft.Web/sites)
- A Storage Account (Microsoft.Storage/storageAccounts)

>This module manages the creation and naming of the storage account. If you need to control the naming of the storage account you can create a new template that takes a storage account name as a parameter.

***Required Parameters***

| Parameter | Type | Description |
| ---- | ---- | ---- |
| `appServiceResourceId` | string | the resource id for the App Service Plan |
| `tags` | object | the tags to apply to the resources in the module |
| `appname` | string | the application name 
| `appSettings` | object | the app settings to apply to the function app 

***Output Values***

| Parameter | Type | Description |
| ---- | ---- | ---- |
| `resourceId` |  string  |the resourceId for the function app

Web Application
---
[Web App Module](web-app-module.bicep)

A Function App requires the following
- App Service Plan (Microsoft.Web/serverfarms)
- An App itself (Microsoft.Web/sites)
- A Storage Account (Microsoft.Storage/storageAccounts)

>This module manages the creation and naming of the storage account. If you need to control the naming of the storage account you can create a new template that takes a storage account name as a parameter.

***Required Parameters***

| Parameter | Type | Description |
| ---- | ---- | ---- |
| `appServiceResourceId` | string | the resource id for the App Service Plan |
| `tags` | object | the tags to apply to the resources in the module |
| `appname` | string | the application name 
| `appSettings` | object | the app settings to apply to the function app 

***Output Values***

| Parameter | Type | Description |
| ---- | ---- | ---- |
| `resourceId` |  string  |the resourceId for the function app
