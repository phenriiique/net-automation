# Tags Globais
# Este arquivo cria todas as tags que podem ser reutilizadas por todos os sites

# ====== Tags de Ambiente ======



# ====== Tags de Infraestrutura ======

module "tag_management" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_management"
  description = "Interfaces de gerenciamento"
  color_hex   = "808080"
}

module "tag_iac_network" {
  source = "../../modules/netbox_tag"
  
  name        = "iac_network"
  description = "Infrastructure as Code - Network resources"
  color_hex   = "0000ff"
}

# ====== Tags de Switches ======

module "tag_switch_dados" {
  source = "../../modules/netbox_tag"
  
  name        = "switch_dados"
  description = "Data switches"
  color_hex   = "00ff00"
}

module "tag_switch_dados_a" {
  source = "../../modules/netbox_tag"
  
  name        = "switch_dados_a"
  description = "Data switches - A"
  color_hex   = "00cc00"
}

module "tag_switch_dados_b" {
  source = "../../modules/netbox_tag"
  
  name        = "switch_dados_b"
  description = "Data switches - B"
  color_hex   = "009900"
}

module "tag_switch_oam" {
  source = "../../modules/netbox_tag"
  
  name        = "switch_oam"
  description = "OAM (Operations, Administration and Maintenance) switches"
  color_hex   = "ff6600"
}

module "tag_switch_oam_a" {
  source = "../../modules/netbox_tag"
  
  name        = "switch_oam_a"
  description = "OAM switches - A"
  color_hex   = "ff5500"
}

module "tag_switch_oam_b" {
  source = "../../modules/netbox_tag"
  
  name        = "switch_oam_b"
  description = "OAM switches - B"
  color_hex   = "ff4400"
}

# ====== Tags de Interfaces ======

module "tag_interface_data_slot_1_1" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_data_slot_1-1"
  description = "Interface de dados - Slot 1-1"
  color_hex   = "0066cc"
}

module "tag_interface_data_slot_1_2" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_data_slot_1-2"
  description = "Interface de dados - Slot 1-2"
  color_hex   = "0055bb"
}

module "tag_interface_data_slot_2_1" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_data_slot_2-1"
  description = "Interface de dados - Slot 2-1"
  color_hex   = "0044aa"
}

module "tag_interface_data_slot_2_2" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_data_slot_2-2"
  description = "Interface de dados - Slot 2-2"
  color_hex   = "003399"
}

module "tag_interface_oam_slot_2_2" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_oam_1-1"
  description = "Interface OAM - Slot 0-1"
  color_hex   = "cc6600"
}

module "tag_interface_oam_2_2" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_oam_1-2"
  description = "Interface OAM - Slot 0-1"
  color_hex   = "bb5500"
}

module "tag_interface_bmc" {
  source = "../../modules/netbox_tag"
  
  name        = "interface_bmc"
  description = "Interface BMC (Baseboard Management Controller)"
  color_hex   = "9900cc"
}
