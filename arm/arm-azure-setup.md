Documentation on to deploy a VM using IaC with ARM template  
Prerequisites  
1. Azure CLI installed
2. Git installed  
  
Step by step process  
Step 1: Login to Azure  
Authenticate to Azure using Azure CLI: az login  
  
Step 2: Select Subscription  
If multiple subscriptions exist, set one: az account set --subscription "<subscription-id>"  
  
Step 3: Create a Resource Group  
ARM templates deploy resources inside a resource group.  
az group create  
  --name arm-demo-rg  
  --location eastus  
  
Step 4: Prepare ARM Template File  
Create a JSON file named azure-vm.json containing the ARM template that defines: Virtual Network, Subnet, Network Interfaces, Virtual Machine  
  
Step 5: Deploy ARM Template  
Using the command : az deployment group create  
  --resource-group arm-demo-rg  
  --template-file azure-vm.json  
  
Step 6: Verify Deployment  
Go to portal, verify that VM is created  
  
Step 7: Cleanup Resources
az group delete  
  --name arm-demo-rg  
  --yes --no-wait
