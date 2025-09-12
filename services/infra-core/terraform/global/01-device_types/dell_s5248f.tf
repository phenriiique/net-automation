# DELL S5248F - Device Type e Interface Templates
# Switch Dell S5248F
# Especificações:
# - 48 portas SFP28 25 GbE (0/1 a 0/48)
# - 8 portas QSFP28 100 GbE (0/49 a 0/56)
# - 1 porta de gerenciamento (MGMT)

# Local variables para interfaces do S5248F
locals {
  # Interface de gerenciamento
  s5248f_mgmt_interfaces = {
    "mgmt0" = {
      name        = "MGMT"
      type        = "1000base-t"
      mgmt_only   = true
      description = "Interface de gerenciamento"
      label       = "Management"
    }
  }
  
  # Portas SFP28 25 GbE (0/1 a 0/48)
  s5248f_25g_interfaces = {
    for i in range(1, 49) : "sfp28_0_${i}" => {
      name        = "0/${i}"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      description = "Porta SFP28 25 GbE 0/${i}"
      label       = "25GE 0/${i}"
    }
  }
  
  # Portas QSFP28 100 GbE (0/49 a 0/56)
  s5248f_100g_interfaces = {
    for i in range(49, 57) : "qsfp28_0_${i}" => {
      name        = "0/${i}"
      type        = "100gbase-x-qsfp28"
      mgmt_only   = false
      description = "Porta QSFP28 100 GbE 0/${i}"
      label       = "100GE 0/${i}"
    }
  }
  
  # Todas as interfaces combinadas
  s5248f_all_interfaces = merge(
    local.s5248f_mgmt_interfaces,
    local.s5248f_25g_interfaces,
    local.s5248f_100g_interfaces
  )
}

# ====== DEVICE TYPE ======

module "device_type_dell_s5248f" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL S5248F"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-S5248F"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell S5248F - 48x25GbE SFP28 + 8x100GbE QSFP28"
}

# ====== INTERFACE TEMPLATES ======

# Geração automática de todas as interfaces
module "interface_templates_dell_s5248f" {
  source = "../../modules/netbox_interface_template"
  
  for_each = local.s5248f_all_interfaces
  
  device_type_id = module.device_type_dell_s5248f.id
  name           = each.value.name
  type           = each.value.type
  mgmt_only      = each.value.mgmt_only
  description    = each.value.description
  label          = each.value.label
}