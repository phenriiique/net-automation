# Outputs do exemplo de sites organizados por categoria

# ====== SITE ======
output "site" {
  description = "Informações do Site"
  value = {
    site_br_ne_1_id   = module.site_br-ne-1.id
    site_br_ne_1_name = module.site_br-ne-1.name
  }
}

# ====== TENANT ======
output "tenant" {
  description = "Informações do Tenant"
  value = {
    tenant_br_ne_1_id   = module.tenant_br-ne-1.id
    tenant_br_ne_1_name = module.tenant_br-ne-1.name
  }
}

# ====== TAGS ======
output "tags" {
  description = "Informações das Tags"
  value = {
    # Tags de Ambiente
    tag_production_id   = module.tag_production.id
    tag_production_name = module.tag_production.name
    tag_development_id  = module.tag_development.id
    tag_development_name = module.tag_development.name
    
    # Tags de Tipo de Serviço
    tag_web_id      = module.tag_web.id
    tag_web_name    = module.tag_web.name
    tag_database_id = module.tag_database.id
    tag_database_name = module.tag_database.name
    tag_api_id      = module.tag_api.id
    tag_api_name    = module.tag_api.name
    
    # Tags de Infraestrutura
    tag_management_id   = module.tag_management.id
    tag_management_name = module.tag_management.name
    tag_storage_id      = module.tag_storage.id
    tag_storage_name    = module.tag_storage.name
    tag_monitoring_id   = module.tag_monitoring.id
    tag_monitoring_name = module.tag_monitoring.name
    tag_infrastructure_id   = module.tag_infrastructure.id
    tag_infrastructure_name = module.tag_infrastructure.name
    tag_iac_network_id      = module.tag_iac_network.id
    tag_iac_network_name    = module.tag_iac_network.name
  }
}

# ====== VLAN GROUP ======
output "vlan_groups" {
  description = "Informações dos VLAN Groups"
  value = {
    vlan_group_100_id   = module.vlan_group_100.id
    vlan_group_100_name = module.vlan_group_100.name
    vlan_group_100_slug = module.vlan_group_100.slug
    vlan_group_200_id   = module.vlan_group_200.id
    vlan_group_200_name = module.vlan_group_200.name
    vlan_group_200_slug = module.vlan_group_200.slug
    vlan_group_500_id   = module.vlan_group_500.id
    vlan_group_500_name = module.vlan_group_500.name
    vlan_group_500_slug = module.vlan_group_500.slug
  }
}

# ====== VLANs INDIVIDUAIS ======
output "vlans" {
  description = "Informações das VLANs Individuais"
  value = {
    # VLANs de Infraestrutura (100-199)
    vlan_100_id   = module.vlan_100.id
    vlan_100_name = module.vlan_100.name
    vlan_100_vid  = module.vlan_100.vid
    vlan_101_id   = module.vlan_101.id
    vlan_101_name = module.vlan_101.name
    vlan_101_vid  = module.vlan_101.vid
    vlan_102_id   = module.vlan_102.id
    vlan_102_name = module.vlan_102.name
    vlan_102_vid  = module.vlan_102.vid
    
    # VLANs de Produção (200-299)
    vlan_250_id   = module.vlan_250.id
    vlan_250_name = module.vlan_250.name
    vlan_250_vid  = module.vlan_250.vid
    vlan_251_id   = module.vlan_251.id
    vlan_251_name = module.vlan_251.name
    vlan_251_vid  = module.vlan_251.vid
    vlan_252_id   = module.vlan_252.id
    vlan_252_name = module.vlan_252.name
    vlan_252_vid  = module.vlan_252.vid
    
    # VLANs de Desenvolvimento (500-599)
    vlan_550_id   = module.vlan_550.id
    vlan_550_name = module.vlan_550.name
    vlan_550_vid  = module.vlan_550.vid
    vlan_551_id   = module.vlan_551.id
    vlan_551_name = module.vlan_551.name
    vlan_551_vid  = module.vlan_551.vid
    vlan_552_id   = module.vlan_552.id
    vlan_552_name = module.vlan_552.name
    vlan_552_vid  = module.vlan_552.vid
  }
}

