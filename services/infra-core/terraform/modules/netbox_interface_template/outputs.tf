output "id" {
  description = "ID do template de interface"
  value       = netbox_interface_template.this.id
}

output "name" {
  description = "Nome do template de interface"
  value       = netbox_interface_template.this.name
}

output "type" {
  description = "Tipo do template de interface"
  value       = netbox_interface_template.this.type
}

output "mgmt_only" {
  description = "Se o template de interface é apenas para gerenciamento"
  value       = netbox_interface_template.this.mgmt_only
}

output "description" {
  description = "Descrição do template de interface"
  value       = netbox_interface_template.this.description
}

output "label" {
  description = "Label do template de interface"
  value       = netbox_interface_template.this.label
}
