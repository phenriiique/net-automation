# DELL N3248TE - Device Type e Interface Templates
# Switch Dell N3248TE-ON
# Especificações:
# - 48 portas RJ45 Gigabit Ethernet (1/0/1 a 1/0/48)
# - 4 portas SFP+ 10 GbE (1/0/49 a 1/0/52)
# - 2 portas QSFP28 100 GbE (1/0/53 a 1/0/54)
# - 1 porta de gerenciamento (mgmt0)

# Local variables para interfaces do N3248TE
locals {
  # Interface de gerenciamento
  n3248te_mgmt_interfaces = {
    "mgmt0" = {
      name        = "MGMT"
      type        = "1000base-t"
      mgmt_only   = true
      description = "Interface de gerenciamento"
      label       = "Management"
    }
  }
  
  # Portas RJ45 Gigabit Ethernet (1/0/1 a 1/0/48)
  n3248te_rj45_interfaces = {
    for i in range(1, 49) : "ge_1_0_${i}" => {
      name        = "0/${i}"
      type        = "1000base-t"
      mgmt_only   = false
      description = "Porta Gigabit Ethernet 1/0/${i}"
      label       = "Eth 1/1/${i}"
    }
  }
  
  # Portas SFP+ 10 GbE (1/0/49 a 1/0/52)
  n3248te_sfp_interfaces = {
    for i in range(49, 53) : "sfp_1_0_${i}" => {
      name        = "0/${i}"
      type        = "10gbase-x-sfpp"
      mgmt_only   = false
      description = "Porta SFP+ 10 GbE 1/0/${i}"
      label       = "10GE 1/0/${i}"
    }
  }
  
  # Portas QSFP28 100 GbE (1/0/53 a 1/0/54)
  n3248te_qsfp_interfaces = {
    for i in range(53, 55) : "qsfp_1_0_${i}" => {
      name        = "0/${i}"
      type        = "100gbase-x-qsfp28"
      mgmt_only   = false
      description = "Porta QSFP28 100 GbE 1/0/${i}"
      label       = "100GE 1/0/${i}"
    }
  }
  
  # Todas as interfaces combinadas
  n3248te_all_interfaces = merge(
    local.n3248te_mgmt_interfaces,
    local.n3248te_rj45_interfaces,
    local.n3248te_sfp_interfaces,
    local.n3248te_qsfp_interfaces
  )
}

# ====== DEVICE TYPE ======

module "device_type_dell_n3248te" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL N3248TE-ON"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-N3248TE"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell N3248TE-ON - 48x1GbE RJ45 + 4x10GbE SFP+ + 2x100GbE QSFP28"
}

# ====== INTERFACE TEMPLATES ======

# Geração automática de todas as interfaces
module "interface_templates_dell_n3248te" {
  source = "../../modules/netbox_interface_template"
  
  for_each = local.n3248te_all_interfaces
  
  device_type_id = module.device_type_dell_n3248te.id
  name           = each.value.name
  type           = each.value.type
  mgmt_only      = each.value.mgmt_only
  description    = each.value.description
  label          = each.value.label
}