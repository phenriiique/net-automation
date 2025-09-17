# RACK04 - População de servidores e switches
# 18 servidores e 4 switches conforme especificação
# Layout organizado de baixo para cima (como no Netbox)

# ====== RACK04 - LAYOUT DE BAIXO PARA CIMA ======

# U43-U44 - SWT - S5248F (Topo do Rack)
module "device_swt_004_004" {
  source = "../../modules/netbox_device"
  
  name           = "SWT-004-004"
  device_type_id = local.device_type_dell_s5248f_id
  role_id        = local.role_switch_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 22
  rack_face      = "rear"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Switch S5248F - RACK04 U43-U44"
  tags           = [local.tag_iac_network, local.tag_switch_dados, local.tag_switch_dados_a]
}

# U41-U42 - SWT - S5248F
module "device_swt_004_003" {
  source = "../../modules/netbox_device"
  
  name           = "SWT-004-003"
  device_type_id = local.device_type_dell_s5248f_id
  role_id        = local.role_switch_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 24
  rack_face      = "rear"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Switch S5248F - RACK04 U41-U42"
  tags           = [local.tag_iac_network, local.tag_switch_dados, local.tag_switch_dados_b]
}

# U39-U40 - SWT - N3248TE
module "device_swt_004_002" {
  source = "../../modules/netbox_device"
  
  name           = "SWT-004-002"
  device_type_id = local.device_type_dell_n3248te_id
  role_id        = local.role_switch_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 26
  rack_face      = "rear"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Switch N3248TE - RACK04 U39-U40"
  tags           = [local.tag_iac_network , local.tag_switch_oam, local.tag_switch_oam_a]
}

# U37-U38 - SWT - N3248TE
module "device_swt_004_001" {
  source = "../../modules/netbox_device"
  
  name           = "SWT-004-001"
  device_type_id = local.device_type_dell_n3248te_id
  role_id        = local.role_switch_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 28
  rack_face      = "rear"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Switch N3248TE - RACK04 U37-U38"
  tags           = [local.tag_iac_network, local.tag_switch_oam, local.tag_switch_oam_b]
}

# ====== SERVIDORES - PERFORMANCE ======

# U35-U36 - SRV - Performance
module "device_srv_004_018" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-018"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 43
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U35-U36"
  tags           = [local.tag_iac_network]
}

# U33-U34 - SRV - Performance
module "device_srv_004_017" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-017"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 41
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U33-U34"
  tags           = [local.tag_iac_network]
}

# U31-U32 - SRV - Performance
module "device_srv_004_016" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-016"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 39
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U31-U32"
  tags           = [local.tag_iac_network]
}

# U29-U30 - SRV - Performance
module "device_srv_004_015" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-015"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 37
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U29-U30"
  tags           = [local.tag_iac_network]
}

# U27-U28 - SRV - Performance
module "device_srv_004_014" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-014"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 35
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U27-U28"
  tags           = [local.tag_iac_network]
}

# U25-U26 - SRV - Performance
module "device_srv_004_013" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-013"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 33
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U25-U26"
  tags           = [local.tag_iac_network]
}

# U23-U24 - SRV - Performance
module "device_srv_004_012" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-012"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 31
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U23-U24"
  tags           = [local.tag_iac_network]
}

# ====== SERVIDORES - GPU ======

# U21-U22 - SRV - GPU
module "device_srv_004_011" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-011"
  device_type_id = local.device_type_dell_r750_gpu_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 29
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor GPU - RACK04 U21-U22"
  tags           = [local.tag_iac_network]
}

# U19-U20 - SRV - GPU
module "device_srv_004_010" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-010"
  device_type_id = local.device_type_dell_r750_gpu_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 19
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor GPU - RACK04 U19-U20"
  tags           = [local.tag_iac_network]
}

# ====== SERVIDORES - BALANCED ======

# U17-U18 - SRV - Balanced
module "device_srv_004_009" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-009"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 17
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U17-U18"
  tags           = [local.tag_iac_network]
}

# U15-U16 - SRV - Balanced
module "device_srv_004_008" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-008"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 15
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U15-U16"
  tags           = [local.tag_iac_network]
}

# U13-U14 - SRV - Balanced
module "device_srv_004_007" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-007"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 13
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U13-U14"
  tags           = [local.tag_iac_network]
}

# U11-U12 - SRV - Balanced
module "device_srv_004_006" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-006"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 11
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U11-U12"
  tags           = [local.tag_iac_network]
}

# U9-U10 - SRV - Balanced
module "device_srv_004_005" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-005"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 9
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U9-U10"
  tags           = [local.tag_iac_network]
}

# U7-U8 - SRV - Balanced
module "device_srv_004_004" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-004"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 7
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U7-U8"
  tags           = [local.tag_iac_network]
}

# U5-U6 - SRV - Balanced
module "device_srv_004_003" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-003"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 5
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U5-U6"
  tags           = [local.tag_iac_network]
}

# U3-U4 - SRV - Performance
module "device_srv_004_002" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-002"
  device_type_id = local.device_type_dell_r750_performance_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 3
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Performance - RACK04 U3-U4"
  tags           = [local.tag_iac_network]
}

# U1-U2 - SRV - Balanced (Base do Rack)
module "device_srv_004_001" {
  source = "../../modules/netbox_device"
  
  name           = "SRV-004-001"
  device_type_id = local.device_type_dell_r750_balanced_id
  role_id        = local.role_server_id
  site_id        = local.site_id
  rack_id        = netbox_rack.racks[4].id
  rack_position  = 1
  rack_face      = "front"
  status         = var.status
  tenant_id      = local.tenant_id
  description    = "Servidor Balanced - RACK04 U1-U2"
  tags           = [local.tag_iac_network]
}
