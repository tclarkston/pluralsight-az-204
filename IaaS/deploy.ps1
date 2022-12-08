New-AzureRmResourceGroupDeployment `
  -Name 'cloud-deploy-arm' `
  -ResourceGroupName 'learning-ng' `
  -TemplateFile './template.json' `
  -TemplateParameterFile './parameters.json'