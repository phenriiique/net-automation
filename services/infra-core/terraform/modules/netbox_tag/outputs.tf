output "id" {
  description = "ID da tag no Netbox"
  value       = netbox_tag.this.id
}

output "name" {
  description = "Nome da tag"
  value       = netbox_tag.this.name
}

output "slug" {
  description = "Slug da tag"
  value       = netbox_tag.this.slug
}

output "description" {
  description = "Descrição da tag"
  value       = netbox_tag.this.description
}

output "color_hex" {
  description = "Cor da tag"
  value       = netbox_tag.this.color_hex
}
