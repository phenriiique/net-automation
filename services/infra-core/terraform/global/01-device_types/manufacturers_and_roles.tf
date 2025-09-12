# Manufacturers e Device Roles Globais
# Este arquivo contém manufacturers e device roles que podem ser reutilizados por todos os sites

# ====== MANUFACTURERS ======

module "manufacturer_dell" {
  source = "../../modules/netbox_manufacturer"
  
  name        = "DELL"
  description = "Dell Technologies - Fabricante de servidores e switches"
}

# ====== DEVICE ROLES ======

module "role_switch" {
  source = "../../modules/netbox_device_role"
  
  name        = "SWITCH"
  color_hex   = "804000"  # Verde
  description = "Switch de rede"
}

module "role_server" {
  source = "../../modules/netbox_device_role"
  
  name        = "SERVER"
  color_hex   = "ff8000"  # Azul
  description = "Servidor"
}
