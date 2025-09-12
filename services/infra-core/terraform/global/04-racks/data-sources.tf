# Data Sources para global/racks
# Este arquivo coleta informações dos recursos necessários via data sources nativos do Netbox

# ====== DATA SOURCES PARA SITE E TENANT ======
data "netbox_site" "site_nordeste" {
  name = "Site Nordeste"
}

data "netbox_tenant" "tenant_br_ne_1" {
  name = "br-ne-1"
}

# ====== DATA SOURCES PARA DEVICE TYPES ======
data "netbox_device_type" "dell_r750_balanced" {
  model = "DELL R750 - srv009 - Balanced"
}

data "netbox_device_type" "dell_r750_performance" {
  model = "DELL R750 - srv013 - Performance"
}

data "netbox_device_type" "dell_r750_gpu" {
  model = "DELL R750 - srv00a - GPU (L40)"
}

data "netbox_device_type" "dell_n3248te" {
  model = "DELL N3248TE-ON"
}

data "netbox_device_type" "dell_s5248f" {
  model = "DELL S5248F"
}

# ====== DATA SOURCES PARA DEVICE ROLES ======
data "netbox_device_role" "role_server" {
  name = "SERVER"
}

data "netbox_device_role" "role_switch" {
  name = "SWITCH"
}

# ====== DATA SOURCES PARA TAGS ======
data "netbox_tag" "tag_iac_network" {
  name = "iac_network"
}

data "netbox_tag" "tag_switch_dados" {
  name = "switch_dados"
}

data "netbox_tag" "tag_switch_dados_a" {
  name = "switch_dados_a"
}

data "netbox_tag" "tag_switch_dados_b" {
  name = "switch_dados_b"
}

data "netbox_tag" "tag_switch_oam" {
  name = "switch_oam"
}

data "netbox_tag" "tag_switch_oam_a" {
  name = "switch_oam_a"
}

data "netbox_tag" "tag_switch_oam_b" {
  name = "switch_oam_b"
}

# ====== LOCALS PARA FACILITAR O USO ======

locals {
  # IDs do site e tenant
  site_id = data.netbox_site.site_nordeste.id
  tenant_id = data.netbox_tenant.tenant_br_ne_1.id
  
  # IDs dos device types
  device_type_dell_r750_balanced_id = data.netbox_device_type.dell_r750_balanced.id
  device_type_dell_r750_performance_id = data.netbox_device_type.dell_r750_performance.id
  device_type_dell_r750_gpu_id = data.netbox_device_type.dell_r750_gpu.id
  device_type_dell_n3248te_id = data.netbox_device_type.dell_n3248te.id
  device_type_dell_s5248f_id = data.netbox_device_type.dell_s5248f.id
  
  # IDs dos device roles
  role_server_id = data.netbox_device_role.role_server.id
  role_switch_id = data.netbox_device_role.role_switch.id
  
  # Tag iac_network
  tag_iac_network = data.netbox_tag.tag_iac_network.name
  tag_switch_dados = data.netbox_tag.tag_switch_dados.name
  tag_switch_dados_a = data.netbox_tag.tag_switch_dados_a.name
  tag_switch_dados_b = data.netbox_tag.tag_switch_dados_b.name
  tag_switch_oam = data.netbox_tag.tag_switch_oam.name
  tag_switch_oam_a = data.netbox_tag.tag_switch_oam_a.name
  tag_switch_oam_b = data.netbox_tag.tag_switch_oam_b.name
}
