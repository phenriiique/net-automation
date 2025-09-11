# Outputs das Tags Globais
# Este arquivo expõe os IDs das tags para uso em outros diretórios

# ====== Tags de Infraestrutura ======
output "tag_management_id" {
  description = "ID da tag interface_management"
  value       = module.tag_management.id
}

output "tag_management_name" {
  description = "Nome da tag interface_management"
  value       = module.tag_management.name
}

output "tag_iac_network_id" {
  description = "ID da tag iac_network"
  value       = module.tag_iac_network.id
}

output "tag_iac_network_name" {
  description = "Nome da tag iac_network"
  value       = module.tag_iac_network.name
}

# ====== Tags de Switches ======
output "tag_switch_dados_id" {
  description = "ID da tag switch_dados"
  value       = module.tag_switch_dados.id
}

output "tag_switch_dados_name" {
  description = "Nome da tag switch_dados"
  value       = module.tag_switch_dados.name
}

output "tag_switch_dados_a_id" {
  description = "ID da tag switch_dados_a"
  value       = module.tag_switch_dados_a.id
}

output "tag_switch_dados_a_name" {
  description = "Nome da tag switch_dados_a"
  value       = module.tag_switch_dados_a.name
}

output "tag_switch_dados_b_id" {
  description = "ID da tag switch_dados_b"
  value       = module.tag_switch_dados_b.id
}

output "tag_switch_dados_b_name" {
  description = "Nome da tag switch_dados_b"
  value       = module.tag_switch_dados_b.name
}

output "tag_switch_oam_id" {
  description = "ID da tag switch_oam"
  value       = module.tag_switch_oam.id
}

output "tag_switch_oam_name" {
  description = "Nome da tag switch_oam"
  value       = module.tag_switch_oam.name
}

output "tag_switch_oam_a_id" {
  description = "ID da tag switch_oam_a"
  value       = module.tag_switch_oam_a.id
}

output "tag_switch_oam_a_name" {
  description = "Nome da tag switch_oam_a"
  value       = module.tag_switch_oam_a.name
}

output "tag_switch_oam_b_id" {
  description = "ID da tag switch_oam_b"
  value       = module.tag_switch_oam_b.id
}

output "tag_switch_oam_b_name" {
  description = "Nome da tag switch_oam_b"
  value       = module.tag_switch_oam_b.name
}

# ====== Tags de Interfaces ======
output "tag_interface_data_slot_1_1_id" {
  description = "ID da tag interface_data_slot_1-1"
  value       = module.tag_interface_data_slot_1_1.id
}

output "tag_interface_data_slot_1_1_name" {
  description = "Nome da tag interface_data_slot_1-1"
  value       = module.tag_interface_data_slot_1_1.name
}

output "tag_interface_data_slot_1_2_id" {
  description = "ID da tag interface_data_slot_1-2"
  value       = module.tag_interface_data_slot_1_2.id
}

output "tag_interface_data_slot_1_2_name" {
  description = "Nome da tag interface_data_slot_1-2"
  value       = module.tag_interface_data_slot_1_2.name
}

output "tag_interface_data_slot_2_1_id" {
  description = "ID da tag interface_data_slot_2-1"
  value       = module.tag_interface_data_slot_2_1.id
}

output "tag_interface_data_slot_2_1_name" {
  description = "Nome da tag interface_data_slot_2-1"
  value       = module.tag_interface_data_slot_2_1.name
}

output "tag_interface_data_slot_2_2_id" {
  description = "ID da tag interface_data_slot_2-2"
  value       = module.tag_interface_data_slot_2_2.id
}

output "tag_interface_data_slot_2_2_name" {
  description = "Nome da tag interface_data_slot_2-2"
  value       = module.tag_interface_data_slot_2_2.name
}

output "tag_interface_oam_slot_2_2_id" {
  description = "ID da tag interface_oam_slot_2-2"
  value       = module.tag_interface_oam_slot_2_2.id
}

output "tag_interface_oam_slot_2_2_name" {
  description = "Nome da tag interface_oam_slot_2-2"
  value       = module.tag_interface_oam_slot_2_2.name
}

output "tag_interface_oam_2_2_id" {
  description = "ID da tag interface_oam_2-2"
  value       = module.tag_interface_oam_2_2.id
}

output "tag_interface_oam_2_2_name" {
  description = "Nome da tag interface_oam_2-2"
  value       = module.tag_interface_oam_2_2.name
}

output "tag_interface_bmc_id" {
  description = "ID da tag interface_bmc"
  value       = module.tag_interface_bmc.id
}

output "tag_interface_bmc_name" {
  description = "Nome da tag interface_bmc"
  value       = module.tag_interface_bmc.name
}