# RACK03 - População de servidores e switches
# 18 servidores e 4 switches conforme especificação
# Layout reorganizado para evitar conflitos

# ====== SERVIDORES ======

# U1-U2 - SRV - Balanced
module "device_srv_003_001" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-001"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 1
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U1-U2"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U3-U4 - SRV - Performance
module "device_srv_003_002" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-002"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 3
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Performance - RACK03 U3-U4"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U5-U6 - SRV - Balanced
module "device_srv_003_003" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-003"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 5
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U5-U6"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U7-U8 - SRV - Balanced
module "device_srv_003_004" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-004"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 7
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U7-U8"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U9-U10 - SRV - Balanced
module "device_srv_003_005" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-005"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 9
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U9-U10"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U11-U12 - SRV - Balanced
module "device_srv_003_006" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-006"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 11
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U11-U12"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U13-U14 - SRV - Balanced
module "device_srv_003_007" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-007"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 13
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U13-U14"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U15-U16 - SRV - Balanced
module "device_srv_003_008" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-008"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 15
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U15-U16"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U17-U18 - SRV - Balanced
module "device_srv_003_009" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-009"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 17
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U17-U18"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U19-U20 - SRV - Balanced
module "device_srv_003_010" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-010"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 19
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Balanced - RACK03 U19-U20"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U29-U30 - SRV - GPU
module "device_srv_003_011" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-011"
  device_type_id = local.device_type_dell_r750_gpu_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 29
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor GPU - RACK03 U29-U30"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U31-U32 - SRV - GPU
module "device_srv_003_012" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-012"
  device_type_id = local.device_type_dell_r750_gpu_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 31
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor GPU - RACK03 U31-U32"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U33-U34 - SRV - Performance
module "device_srv_003_013" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-013"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 33
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Performance - RACK03 U33-U34"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U35-U36 - SRV - Performance
module "device_srv_003_014" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-014"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 35
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Performance - RACK03 U35-U36"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U37-U38 - SRV - Performance
module "device_srv_003_015" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-015"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 37
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Performance - RACK03 U37-U38"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U39-U40 - SRV - Performance
module "device_srv_003_016" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-016"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 39
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Performance - RACK03 U39-U40"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U41-U42 - SRV - Performance
module "device_srv_003_017" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-017"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 41
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Performance - RACK03 U41-U42"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U43-U44 - SRV - Performance
module "device_srv_003_018" {
  source = "../../../modules/netbox_device"
  
  name           = "SRV-003-018"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 43
  rack_face      = "front"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Servidor Performance - RACK03 U43-U44"
  tags           = [data.netbox_tag.tag_iac_network.name]
}


# ====== SWITCHES ======

# U26 - SWT - N3248TE
module "device_swt_003_001" {
  source = "../../../modules/netbox_device"
  
  name           = "SWT-003-001"
  device_type_id = local.device_type_dell_n3248te_id
  role_id        = local.role_switch_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 28
  rack_face      = "rear"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Switch N3248TE - RACK03 U26"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U28 - SWT - N3248TE
module "device_swt_003_002" {
  source = "../../../modules/netbox_device"
  
  name           = "SWT-003-002"
  device_type_id = local.device_type_dell_n3248te_id
  role_id        = local.role_switch_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 26
  rack_face      = "rear"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Switch N3248TE - RACK03 U28"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U22 - SWT - S5248F
module "device_swt_003_003" {
  source = "../../../modules/netbox_device"
  
  name           = "SWT-003-003"
  device_type_id = local.device_type_dell_s5248f_id
  role_id        = local.role_switch_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 24
  rack_face      = "rear"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Switch S5248F - RACK03 U22"
  tags           = [data.netbox_tag.tag_iac_network.name]
}

# U24 - SWT - S5248F
module "device_swt_003_004" {
  source = "../../../modules/netbox_device"
  
  name           = "SWT-003-004"
  device_type_id = local.device_type_dell_s5248f_id
  role_id        = local.role_switch_id
  site_id        = module.site_br-ne-1.id
  rack_id        = netbox_rack.racks[3].id
  rack_position  = 22
  rack_face      = "rear"
  status         = local.status_vlan_prefix
  tenant_id      = module.tenant_br-ne-1.id
  description    = "Switch S5248F - RACK03 U24"
  tags           = [data.netbox_tag.tag_iac_network.name]
}