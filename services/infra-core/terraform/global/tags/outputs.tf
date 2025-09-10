# Outputs das Tags Globais
# Este arquivo expõe os IDs das tags para uso em outros diretórios

# ====== Tags de Ambiente ======
output "tag_production_id" {
  description = "ID da tag production"
  value       = module.tag_production.id
}

output "tag_production_name" {
  description = "Nome da tag production"
  value       = module.tag_production.name
}

output "tag_development_id" {
  description = "ID da tag development"
  value       = module.tag_development.id
}

output "tag_development_name" {
  description = "Nome da tag development"
  value       = module.tag_development.name
}

# ====== Tags de Tipo de Serviço ======
output "tag_web_id" {
  description = "ID da tag web"
  value       = module.tag_web.id
}

output "tag_web_name" {
  description = "Nome da tag web"
  value       = module.tag_web.name
}

output "tag_database_id" {
  description = "ID da tag database"
  value       = module.tag_database.id
}

output "tag_database_name" {
  description = "Nome da tag database"
  value       = module.tag_database.name
}

output "tag_api_id" {
  description = "ID da tag api"
  value       = module.tag_api.id
}

output "tag_api_name" {
  description = "Nome da tag api"
  value       = module.tag_api.name
}

# ====== Tags de Infraestrutura ======
output "tag_management_id" {
  description = "ID da tag management"
  value       = module.tag_management.id
}

output "tag_management_name" {
  description = "Nome da tag management"
  value       = module.tag_management.name
}

output "tag_storage_id" {
  description = "ID da tag storage"
  value       = module.tag_storage.id
}

output "tag_storage_name" {
  description = "Nome da tag storage"
  value       = module.tag_storage.name
}

output "tag_monitoring_id" {
  description = "ID da tag monitoring"
  value       = module.tag_monitoring.id
}

output "tag_monitoring_name" {
  description = "Nome da tag monitoring"
  value       = module.tag_monitoring.name
}

output "tag_infrastructure_id" {
  description = "ID da tag infrastructure"
  value       = module.tag_infrastructure.id
}

output "tag_infrastructure_name" {
  description = "Nome da tag infrastructure"
  value       = module.tag_infrastructure.name
}

output "tag_iac_network_id" {
  description = "ID da tag iac_network"
  value       = module.tag_iac_network.id
}

output "tag_iac_network_name" {
  description = "Nome da tag iac_network"
  value       = module.tag_iac_network.name
}