# ====== PREFIXOS ======
output "prefixes" {
  description = "Informações dos Prefixos"
  value = {
    # Container principal
    prefix_container_main_id   = module.prefix_container_main.id
    prefix_container_main_prefix = module.prefix_container_main.prefix
    
    # Prefixos ativos
    prefix_infrastructure_id   = module.prefix_infrastructure.id
    prefix_infrastructure_prefix = module.prefix_infrastructure.prefix
    prefix_production_id       = module.prefix_production.id
    prefix_production_prefix   = module.prefix_production.prefix
    prefix_development_id      = module.prefix_development.id
    prefix_development_prefix  = module.prefix_development.prefix
    prefix_staging_id          = module.prefix_staging.id
    prefix_staging_prefix      = module.prefix_staging.prefix
    prefix_dmz_id              = module.prefix_dmz.id
    prefix_dmz_prefix          = module.prefix_dmz.prefix
    prefix_management_id       = module.prefix_management.id
    prefix_management_prefix   = module.prefix_management.prefix
    prefix_storage_id          = module.prefix_storage.id
    prefix_storage_prefix      = module.prefix_storage.prefix
    prefix_backup_id           = module.prefix_backup.id
    prefix_backup_prefix       = module.prefix_backup.prefix
    prefix_monitoring_id       = module.prefix_monitoring.id
    prefix_monitoring_prefix   = module.prefix_monitoring.prefix
    
    # Prefixos reservados
    prefix_reserved_1_id       = module.prefix_reserved_1.id
    prefix_reserved_1_prefix   = module.prefix_reserved_1.prefix
    prefix_reserved_2_id       = module.prefix_reserved_2.id
    prefix_reserved_2_prefix   = module.prefix_reserved_2.prefix
    prefix_reserved_3_id       = module.prefix_reserved_3.id
    prefix_reserved_3_prefix   = module.prefix_reserved_3.prefix
  }
}

