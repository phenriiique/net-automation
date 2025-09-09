# Infraestrutura base para devices
# Este arquivo cria manufacturers, roles e device types necessários

# ====== MANUFACTURERS ======

module "manufacturer_dell" {
  source = "../../../modules/netbox_manufacturer"
  
  name        = "DELL"
  description = "Dell Technologies - Fabricante de servidores e switches"
}

# ====== DEVICE ROLES ======

module "role_switch" {
  source = "../../../modules/netbox_device_role"
  
  name        = "SWITCH"
  color_hex   = "804000"  # Verde
  description = "Switch de rede"
}

module "role_server" {
  source = "../../../modules/netbox_device_role"
  
  name        = "SERVER"
  color_hex   = "ff8000"  # Azul
  description = "Servidor"
}

# ====== DEVICE TYPES ======

# Switches Dell
module "device_type_dell_750" {
  source = "../../../modules/netbox_device_type"
  
  model           = "DELL 750"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-750"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell 750"
}

module "device_type_dell_n3248te" {
  source = "../../../modules/netbox_device_type"
  
  model           = "DELL N3248TE-ON"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-N3248TE"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell N3248TE-ON"
}

module "device_type_dell_s5248f" {
  source = "../../../modules/netbox_device_type"
  
  model           = "DELL S5248F"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-S5248F"
  u_height        = 1
  is_full_depth   = false
  description     = "Switch Dell S5248F"
}

# Servidores Dell
module "device_type_dell_r750_balanced" {
  source = "../../../modules/netbox_device_type"
  
  model           = "DELL R750 - srv009 - Balanced"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-R750-BAL"
  u_height        = 2
  is_full_depth   = true
  description     = "Servidor Dell R750 Balanced"
}

module "device_type_dell_r750_gpu" {
  source = "../../../modules/netbox_device_type"
  
  model           = "DELL R750 - srv00a - GPU (L40)"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-R750-GPU"
  u_height        = 2
  is_full_depth   = true
  description     = "Servidor Dell R750 com GPU L40"
}

module "device_type_dell_r750_performance" {
  source = "../../../modules/netbox_device_type"
  
  model           = "DELL R750 - srv013 - Performance"
  manufacturer_id = module.manufacturer_dell.id
  part_number     = "DELL-R750-PERF"
  u_height        = 2
  is_full_depth   = true
  description     = "Servidor Dell R750 Performance"
}
