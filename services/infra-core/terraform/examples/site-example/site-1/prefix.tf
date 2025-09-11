# Prefixos para o Site Nordeste
# Este arquivo cria prefixos hierárquicos usando um mapa centralizado

# Local variables para prefixos
locals {
  # Container principal do site (pai)
  container_prefix = "${local.base_network}.0.0/16"
  
  # Mapeamento de sub-redes /21 para diferentes propósitos
  subnets = {
    # Data Networks (250-299)
    "overlay"                    = "${local.base_network}.8.0/21"    # VLAN 250 - Overlay network
    "api_internal"               = "${local.base_network}.16.0/21"   # VLAN 251 - API internal network
    "api_access"                 = "${local.base_network}.24.0/21"   # VLAN 252 - API access network
    "block_storage"              = "${local.base_network}.32.0/21"   # VLAN 253 - Block Storage network
    "object_storage_access"      = "${local.base_network}.40.0/21"   # VLAN 254 - Object Storage Access
    "object_storage_replicate"   = "${local.base_network}.48.0/21"   # VLAN 255 - Object Storage Replicate
    "data_management"            = "${local.base_network}.56.0/21"   # VLAN 256 - Data Management network
    
    # Management Fabric (100-199)
    "oob_bmc"                    = "${local.base_network}.208.0/21"  # VLAN 100 - OOB/BMC
    "pxe"                        = "${local.base_network}.216.0/21"  # VLAN 101 - PXE
    "oam"                        = "${local.base_network}.224.0/21"  # VLAN 102 - OAM
    "bgp"                        = "${local.base_network}.232.0/21"  # VLAN 103 - BGP
    
    # Reserved
    "other"                      = "${local.base_network}.240.0/21"  # Other
    "reserved"                   = "${local.base_network}.248.0/21"  # Reserved
  }
  
  # Mapeamento de racks (RACK03 a RACK22 = 20 racks)
  rack_numbers = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
  
  # Mapeamento de VLANs e seus prefixos base
  vlan_prefixes = {
    # Data Networks (250-299)
    "overlay"                    = "${local.base_network}.8.0/21"    # VLAN 250
    "api_internal"               = "${local.base_network}.16.0/21"   # VLAN 251
    "api_access"                 = "${local.base_network}.24.0/21"   # VLAN 252
    "block_storage"              = "${local.base_network}.32.0/21"   # VLAN 253
    "object_storage_access"      = "${local.base_network}.40.0/21"   # VLAN 254
    "object_storage_replicate"   = "${local.base_network}.48.0/21"   # VLAN 255
    "data_management"            = "${local.base_network}.56.0/21"   # VLAN 256
    
    # Management Fabric (100-199)
    "oob_bmc"                    = "${local.base_network}.208.0/21"  # VLAN 100
    "pxe"                        = "${local.base_network}.216.0/21"  # VLAN 101
    "oam"                        = "${local.base_network}.224.0/21"  # VLAN 102
    "bgp"                        = "${local.base_network}.232.0/21"  # VLAN 103
  }
  
  # Geração automática de sub-redes /26 para todos os racks
  subnets_26 = merge([
    for vlan_name, vlan_prefix in local.vlan_prefixes : {
      for rack_num in local.rack_numbers : 
      "${vlan_name}_${rack_num}" => {
        prefix = cidrsubnet(vlan_prefix, 5, rack_num - 3)
        vlan_name = vlan_name
        rack_num = rack_num
      }
    }
  ]...)
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

# Data Networks - Containers /21
module "prefix_overlay" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["overlay"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede Overlay (tunneling) para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["overlay"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_api_internal" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["api_internal"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede API internal para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["api_internal"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_api_access" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["api_access"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede API access para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["api_access"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_block_storage" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["block_storage"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede Block Storage para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["block_storage"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_object_storage_access" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["object_storage_access"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede Object Storage Access para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["object_storage_access"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_object_storage_replicate" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["object_storage_replicate"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede Object Storage Replicate para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["object_storage_replicate"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_data_management" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["data_management"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede Data Management para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["data_management"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# Management Fabric - Containers /21
module "prefix_oob_bmc" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["oob_bmc"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede OOB/BMC para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["oob_bmc"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_pxe" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["pxe"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede PXE para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["pxe"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_oam" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["oam"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede OAM para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["oam"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

module "prefix_bgp" {
  source = "../../../modules/netbox_prefix"
  
  prefix      = local.subnets["bgp"]
  status      = "container"  # Container porque é dividido em /26
  description = "Rede BGP para o ${local.site_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans["bgp"].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}

# ====== SUBNETS /26 (Netos) ======

# Geração automática de todas as sub-redes /26 para todos os racks
module "prefix_subnets_26" {
  source = "../../../modules/netbox_prefix"
  
  for_each = local.subnets_26
  
  prefix      = each.value.prefix
  status      = local.status_vlan_prefix
  description = "${module.vlans[each.value.vlan_name].name} - Block ${each.value.rack_num - 2} - RACK${format("%02d", each.value.rack_num)} - ${local.tenant_name}"
  site_id     = module.site_br-ne-1.id
  tenant_id   = module.tenant_br-ne-1.id
  vlan_id     = module.vlans[each.value.vlan_name].id
  tags        = [data.netbox_tag.tag_iac_network.name]
}