# ====== SUBNETS /26 ======
output "subnets_26" {
  description = "Informações das Sub-redes /26"
  value = {
    # Produção - 4 sub-redes /26
    prefix_production_1_id     = module.prefix_production_1.id
    prefix_production_1_prefix = module.prefix_production_1.prefix
    prefix_production_2_id     = module.prefix_production_2.id
    prefix_production_2_prefix = module.prefix_production_2.prefix
    prefix_production_3_id     = module.prefix_production_3.id
    prefix_production_3_prefix = module.prefix_production_3.prefix
    prefix_production_4_id     = module.prefix_production_4.id
    prefix_production_4_prefix = module.prefix_production_4.prefix
    
    # Desenvolvimento - 4 sub-redes /26
    prefix_development_1_id     = module.prefix_development_1.id
    prefix_development_1_prefix = module.prefix_development_1.prefix
    prefix_development_2_id     = module.prefix_development_2.id
    prefix_development_2_prefix = module.prefix_development_2.prefix
    prefix_development_3_id     = module.prefix_development_3.id
    prefix_development_3_prefix = module.prefix_development_3.prefix
    prefix_development_4_id     = module.prefix_development_4.id
    prefix_development_4_prefix = module.prefix_development_4.prefix
    
    # Staging - 4 sub-redes /26
    prefix_staging_1_id     = module.prefix_staging_1.id
    prefix_staging_1_prefix = module.prefix_staging_1.prefix
    prefix_staging_2_id     = module.prefix_staging_2.id
    prefix_staging_2_prefix = module.prefix_staging_2.prefix
    prefix_staging_3_id     = module.prefix_staging_3.id
    prefix_staging_3_prefix = module.prefix_staging_3.prefix
    prefix_staging_4_id     = module.prefix_staging_4.id
    prefix_staging_4_prefix = module.prefix_staging_4.prefix
    
    # DMZ - 4 sub-redes /26
    prefix_dmz_1_id     = module.prefix_dmz_1.id
    prefix_dmz_1_prefix = module.prefix_dmz_1.prefix
    prefix_dmz_2_id     = module.prefix_dmz_2.id
    prefix_dmz_2_prefix = module.prefix_dmz_2.prefix
    prefix_dmz_3_id     = module.prefix_dmz_3.id
    prefix_dmz_3_prefix = module.prefix_dmz_3.prefix
    prefix_dmz_4_id     = module.prefix_dmz_4.id
    prefix_dmz_4_prefix = module.prefix_dmz_4.prefix
    
    # Gerenciamento - 4 sub-redes /26
    prefix_management_1_id     = module.prefix_management_1.id
    prefix_management_1_prefix = module.prefix_management_1.prefix
    prefix_management_2_id     = module.prefix_management_2.id
    prefix_management_2_prefix = module.prefix_management_2.prefix
    prefix_management_3_id     = module.prefix_management_3.id
    prefix_management_3_prefix = module.prefix_management_3.prefix
    prefix_management_4_id     = module.prefix_management_4.id
    prefix_management_4_prefix = module.prefix_management_4.prefix
    
    # Storage - 4 sub-redes /26
    prefix_storage_1_id     = module.prefix_storage_1.id
    prefix_storage_1_prefix = module.prefix_storage_1.prefix
    prefix_storage_2_id     = module.prefix_storage_2.id
    prefix_storage_2_prefix = module.prefix_storage_2.prefix
    prefix_storage_3_id     = module.prefix_storage_3.id
    prefix_storage_3_prefix = module.prefix_storage_3.prefix
    prefix_storage_4_id     = module.prefix_storage_4.id
    prefix_storage_4_prefix = module.prefix_storage_4.prefix
    
    # Backup - 4 sub-redes /26
    prefix_backup_1_id     = module.prefix_backup_1.id
    prefix_backup_1_prefix = module.prefix_backup_1.prefix
    prefix_backup_2_id     = module.prefix_backup_2.id
    prefix_backup_2_prefix = module.prefix_backup_2.prefix
    prefix_backup_3_id     = module.prefix_backup_3.id
    prefix_backup_3_prefix = module.prefix_backup_3.prefix
    prefix_backup_4_id     = module.prefix_backup_4.id
    prefix_backup_4_prefix = module.prefix_backup_4.prefix
    
    # Monitoramento - 4 sub-redes /26
    prefix_monitoring_1_id     = module.prefix_monitoring_1.id
    prefix_monitoring_1_prefix = module.prefix_monitoring_1.prefix
    prefix_monitoring_2_id     = module.prefix_monitoring_2.id
    prefix_monitoring_2_prefix = module.prefix_monitoring_2.prefix
    prefix_monitoring_3_id     = module.prefix_monitoring_3.id
    prefix_monitoring_3_prefix = module.prefix_monitoring_3.prefix
    prefix_monitoring_4_id     = module.prefix_monitoring_4.id
    prefix_monitoring_4_prefix = module.prefix_monitoring_4.prefix
  }
}

# ====== RACKS ======
output "racks" {
  description = "Informações dos Racks"
  value = {
    for i in range(1, local.rack_qtd + 1) : "rack_${format("%02d", i)}" => {
      id   = netbox_rack.racks[i].id
      name = netbox_rack.racks[i].name
    }
  }
}

# ====== MANUFACTURERS ======
output "manufacturers" {
  description = "Informações dos Manufacturers"
  value = {
    manufacturer_dell_id   = module.manufacturer_dell.id
    manufacturer_dell_name = module.manufacturer_dell.name
  }
}

# ====== DEVICE ROLES ======
output "device_roles" {
  description = "Informações dos Device Roles"
  value = {
    role_switch_id   = module.role_switch.id
    role_switch_name = module.role_switch.name
    role_server_id   = module.role_server.id
    role_server_name = module.role_server.name
  }
}

