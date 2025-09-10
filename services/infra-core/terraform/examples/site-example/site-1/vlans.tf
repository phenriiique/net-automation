# VLANs individuais para o Site Nordeste
# Este arquivo cria VLANs específicas nos respectivos VLAN groups

# ====== VLANs de Infraestrutura (100-199) ======

module "vlan_100" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 100 - Management"
  vid         = 100
  status      = local.status_vlan_prefix
  description = "VLAN de gerenciamento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_100.id
  tags        = [data.netbox_tag.tag_management.name]
}

module "vlan_101" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 101 - Storage"
  vid         = 101
  status      = local.status_vlan_prefix
  description = "VLAN de storage para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_100.id
  tags        = [data.netbox_tag.tag_storage.name]
}

module "vlan_102" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 102 - Monitoring"
  vid         = 102
  status      = local.status_vlan_prefix
  description = "VLAN de monitoramento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_100.id
  tags        = [data.netbox_tag.tag_monitoring.name]
}

# ====== VLANs de Produção (200-299) ======

module "vlan_250" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 250 - Web Production"
  vid         = 250
  status      = local.status_vlan_prefix
  description = "VLAN de produção web para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_200.id
  tags        = [data.netbox_tag.tag_web.name, data.netbox_tag.tag_production.name]
}

module "vlan_251" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 251 - Database Production"
  vid         = 251
  status      = local.status_vlan_prefix
  description = "VLAN de banco de dados de produção para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_200.id
  tags        = [data.netbox_tag.tag_database.name, data.netbox_tag.tag_production.name]
}

module "vlan_252" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 252 - API Production"
  vid         = 252
  status      = local.status_vlan_prefix
  description = "VLAN de API de produção para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_200.id
  tags        = [data.netbox_tag.tag_api.name, data.netbox_tag.tag_production.name]
}

# ====== VLANs de Desenvolvimento (500-599) ======

module "vlan_550" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 550 - Web Development"
  vid         = 550
  status      = local.status_vlan_prefix
  description = "VLAN de desenvolvimento web para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_500.id
  tags        = [data.netbox_tag.tag_web.name, data.netbox_tag.tag_development.name]
}

module "vlan_551" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 551 - Database Development"
  vid         = 551
  status      = local.status_vlan_prefix
  description = "VLAN de banco de dados de desenvolvimento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_500.id
  tags        = [data.netbox_tag.tag_database.name, data.netbox_tag.tag_development.name]
}

module "vlan_552" {
  source = "../../../modules/netbox_vlan"
  
  name        = "VLAN 552 - API Development"
  vid         = 552
  status      = local.status_vlan_prefix
  description = "VLAN de API de desenvolvimento para o ${local.site_name}"
  tenant_id   = module.tenant_br-ne-1.id
  site_id     = module.site_br-ne-1.id
  group_id    = module.vlan_group_500.id
  tags        = [data.netbox_tag.tag_api.name, data.netbox_tag.tag_development.name]
}
