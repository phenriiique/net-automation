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
    # Tags de Infraestrutura
    tag_iac_network_id      = data.netbox_tag.tag_iac_network.id
    tag_iac_network_name    = data.netbox_tag.tag_iac_network.name
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
  }
}

# ====== VLANs INDIVIDUAIS ======
output "vlans" {
  description = "Informações das VLANs Individuais"
  value = {
    # Management Fabric (100-199)
    vlan_oob_bmc_id   = module.vlans["oob_bmc"].id
    vlan_oob_bmc_name = module.vlans["oob_bmc"].name
    vlan_oob_bmc_vid  = module.vlans["oob_bmc"].vid
    vlan_pxe_id       = module.vlans["pxe"].id
    vlan_pxe_name     = module.vlans["pxe"].name
    vlan_pxe_vid      = module.vlans["pxe"].vid
    vlan_oam_id       = module.vlans["oam"].id
    vlan_oam_name     = module.vlans["oam"].name
    vlan_oam_vid      = module.vlans["oam"].vid
    vlan_bgp_id       = module.vlans["bgp"].id
    vlan_bgp_name     = module.vlans["bgp"].name
    vlan_bgp_vid      = module.vlans["bgp"].vid
    
    # Data Networks (250-299)
    vlan_overlay_id   = module.vlans["overlay"].id
    vlan_overlay_name = module.vlans["overlay"].name
    vlan_overlay_vid  = module.vlans["overlay"].vid
    vlan_api_internal_id   = module.vlans["api_internal"].id
    vlan_api_internal_name = module.vlans["api_internal"].name
    vlan_api_internal_vid  = module.vlans["api_internal"].vid
    vlan_api_access_id   = module.vlans["api_access"].id
    vlan_api_access_name = module.vlans["api_access"].name
    vlan_api_access_vid  = module.vlans["api_access"].vid
    vlan_block_storage_id   = module.vlans["block_storage"].id
    vlan_block_storage_name = module.vlans["block_storage"].name
    vlan_block_storage_vid  = module.vlans["block_storage"].vid
    vlan_object_storage_access_id   = module.vlans["object_storage_access"].id
    vlan_object_storage_access_name = module.vlans["object_storage_access"].name
    vlan_object_storage_access_vid  = module.vlans["object_storage_access"].vid
    vlan_object_storage_replicate_id   = module.vlans["object_storage_replicate"].id
    vlan_object_storage_replicate_name = module.vlans["object_storage_replicate"].name
    vlan_object_storage_replicate_vid  = module.vlans["object_storage_replicate"].vid
    vlan_data_management_id   = module.vlans["data_management"].id
    vlan_data_management_name = module.vlans["data_management"].name
    vlan_data_management_vid  = module.vlans["data_management"].vid
  }
}

# ====== PREFIXOS ======
output "prefixes" {
  description = "Informações dos Prefixos"
  value = {
    # Container principal
    prefix_container_main_id   = module.prefix_container_main.id
    prefix_container_main_prefix = module.prefix_container_main.prefix
    
    # Data Networks - Containers /21
    prefix_overlay_id                    = module.prefix_overlay.id
    prefix_overlay_prefix                = module.prefix_overlay.prefix
    prefix_api_internal_id               = module.prefix_api_internal.id
    prefix_api_internal_prefix           = module.prefix_api_internal.prefix
    prefix_api_access_id                 = module.prefix_api_access.id
    prefix_api_access_prefix             = module.prefix_api_access.prefix
    prefix_block_storage_id              = module.prefix_block_storage.id
    prefix_block_storage_prefix          = module.prefix_block_storage.prefix
    prefix_object_storage_access_id      = module.prefix_object_storage_access.id
    prefix_object_storage_access_prefix  = module.prefix_object_storage_access.prefix
    prefix_object_storage_replicate_id   = module.prefix_object_storage_replicate.id
    prefix_object_storage_replicate_prefix = module.prefix_object_storage_replicate.prefix
    prefix_data_management_id            = module.prefix_data_management.id
    prefix_data_management_prefix        = module.prefix_data_management.prefix
    
    # Management Fabric - Containers /21
    prefix_oob_bmc_id                    = module.prefix_oob_bmc.id
    prefix_oob_bmc_prefix                = module.prefix_oob_bmc.prefix
    prefix_pxe_id                        = module.prefix_pxe.id
    prefix_pxe_prefix                    = module.prefix_pxe.prefix
    prefix_oam_id                        = module.prefix_oam.id
    prefix_oam_prefix                    = module.prefix_oam.prefix
    prefix_bgp_id                        = module.prefix_bgp.id
    prefix_bgp_prefix                    = module.prefix_bgp.prefix
  }
}

# ====== SUBNETS /26 ======
output "subnets_26" {
  description = "Informações das Sub-redes /26 para todos os racks (RACK03-RACK22)"
  value = {
    for key, module in module.prefix_subnets_26 : key => {
      id     = module.id
      prefix = module.prefix
    }
  }
}
# ====== MANUFACTURERS ======
output "manufacturers" {
  description = "Informações dos Manufacturers"
  value = {
    manufacturer_dell_id   = local.manufacturer_dell_id
  }
}

# ====== DEVICE ROLES ======
output "device_roles" {
  description = "Informações dos Device Roles"
  value = {
    role_switch_id   = local.role_switch_id
    role_server_id   = local.role_server_id
  }
}

# ====== DEVICE TYPES ======
output "device_types" {
  description = "Informações dos Device Types"
  value = {
    # Switches
    device_type_dell_750_id   = local.device_type_dell_750_id
    device_type_dell_n3248te_id   = local.device_type_dell_n3248te_id
    device_type_dell_s5248f_id   = local.device_type_dell_s5248f_id
    
    # Servidores
    device_type_dell_r750_balanced_id   = local.device_type_dell_r750_balanced_id
    device_type_dell_r750_gpu_id   = local.device_type_dell_r750_gpu_id
    device_type_dell_r750_performance_id   = local.device_type_dell_r750_performance_id
  }
}

