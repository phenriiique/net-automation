# Referências aos Recursos Globais
# Este arquivo referencia os outputs dos diretórios globais

# Usando terraform_remote_state para referenciar o estado do diretório global/device_types
data "terraform_remote_state" "global_device_types" {
  backend = "local"
  config = {
    path = "../../../global/device_types/terraform.tfstate"
  }
}

# Usando terraform_remote_state para referenciar o estado do diretório global/racks
# Comentado temporariamente - usando módulo diretamente
# data "terraform_remote_state" "global_racks" {
#   backend = "local"
#   config = {
#     path = "../../../global/racks/terraform.tfstate"
#   }
# }

# Locals para facilitar o uso dos IDs globais
locals {
  # IDs dos manufacturers globais
  manufacturer_dell_id = data.terraform_remote_state.global_device_types.outputs.manufacturer_dell_id
  
  # IDs dos device roles globais
  role_switch_id = data.terraform_remote_state.global_device_types.outputs.role_switch_id
  role_server_id = data.terraform_remote_state.global_device_types.outputs.role_server_id
  
  # IDs dos device types globais
  device_type_dell_750_id = data.terraform_remote_state.global_device_types.outputs.device_type_dell_750_id
  device_type_dell_n3248te_id = data.terraform_remote_state.global_device_types.outputs.device_type_dell_n3248te_id
  device_type_dell_s5248f_id = data.terraform_remote_state.global_device_types.outputs.device_type_dell_s5248f_id
  device_type_dell_r750_balanced_id = data.terraform_remote_state.global_device_types.outputs.device_type_dell_r750_balanced_id
  device_type_dell_r750_gpu_id = data.terraform_remote_state.global_device_types.outputs.device_type_dell_r750_gpu_id
  device_type_dell_r750_performance_id = data.terraform_remote_state.global_device_types.outputs.device_type_dell_r750_performance_id
  
  # Referências aos racks globais (comentado temporariamente - usando módulo diretamente)
  # global_racks = data.terraform_remote_state.global_racks.outputs.racks
  # global_rack03_id = data.terraform_remote_state.global_racks.outputs.rack03_id
  
  # Referências ao RACK03 global (comentado temporariamente - usando módulo diretamente)
  # rack03_servers_balanced = data.terraform_remote_state.global_racks.outputs.servers_balanced
  # rack03_servers_performance = data.terraform_remote_state.global_racks.outputs.servers_performance
  # rack03_servers_gpu = data.terraform_remote_state.global_racks.outputs.servers_gpu
  # rack03_switches_n3248te = data.terraform_remote_state.global_racks.outputs.switches_n3248te
  # rack03_switches_s5248f = data.terraform_remote_state.global_racks.outputs.switches_s5248f
  # rack03_summary = data.terraform_remote_state.global_racks.outputs.rack03_summary
}
