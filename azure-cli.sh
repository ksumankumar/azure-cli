#!/bin/bash
az group create --name rg-azure  --location centralus
az network vnet create -g rg-azure -n myVnet
az network vnet create -g rg-azure -n myVnet --address-prefix 10.0.0.0/16 --subnet-name MySubnet --subnet-prefix 10.0.0.0/24
az network nsg rule create -n MyNsgRule --nsg-name MyNsg --priority 500 --resource-group rg-azure --access Allow --destination-address-prefixes * --destination-port-ranges 80 8080 22 --direction Inbound --protocol Tcp --source-port-ranges 80 22
az vm create -n myvm -g rg-azure --image UbuntuLTS --admin-password ubuntu@123456 --admin-username azureuser --authentication-type password --public-ip-sku Basic --nsg MyNsg --size Standard_B1s --vnet-name myVnet --subnet MySubnet --public-ip-address myvm-pip


