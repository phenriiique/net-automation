# DELL N3248TE - Device Type e Interface Templates
# Switch Dell N3248TE-ON

# ====== DEVICE TYPE ======

module "device_type_dell_n3248te" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL N3248TE-ON"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-N3248TE"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell N3248TE-ON"
}

# ====== INTERFACE TEMPLATES ======

# Interface de gerenciamento
module "interface_template_dell_n3248te_mgmt" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_n3248te.id
  name           = "mgmt0"
  type           = "1000base-t"
  mgmt_only      = true
  description    = "Interface de gerenciamento"
  label          = "Management"
}

# Porta Gigabit Ethernet 1/0/1
module "interface_template_dell_n3248te_ge_1" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_n3248te.id
  name           = "GigabitEthernet1/0/1"
  type           = "1000base-t"
  mgmt_only      = false
  description    = "Porta Gigabit Ethernet 1/0/1"
  label          = "GE 1/0/1"
}

# Porta Gigabit Ethernet 1/0/2
module "interface_template_dell_n3248te_ge_2" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_n3248te.id
  name           = "GigabitEthernet1/0/2"
  type           = "1000base-t"
  mgmt_only      = false
  description    = "Porta Gigabit Ethernet 1/0/2"
  label          = "GE 1/0/2"
}
