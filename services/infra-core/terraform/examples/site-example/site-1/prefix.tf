
# Local variables para prefixos
locals {
  # Container principal do site (pai)
  container_prefix = "${local.base_network}.0.0/16"
  
  
  # Mapeamento de sub-redes /21 para diferentes propósitos
  subnets = {
    "infrastructure" = "${local.base_network}.0.0/21"    # Infraestrutura (0-7)
    "production"     = "${local.base_network}.8.0/21"    # Produção (8-15)
    "development"    = "${local.base_network}.16.0/21"   # Desenvolvimento (16-23)
    "staging"        = "${local.base_network}.24.0/21"   # Staging (24-31)
    "dmz"            = "${local.base_network}.32.0/21"   # DMZ (32-39)
    "management"     = "${local.base_network}.40.0/21"   # Gerenciamento (40-47)
    "storage"        = "${local.base_network}.48.0/21"   # Storage (48-55)
    "backup"         = "${local.base_network}.56.0/21"   # Backup (56-63)
    "monitoring"     = "${local.base_network}.64.0/21"   # Monitoramento (64-71)
    "reserved_1"     = "${local.base_network}.72.0/21"   # Reservado 1 (72-79)
    "reserved_2"     = "${local.base_network}.80.0/21"   # Reservado 2 (80-87)
    "reserved_3"     = "${local.base_network}.88.0/21"   # Reservado 3 (88-95)
    "reserved_4"     = "${local.base_network}.96.0/21"   # Reservado 4 (96-103)
    "reserved_5"     = "${local.base_network}.104.0/21"  # Reservado 5 (104-111)
    "reserved_6"     = "${local.base_network}.112.0/21"  # Reservado 6 (112-119)
    "reserved_7"     = "${local.base_network}.120.0/21"  # Reservado 7 (120-127)
    "reserved_8"     = "${local.base_network}.128.0/21"  # Reservado 8 (128-135)
    "reserved_9"     = "${local.base_network}.136.0/21"  # Reservado 9 (136-143)
    "reserved_10"    = "${local.base_network}.144.0/21"  # Reservado 10 (144-151)
    "reserved_11"    = "${local.base_network}.152.0/21"  # Reservado 11 (152-159)
    "reserved_12"    = "${local.base_network}.160.0/21"  # Reservado 12 (160-167)
    "reserved_13"    = "${local.base_network}.168.0/21"  # Reservado 13 (168-175)
    "reserved_14"    = "${local.base_network}.176.0/21"  # Reservado 14 (176-183)
    "reserved_15"    = "${local.base_network}.184.0/21"  # Reservado 15 (184-191)
    "reserved_16"    = "${local.base_network}.192.0/21"  # Reservado 16 (192-199)
    "reserved_17"    = "${local.base_network}.200.0/21"  # Reservado 17 (200-207)
    "reserved_18"    = "${local.base_network}.208.0/21"  # Reservado 18 (208-215)
    "reserved_19"    = "${local.base_network}.216.0/21"  # Reservado 19 (216-223)
    "reserved_20"    = "${local.base_network}.224.0/21"  # Reservado 20 (224-231)
    "reserved_21"    = "${local.base_network}.232.0/21"  # Reservado 21 (232-239)
    "reserved_22"    = "${local.base_network}.240.0/21"  # Reservado 22 (240-247)
    "reserved_23"    = "${local.base_network}.248.0/21"  # Reservado 23 (248-255)
  }
  

  subnets_26 = {
    # Produção - 4 sub-redes /26
    "production_1" = "${local.base_network}.8.0/26"
    "production_2" = "${local.base_network}.8.64/26"
    "production_3" = "${local.base_network}.8.128/26"
    "production_4" = "${local.base_network}.8.192/26"
    
    # Desenvolvimento - 4 sub-redes /26
    "development_1" = "${local.base_network}.16.0/26"
    "development_2" = "${local.base_network}.16.64/26"
    "development_3" = "${local.base_network}.16.128/26"
    "development_4" = "${local.base_network}.16.192/26"
    
    # Staging - 4 sub-redes /26
    "staging_1" = "${local.base_network}.24.0/26"
    "staging_2" = "${local.base_network}.24.64/26"
    "staging_3" = "${local.base_network}.24.128/26"
    "staging_4" = "${local.base_network}.24.192/26"
    
    # DMZ - 4 sub-redes /26
    "dmz_1" = "${local.base_network}.32.0/26"
    "dmz_2" = "${local.base_network}.32.64/26"
    "dmz_3" = "${local.base_network}.32.128/26"
    "dmz_4" = "${local.base_network}.32.192/26"
    
    # Gerenciamento - 4 sub-redes /26
    "management_1" = "${local.base_network}.40.0/26"
    "management_2" = "${local.base_network}.40.64/26"
    "management_3" = "${local.base_network}.40.128/26"
    "management_4" = "${local.base_network}.40.192/26"
    
    # Storage - 4 sub-redes /26
    "storage_1" = "${local.base_network}.48.0/26"
    "storage_2" = "${local.base_network}.48.64/26"
    "storage_3" = "${local.base_network}.48.128/26"
    "storage_4" = "${local.base_network}.48.192/26"
    
    # Backup - 4 sub-redes /26
    "backup_1" = "${local.base_network}.56.0/26"
    "backup_2" = "${local.base_network}.56.64/26"
    "backup_3" = "${local.base_network}.56.128/26"
    "backup_4" = "${local.base_network}.56.192/26"
    
    # Monitoramento - 4 sub-redes /26
    "monitoring_1" = "${local.base_network}.64.0/26"
    "monitoring_2" = "${local.base_network}.64.64/26"
    "monitoring_3" = "${local.base_network}.64.128/26"
    "monitoring_4" = "${local.base_network}.64.192/26"
  }
}

