# Exemplo de uso do módulo netbox-site
# Este exemplo demonstra como criar sites no Netbox usando o módulo

terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.0"
    }
  }
}

provider "netbox" {
  # Configuração via variáveis de ambiente:
  # NETBOX_SERVER_URL e NETBOX_API_TOKEN
}

# Module names br-ne-1

locals {
  site_name = "Site Nordeste" 
  tenant_name = "br-ne-1"
  description = "Data center ${local.site_name} - Em planejamento"

}


module "tenant_br-ne-1" {
  source = "../../../modules/netbox_tenant"
  
  name        = local.tenant_name
  description = "Tenant no ${local.description}"
  
}

# Site planejado
module "site_br-ne-1" {
  source = "../../../modules/netbox_site"
  
  name        = local.site_name
  description = local.description
  status      = "planned"
  tenant_id   = module.tenant_br-ne-1.id
  
}
