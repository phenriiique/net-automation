# DELL R750 Balanced - Device Type e Interface Templates
# Servidor Dell R750 Balanced com interfaces de rede
# Especificações:
# - IDRAC (gerenciamento)
# - SLOT-0-NIC1-1/2: 1000BASE-T (1GE)
# - SLOT-6-NIC1-1/2: SFP28 (25GE)
# - SLOT-7-NIC1-1/2: SFP28 (25GE)
# - SLOT-9-NIC1-1/2/3/4: 1000BASE-T (1GE)

# Local variables para interfaces do R750 Balanced
locals {
  # Interface IDRAC (gerenciamento)
  r750_balanced_idrac_interfaces = {
    "idrac" = {
      name        = "IDRAC"
      type        = "1000base-t"
      mgmt_only   = true
      description = "Interface IDRAC (gerenciamento)"
      label       = "IDRAC"
    }
  }
  
  # SLOT-0-NIC1-1/2: 1000BASE-T (1GE)
  r750_balanced_slot0_interfaces = {
    "slot0_nic1_1" = {
      name        = "SLOT-0-NIC1-1"
      type        = "1000base-t"
      mgmt_only   = false
      description = "SLOT-0-NIC1-1 - 1000BASE-T (1GE)"
      label       = "SLOT-0-NIC1-1"
    }
    "slot0_nic1_2" = {
      name        = "SLOT-0-NIC1-2"
      type        = "1000base-t"
      mgmt_only   = false
      description = "SLOT-0-NIC1-2 - 1000BASE-T (1GE)"
      label       = "SLOT-0-NIC1-2"
    }
  }
  
  # SLOT-6-NIC1-1/2: SFP28 (25GE)
  r750_balanced_slot6_interfaces = {
    "slot6_nic1_1" = {
      name        = "SLOT-6-NIC1-1"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      description = "SLOT-6-NIC1-1 - SFP28 (25GE)"
      label       = "SLOT-6-NIC1-1"
    }
    "slot6_nic1_2" = {
      name        = "SLOT-6-NIC1-2"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      description = "SLOT-6-NIC1-2 - SFP28 (25GE)"
      label       = "SLOT-6-NIC1-2"
    }
  }
  
  # SLOT-7-NIC1-1/2: SFP28 (25GE)
  r750_balanced_slot7_interfaces = {
    "slot7_nic1_1" = {
      name        = "SLOT-7-NIC1-1"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      description = "SLOT-7-NIC1-1 - SFP28 (25GE)"
      label       = "SLOT-7-NIC1-1"
    }
    "slot7_nic1_2" = {
      name        = "SLOT-7-NIC1-2"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      description = "SLOT-7-NIC1-2 - SFP28 (25GE)"
      label       = "SLOT-7-NIC1-2"
    }
  }
  
  # SLOT-9-NIC1-1/2/3/4: 1000BASE-T (1GE)
  r750_balanced_slot9_interfaces = {
    "slot9_nic1_1" = {
      name        = "SLOT-9-NIC1-1"
      type        = "1000base-t"
      mgmt_only   = false
      description = "SLOT-9-NIC1-1 - 1000BASE-T (1GE)"
      label       = "SLOT-9-NIC1-1"
    }
    "slot9_nic1_2" = {
      name        = "SLOT-9-NIC1-2"
      type        = "1000base-t"
      mgmt_only   = false
      description = "SLOT-9-NIC1-2 - 1000BASE-T (1GE)"
      label       = "SLOT-9-NIC1-2"
    }
    "slot9_nic1_3" = {
      name        = "SLOT-9-NIC1-3"
      type        = "1000base-t"
      mgmt_only   = false
      description = "SLOT-9-NIC1-3 - 1000BASE-T (1GE)"
      label       = "SLOT-9-NIC1-3"
    }
    "slot9_nic1_4" = {
      name        = "SLOT-9-NIC1-4"
      type        = "1000base-t"
      mgmt_only   = false
      description = "SLOT-9-NIC1-4 - 1000BASE-T (1GE)"
      label       = "SLOT-9-NIC1-4"
    }
  }
  
  # Todas as interfaces combinadas
  r750_balanced_all_interfaces = merge(
    local.r750_balanced_idrac_interfaces,
    local.r750_balanced_slot0_interfaces,
    local.r750_balanced_slot6_interfaces,
    local.r750_balanced_slot7_interfaces,
    local.r750_balanced_slot9_interfaces
  )
}

# ====== DEVICE TYPE ======

module "device_type_dell_r750_balanced" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL R750 - srv009 - Balanced"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-R750-BAL"
  u_height        = 2
  is_full_depth   = true
  description     = "Servidor Dell R750 Balanced - 2U Rack Server"
}

# ====== INTERFACE TEMPLATES ======

# Geração automática de todas as interfaces
module "interface_templates_dell_r750_balanced" {
  source = "../../modules/netbox_interface_template"
  
  for_each = local.r750_balanced_all_interfaces
  
  device_type_id = module.device_type_dell_r750_balanced.id
  name           = each.value.name
  type           = each.value.type
  mgmt_only      = each.value.mgmt_only
  description    = each.value.description
  label          = each.value.label
}