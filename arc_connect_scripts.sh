#!/bin/bash
sudo apt install curl
curl -sL https://aka.ms/InstallAzureCLIdeb | sudo bash
sudo apt-get update

# Download the installation package
wget https://aka.ms/azcmagent -O ~/install_linux_azcmagent.sh

# Install the hybrid agent
bash ~/install_linux_azcmagent.sh

# Change the following environment variables according to your Azure Service Principal name
echo "Exporting Environment Variables"
export subscriptionId='<Your Azure subscription ID>'
export appId='<Your Azure service principal appId>'
export password='<Your Azure service principal password>'
export tenantId='<Your Azure tenant ID>'
export resourceGroup='<Azure resource group name>'
export location='<Azure Region>'

# Run connect command
sudo azcmagent connect \
 --service-principal-id "${appId}" \
 --service-principal-secret "${password}" \
 --resource-group "${resourceGroup}" \
 --tenant-id "${tenantId}" \
 --location "${location}" \
 --subscription-id "${subscriptionId}"
