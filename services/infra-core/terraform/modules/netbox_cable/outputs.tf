output "id" {
  description = "ID do cabo no Netbox"
  value       = netbox_cable.this.id
}

output "status" {
  description = "Status do cabo"
  value       = netbox_cable.this.status
}

output "label" {
  description = "Rótulo do cabo"
  value       = netbox_cable.this.label
}

output "tags" {
  description = "Tags do cabo"
  value       = netbox_cable.this.tags
}

output "tenant_id" {
  description = "ID do tenant"
  value       = netbox_cable.this.tenant_id
}

output "a_terminations" {
  description = "Terminações A do cabo"
  value       = netbox_cable.this.a_termination
}

output "b_terminations" {
  description = "Terminações B do cabo"
  value       = netbox_cable.this.b_termination
}
