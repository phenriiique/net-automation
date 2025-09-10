# DELL 750 - Device Type
# Switch Dell 750

# ====== DEVICE TYPE ======

module "device_type_dell_750" {
  source = "../../modules/netbox_device_type"
  
  model           = "DELL 750"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-750"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell 750"
}