# ====== CONTAINER PRINCIPAL (Pai) ======

module "prefix_container_main" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.container_prefix
  status      = "container"
  description = "Container principal de rede para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# ====== SUBNETS /21 (Filhos) ======

# Infraestrutura
module "prefix_infrastructure" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["infrastructure"]
  status      = local.status_vlan_prefix
  description = "Rede de infraestrutura para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Produção
module "prefix_production" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["production"]
  status      = local.status_vlan_prefix
  description = "Rede de produção para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_250.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Desenvolvimento
module "prefix_development" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["development"]
  status      = local.status_vlan_prefix
  description = "Rede de desenvolvimento para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_550.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Staging
module "prefix_staging" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["staging"]
  status      = local.status_vlan_prefix
  description = "Rede de staging para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# DMZ
module "prefix_dmz" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["dmz"]
  status      = local.status_vlan_prefix
  description = "Rede DMZ para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Gerenciamento
module "prefix_management" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["management"]
  status      = local.status_vlan_prefix
  description = "Rede de gerenciamento para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Storage
module "prefix_storage" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["storage"]
  status      = local.status_vlan_prefix
  description = "Rede de storage para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Backup
module "prefix_backup" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["backup"]
  status      = local.status_vlan_prefix
  description = "Rede de backup para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Monitoramento
module "prefix_monitoring" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["monitoring"]
  status      = local.status_vlan_prefix
  description = "Rede de monitoramento para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_100.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# ====== SUBNETS /26 (Netos) ======

# Produção - 4 sub-redes /26
module "prefix_production_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["production_1"]
  status      = local.status_vlan_prefix
  description = "Rede de produção 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_250.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_production_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["production_2"]
  status      = local.status_vlan_prefix
  description = "Rede de produção 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_250.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_production_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["production_3"]
  status      = local.status_vlan_prefix
  description = "Rede de produção 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_250.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_production_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["production_4"]
  status      = local.status_vlan_prefix
  description = "Rede de produção 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_250.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Desenvolvimento - 4 sub-redes /26
