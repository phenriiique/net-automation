# DELL R750 Performance - Device Type e Interface Templates
# Servidor Dell R750 Performance

# ====== DEVICE TYPE ======

module "device_type_dell_r750_performance" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL R750 - srv013 - Performance"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-R750-PERF"
  u_height        = 2
  is_full_depth   = true
  description     = "Servidor Dell R750 Performance"
}

# ====== INTERFACE TEMPLATES ======

# Interface de gerenciamento
module "interface_template_dell_r750_performance_mgmt" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_r750_performance.id
  name           = "mgmt0"
  type           = "1000base-t"
  mgmt_only      = true
  description    = "Interface de gerenciamento"
  label          = "Management"
}

# Interface Ethernet 0
module "interface_template_dell_r750_performance_eth0" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_r750_performance.id
  name           = "eth0"
  type           = "1000base-t"
  mgmt_only      = false
  description    = "Interface Ethernet 0"
  label          = "Ethernet 0"
}

# Interface Ethernet 1
module "interface_template_dell_r750_performance_eth1" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_r750_performance.id
  name           = "eth1"
  type           = "1000base-t"
  mgmt_only      = false
  description    = "Interface Ethernet 1"
  label          = "Ethernet 1"
}