# ====== DEVICE TYPES ======
output "device_types" {
  description = "Informações dos Device Types"
  value = {
    # Switches
    device_type_dell_750_id   = module.device_type_dell_750.id
    device_type_dell_750_model = module.device_type_dell_750.model
    device_type_dell_n3248te_id   = module.device_type_dell_n3248te.id
    device_type_dell_n3248te_model = module.device_type_dell_n3248te.model
    device_type_dell_s5248f_id   = module.device_type_dell_s5248f.id
    device_type_dell_s5248f_model = module.device_type_dell_s5248f.model
    
    # Servidores
    device_type_dell_r750_balanced_id   = module.device_type_dell_r750_balanced.id
    device_type_dell_r750_balanced_model = module.device_type_dell_r750_balanced.model
    device_type_dell_r750_gpu_id   = module.device_type_dell_r750_gpu.id
    device_type_dell_r750_gpu_model = module.device_type_dell_r750_gpu.model
    device_type_dell_r750_performance_id   = module.device_type_dell_r750_performance.id
    device_type_dell_r750_performance_model = module.device_type_dell_r750_performance.model
  }
}

# ====== DEVICES - RACK03 ======
output "devices_rack03" {
  description = "Informações dos Devices do RACK03"
  value = {
    # Switches RACK03
    device_swt_003_001_id   = module.device_swt_003_001.id
    device_swt_003_001_name = module.device_swt_003_001.name
    device_swt_003_002_id   = module.device_swt_003_002.id
    device_swt_003_002_name = module.device_swt_003_002.name
    device_swt_003_003_id   = module.device_swt_003_003.id
    device_swt_003_003_name = module.device_swt_003_003.name
    device_swt_003_004_id   = module.device_swt_003_004.id
    device_swt_003_004_name = module.device_swt_003_004.name
    
    # Servidores RACK03 - Balanced
    device_srv_003_001_id   = module.device_srv_003_001.id
    device_srv_003_001_name = module.device_srv_003_001.name
    device_srv_003_003_id   = module.device_srv_003_003.id
    device_srv_003_003_name = module.device_srv_003_003.name
    device_srv_003_004_id   = module.device_srv_003_004.id
    device_srv_003_004_name = module.device_srv_003_004.name
    device_srv_003_005_id   = module.device_srv_003_005.id
    device_srv_003_005_name = module.device_srv_003_005.name
    device_srv_003_006_id   = module.device_srv_003_006.id
    device_srv_003_006_name = module.device_srv_003_006.name
    device_srv_003_007_id   = module.device_srv_003_007.id
    device_srv_003_007_name = module.device_srv_003_007.name
    device_srv_003_008_id   = module.device_srv_003_008.id
    device_srv_003_008_name = module.device_srv_003_008.name
    device_srv_003_009_id   = module.device_srv_003_009.id
    device_srv_003_009_name = module.device_srv_003_009.name
    device_srv_003_010_id   = module.device_srv_003_010.id
    device_srv_003_010_name = module.device_srv_003_010.name
    
    # Servidores RACK03 - Performance
    device_srv_003_002_id   = module.device_srv_003_002.id
    device_srv_003_002_name = module.device_srv_003_002.name
    device_srv_003_013_id   = module.device_srv_003_013.id
    device_srv_003_013_name = module.device_srv_003_013.name
    device_srv_003_014_id   = module.device_srv_003_014.id
    device_srv_003_014_name = module.device_srv_003_014.name
    device_srv_003_015_id   = module.device_srv_003_015.id
    device_srv_003_015_name = module.device_srv_003_015.name
    device_srv_003_016_id   = module.device_srv_003_016.id
    device_srv_003_016_name = module.device_srv_003_016.name
    device_srv_003_017_id   = module.device_srv_003_017.id
    device_srv_003_017_name = module.device_srv_003_017.name
    device_srv_003_018_id   = module.device_srv_003_018.id
    device_srv_003_018_name = module.device_srv_003_018.name

    
    # Servidores RACK03 - GPU
    device_srv_003_011_id   = module.device_srv_003_011.id
    device_srv_003_011_name = module.device_srv_003_011.name
    device_srv_003_012_id   = module.device_srv_003_012.id
    device_srv_003_012_name = module.device_srv_003_012.name
  }
}