module "prefix_development_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["development_1"]
  status      = local.status_vlan_prefix
  description = "Rede de desenvolvimento 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_550.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_development_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["development_2"]
  status      = local.status_vlan_prefix
  description = "Rede de desenvolvimento 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_550.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_development_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["development_3"]
  status      = local.status_vlan_prefix
  description = "Rede de desenvolvimento 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_550.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_development_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["development_4"]
  status      = local.status_vlan_prefix
  description = "Rede de desenvolvimento 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_550.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Staging - 4 sub-redes /26
module "prefix_staging_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["staging_1"]
  status      = local.status_vlan_prefix
  description = "Rede de staging 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_staging_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["staging_2"]
  status      = local.status_vlan_prefix
  description = "Rede de staging 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_staging_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["staging_3"]
  status      = local.status_vlan_prefix
  description = "Rede de staging 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_staging_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["staging_4"]
  status      = local.status_vlan_prefix
  description = "Rede de staging 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# DMZ - 4 sub-redes /26
module "prefix_dmz_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["dmz_1"]
  status      = local.status_vlan_prefix
  description = "Rede DMZ 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_dmz_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["dmz_2"]
  status      = local.status_vlan_prefix
  description = "Rede DMZ 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_dmz_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["dmz_3"]
  status      = local.status_vlan_prefix
  description = "Rede DMZ 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_dmz_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["dmz_4"]
  status      = local.status_vlan_prefix
  description = "Rede DMZ 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Gerenciamento - 4 sub-redes /26
module "prefix_management_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["management_1"]
  status      = local.status_vlan_prefix
  description = "Rede de gerenciamento 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_management_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["management_2"]
  status      = local.status_vlan_prefix
  description = "Rede de gerenciamento 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_management_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["management_3"]
  status      = local.status_vlan_prefix
  description = "Rede de gerenciamento 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_management_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["management_4"]
  status      = local.status_vlan_prefix
  description = "Rede de gerenciamento 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Storage - 4 sub-redes /26
module "prefix_storage_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["storage_1"]
  status      = local.status_vlan_prefix
  description = "Rede de storage 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_storage_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["storage_2"]
  status      = local.status_vlan_prefix
  description = "Rede de storage 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_storage_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["storage_3"]
  status      = local.status_vlan_prefix
  description = "Rede de storage 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_storage_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["storage_4"]
  status      = local.status_vlan_prefix
  description = "Rede de storage 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Backup - 4 sub-redes /26
module "prefix_backup_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["backup_1"]
  status      = local.status_vlan_prefix
  description = "Rede de backup 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_backup_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["backup_2"]
  status      = local.status_vlan_prefix
  description = "Rede de backup 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_backup_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["backup_3"]
  status      = local.status_vlan_prefix
  description = "Rede de backup 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_backup_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["backup_4"]
  status      = local.status_vlan_prefix
  description = "Rede de backup 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Monitoramento - 4 sub-redes /26
module "prefix_monitoring_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["monitoring_1"]
  status      = local.status_vlan_prefix
  description = "Rede de monitoramento 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_100.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_monitoring_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["monitoring_2"]
  status      = local.status_vlan_prefix
  description = "Rede de monitoramento 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_100.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_monitoring_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["monitoring_3"]
  status      = local.status_vlan_prefix
  description = "Rede de monitoramento 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_100.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_monitoring_4" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets_26["monitoring_4"]
  status      = local.status_vlan_prefix
  description = "Rede de monitoramento 4 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlan_100.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# ====== PREFIXOS RESERVADOS ======

# Reservados para uso futuro (status: reserved)
module "prefix_reserved_1" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["reserved_1"]
  status      = "reserved"
  description = "Prefixo reservado 1 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_reserved_2" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["reserved_2"]
  status      = "reserved"
  description = "Prefixo reservado 2 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_reserved_3" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["reserved_3"]
  status      = "reserved"
  description = "Prefixo reservado 3 para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  tags        = [data.netbox_tag.tag_iac_network.name]
}
