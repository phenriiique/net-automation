# Outputs dos Device Types Globais
# Este arquivo expõe os IDs dos device types para uso em outros diretórios

# ====== MANUFACTURERS ======
output "manufacturer_dell_id" {
  description = "ID do manufacturer Dell"
  value       = module.manufacturer_dell.id
}

output "manufacturer_dell_name" {
  description = "Nome do manufacturer Dell"
  value       = module.manufacturer_dell.name
}

# ====== DEVICE ROLES ======
output "role_switch_id" {
  description = "ID do device role Switch"
  value       = module.role_switch.id
}

output "role_switch_name" {
  description = "Nome do device role Switch"
  value       = module.role_switch.name
}

output "role_server_id" {
  description = "ID do device role Server"
  value       = module.role_server.id
}

output "role_server_name" {
  description = "Nome do device role Server"
  value       = module.role_server.name
}

# ====== DEVICE TYPES ======
output "device_type_dell_n3248te_id" {
  description = "ID do device type Dell N3248TE"
  value       = module.device_type_dell_n3248te.id
}

output "device_type_dell_n3248te_model" {
  description = "Modelo do device type Dell N3248TE"
  value       = module.device_type_dell_n3248te.model
}

output "device_type_dell_s5248f_id" {
  description = "ID do device type Dell S5248F"
  value       = module.device_type_dell_s5248f.id
}

output "device_type_dell_s5248f_model" {
  description = "Modelo do device type Dell S5248F"
  value       = module.device_type_dell_s5248f.model
}

output "device_type_dell_r750_balanced_id" {
  description = "ID do device type Dell R750 Balanced"
  value       = module.device_type_dell_r750_balanced.id
}

output "device_type_dell_r750_balanced_model" {
  description = "Modelo do device type Dell R750 Balanced"
  value       = module.device_type_dell_r750_balanced.model
}

output "device_type_dell_r750_gpu_id" {
  description = "ID do device type Dell R750 GPU"
  value       = module.device_type_dell_r750_gpu.id
}

output "device_type_dell_r750_gpu_model" {
  description = "Modelo do device type Dell R750 GPU"
  value       = module.device_type_dell_r750_gpu.model
}

output "device_type_dell_r750_performance_id" {
  description = "ID do device type Dell R750 Performance"
  value       = module.device_type_dell_r750_performance.id
}

output "device_type_dell_r750_performance_model" {
  description = "Modelo do device type Dell R750 Performance"
  value       = module.device_type_dell_r750_performance.model
}
