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

# Local variables
locals {
  tenant_name    = "br-ne-1"
  site_name      = "Site Nordeste" 
  description    = "Data center ${local.site_name} - Em planejamento"
  base_network   = "10.0"
  rack_qtd       = 22  # Quantidade de racks a serem criados
  
  # Status centralizados - diferentes recursos têm validações diferentes
  status_site_rack = "planned"  # Para Site e Rack (suportam "planned")
  status_vlan_prefix = "active" # Para VLAN e Prefix (não suportam "planned")
}

module "tenant_br-ne-1" {
  source = "../../../modules/netbox_tenant"
  
  name        = local.tenant_name
  description = "Tenant no ${local.description}"
  
}

module "site_br-ne-1" {
  source = "../../../modules/netbox_site"
  
  name        = local.site_name
  description = local.description
  status      = local.status_site_rack
  tenant_id   = module.tenant_br-ne-1.id
  
}
