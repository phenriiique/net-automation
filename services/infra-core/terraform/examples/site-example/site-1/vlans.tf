# VLANs individuais para o Site Nordeste
# Este arquivo cria VLANs específicas nos respectivos VLAN groups

# ====== VLANs de Infraestrutura (100-199) ======

module "vlan_100" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 100 - Management"
  vid         = 100
  status      = "active"
  description = "VLAN de gerenciamento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_100.id
  tags        = [module.tag_management.name]
}

module "vlan_101" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 101 - Storage"
  vid         = 101
  status      = "active"
  description = "VLAN de storage para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_100.id
  tags        = [module.tag_storage.name]
}

module "vlan_102" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 102 - Monitoring"
  vid         = 102
  status      = "active"
  description = "VLAN de monitoramento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_100.id
  tags        = [module.tag_monitoring.name]
}

# ====== VLANs de Produção (200-299) ======

module "vlan_250" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 250 - Web Production"
  vid         = 250
  status      = "active"
  description = "VLAN de produção web para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_200.id
  tags        = [module.tag_web.name, module.tag_production.name]
}

module "vlan_251" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 251 - Database Production"
  vid         = 251
  status      = "active"
  description = "VLAN de banco de dados de produção para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_200.id
  tags        = [module.tag_database.name, module.tag_production.name]
}

module "vlan_252" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 252 - API Production"
  vid         = 252
  status      = "active"
  description = "VLAN de API de produção para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_200.id
  tags        = [module.tag_api.name, module.tag_production.name]
}

# ====== VLANs de Desenvolvimento (500-599) ======

module "vlan_550" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 550 - Web Development"
  vid         = 550
  status      = "active"
  description = "VLAN de desenvolvimento web para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_500.id
  tags        = [module.tag_web.name, module.tag_development.name]
}

module "vlan_551" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 551 - Database Development"
  vid         = 551
  status      = "active"
  description = "VLAN de banco de dados de desenvolvimento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_500.id
  tags        = [module.tag_database.name, module.tag_development.name]
}

module "vlan_552" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 552 - API Development"
  vid         = 552
  status      = "active"
  description = "VLAN de API de desenvolvimento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_500.id
  tags        = [module.tag_api.name, module.tag_development.name]
}
