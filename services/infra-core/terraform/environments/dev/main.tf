# Configuração do ambiente de desenvolvimento
# Este arquivo define os recursos para o ambiente de desenvolvimento

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.0"
    }
  }
}

provider "netbox" {
  # Configuração via variáveis de ambiente:
  # NETBOX_URL e NETBOX_TOKEN
}

# Sites de desenvolvimento
module "dev_site_sp" {
  source = "../../modules/netbox-site"
  
  name        = "Dev Site São Paulo"
  description = "Site de desenvolvimento em São Paulo"
  status      = "active"
  facility    = "DEV-SP-01"
  
  tags = ["development", "testing", "sp"]
  
  custom_fields = {
    "environment" = "dev"
    "purpose"     = "testing"
  }
}

module "dev_site_rj" {
  source = "../../modules/netbox-site"
  
  name        = "Dev Site Rio de Janeiro"
  description = "Site de desenvolvimento no Rio de Janeiro"
  status      = "active"
  facility    = "DEV-RJ-01"
  
  tags = ["development", "testing", "rj"]
  
  custom_fields = {
    "environment" = "dev"
    "purpose"     = "testing"
  }
}
