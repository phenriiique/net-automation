output "id" {
  description = "ID do fabricante criado"
  value       = netbox_manufacturer.this.id
}

output "name" {
  description = "Nome do fabricante"
  value       = netbox_manufacturer.this.name
}

output "slug" {
  description = "Slug do fabricante"
  value       = netbox_manufacturer.this.slug
}
