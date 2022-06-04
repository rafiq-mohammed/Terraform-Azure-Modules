
# User Guide
###
## Naming Convention

Example: DEUSNETRAFARG01
- D = Dev
- EUS = eastus
- NET/SVC/STG = Network/Services/Storage
- RAF = RAFIQ (Project-name)
- ARG = Azure resource group

## 1. Resource Group

rg_array = {  
  DEUSNETRAFARG01 = "eastus"  
  DEUSSVCRAFARG01 = "eastus"   
  }

## 2. Virtual Network

vnet_array = {  
  deussvcrafavn01 = {  
    location       = "eastus"   
    address        = "192.168.1.0/24"  
    resource_group = "DEUSNETRAFARG01"  
  }  
}  

## 3. Subnet

subnet_array = {  
  deussvcrafasn01 = {  
    address        = "192.168.1.0/24"  
    resource_group = "DEUSNETRAFARG01"  
    vnet_name      = "deussvcrafavn01"  
  },  
  deussvcrafasn02 = {  
    address        = "192.168.2.0/24"  
    resource_group = "DEUSNETRAFARG01"  
    vnet_name      = "deussvcrafavn01"  
  }  
}  