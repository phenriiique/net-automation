output "id" {
  description = "ID do site no Netbox"
  value       = netbox_site.this.id
}

output "name" {
  description = "Nome do site"
  value       = netbox_site.this.name
}

output "slug" {
  description = "Slug do site"
  value       = netbox_site.this.slug
}

output "status" {
  description = "Status do site"
  value       = netbox_site.this.status
}

