# DELL S5248F - Device Type e Interface Templates
# Switch Dell S5248F

# ====== DEVICE TYPE ======

module "device_type_dell_s5248f" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL S5248F"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-S5248F"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell S5248F"
}

# ====== INTERFACE TEMPLATES ======

# Interface de gerenciamento
module "interface_template_dell_s5248f_mgmt" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_s5248f.id
  name           = "mgmt0"
  type           = "1000base-t"
  mgmt_only      = true
  description    = "Interface de gerenciamento"
  label          = "Management"
}

# Porta 10 Gigabit Ethernet 1/0/1
module "interface_template_dell_s5248f_te_1" {
  source = "../../modules/netbox_interface_template"
  
  device_type_id = module.device_type_dell_s5248f.id
  name           = "TenGigabitEthernet1/0/1"
  type           = "10gbase-t"
  mgmt_only      = false
  description    = "Porta 10 Gigabit Ethernet 1/0/1"
  label          = "10GE 1/0/1"
}
