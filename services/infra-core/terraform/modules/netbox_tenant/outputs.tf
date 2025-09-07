output "id" {
  description = "ID do tenant criado no Netbox"
  value       = netbox_tenant.this.id
}

output "name" {
  description = "Nome do tenant"
  value       = netbox_tenant.this.name
}

output "slug" {
  description = "Slug do tenant"
  value       = netbox_tenant.this.slug
}

output "description" {
  description = "Descrição do tenant"
  value       = netbox_tenant.this.description
}

output "group_id" {
  description = "ID do grupo do tenant"
  value       = netbox_tenant.this.group_id
}

output "tags" {
  description = "Tags do tenant"
  value       = netbox_tenant.this.tags
}
