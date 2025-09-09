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