output "id" {
  description = "ID do rack criado"
  value       = netbox_rack.this.id
}

output "name" {
  description = "Nome do rack"
  value       = netbox_rack.this.name
}

output "site_id" {
  description = "ID do site onde o rack está localizado"
  value       = netbox_rack.this.site_id
}

output "status" {
  description = "Status do rack"
  value       = netbox_rack.this.status
}

output "width" {
  description = "Largura do rack em polegadas"
  value       = netbox_rack.this.width
}

output "u_height" {
  description = "Altura do rack em unidades U"
  value       = netbox_rack.this.u_height
}

output "tenant_id" {
  description = "ID do tenant proprietário do rack"
  value       = netbox_rack.this.tenant_id
}

output "tags" {
  description = "Lista de tags do rack"
  value       = netbox_rack.this.tags
}
