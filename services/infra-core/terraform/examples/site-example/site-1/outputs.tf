# Outputs do exemplo de sites
# substituir br-ne-1 por novo nome


output "site_br-ne-1_id" {
  description = "ID do site Nordeste"
  value       = module.site_br-ne-1.id
}

output "site_br-ne-1_name" {
  description = "ID do site Nordeste"
  value       = module.site_br-ne-1.name
}

output "tenant_br-ne-1_id" {
  description = "ID do tenant Nordeste"
  value       = module.tenant_br-ne-1.id
}

output "tenant_br-ne-1_name" {
  description = "Nome do tenant Nordeste"
  value       = module.tenant_br-ne-1.name
}