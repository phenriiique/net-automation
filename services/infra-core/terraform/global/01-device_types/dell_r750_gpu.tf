# DELL R750 GPU - Device Type e Interface Templates
# Servidor Dell R750 com GPU L40 e interfaces de rede
# Especificações:
# - IDRAC (gerenciamento)
# - SLOT-0-NIC1-1/2: 1000BASE-T (1GE)
# - SLOT-3-NIC1-1/2: SFP28 (25GE)
# - SLOT-6-NIC1-1/2: SFP28 (25GE)
# - SLOT-9-NIC1-1/2/3/4: 1000BASE-T (1GE)

# Local variables para interfaces do R750 GPU
locals {
  # Interface IDRAC (gerenciamento)
  r750_gpu_idrac_interfaces = {
    "idrac" = {
      name        = "IDRAC"
      type        = "1000base-t"
      mgmt_only   = true
      label       = "BMC"
    }
  }
  
  # SLOT-0-NIC1-1/2: 1000BASE-T (1GE)
  r750_gpu_slot0_interfaces = {
    "slot0_nic1_1" = {
      name        = "SLOT-0-NIC1-1"
      type        = "1000base-t"
      mgmt_only   = false
      label       = "OAM1"
    }
    "slot0_nic1_2" = {
      name        = "SLOT-0-NIC1-2"
      type        = "1000base-t"
      mgmt_only   = false
      label       = "OAM2"
    }
  }
  
  # SLOT-3-NIC1-1/2: SFP28 (25GE)
  r750_gpu_slot3_interfaces = {
    "slot3_nic1_1" = {
      name        = "SLOT-3-NIC1-1"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      label       = "DATA1-1"
    }
    "slot3_nic1_2" = {
      name        = "SLOT-3-NIC1-2"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      label       = "DATA1-2"
    }
  }
  
  # SLOT-6-NIC1-1/2: SFP28 (25GE)
  r750_gpu_slot6_interfaces = {
    "slot6_nic1_1" = {
      name        = "SLOT-6-NIC1-1"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      label       = "DATA2-1"
    }
    "slot6_nic1_2" = {
      name        = "SLOT-6-NIC1-2"
      type        = "25gbase-x-sfp28"
      mgmt_only   = false
      label       = "DATA2-2"
    }
  }
  
  # SLOT-9-NIC1-1/2/3/4: 1000BASE-T (1GE)
  r750_gpu_slot9_interfaces = {
    "slot9_nic1_1" = {
      name        = "SLOT-9-NIC1-1"
      type        = "1000base-t"
      mgmt_only   = false
      label       = "DATA3-1"
    }
    "slot9_nic1_2" = {
      name        = "SLOT-9-NIC1-2"
      type        = "1000base-t"
      mgmt_only   = false
      label       = "DATA3-2"
    }
    "slot9_nic1_3" = {
      name        = "SLOT-9-NIC1-3"
      type        = "1000base-t"
      mgmt_only   = false
      label       = "DATA3-3"
    }
    "slot9_nic1_4" = {
      name        = "SLOT-9-NIC1-4"
      type        = "1000base-t"
      mgmt_only   = false
      label       = "DATA3-4"
    }
  }
  
  # Todas as interfaces combinadas
  r750_gpu_all_interfaces = merge(
    local.r750_gpu_idrac_interfaces,
    local.r750_gpu_slot0_interfaces,
    local.r750_gpu_slot3_interfaces,
    local.r750_gpu_slot6_interfaces,
    local.r750_gpu_slot9_interfaces
  )
}

# ====== DEVICE TYPE ======

module "device_type_dell_r750_gpu" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL R750 - srv00a - GPU (L40)"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-R750-GPU"
  u_height        = 2
  is_full_depth   = true
  description     = "Servidor Dell R750 com GPU L40 - 2U Rack Server"
}

# ====== INTERFACE TEMPLATES ======

# Geração automática de todas as interfaces
module "interface_templates_dell_r750_gpu" {
  source = "../../modules/netbox_interface_template"
  
  for_each = local.r750_gpu_all_interfaces
  
  device_type_id = module.device_type_dell_r750_gpu.id
  name           = each.value.name
  type           = each.value.type
  mgmt_only      = each.value.mgmt_only
  label          = each.value.label
}