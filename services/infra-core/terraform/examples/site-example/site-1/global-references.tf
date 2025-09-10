# Referências aos Recursos Globais
# Este arquivo referencia os outputs do diretório global/device_types

# Usando terraform_remote_state para referenciar o estado do diretório global
data "terraform_remote_state" "global_device_types" {
  backend = "local"
  config = {
    path = "../../../global/device_types/terraform.tfstate"
  }
}

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
}
