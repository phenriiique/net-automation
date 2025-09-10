resource "netbox_interface_template" "this" {
  device_type_id = var.device_type_id
  name           = var.name
  type           = var.type
  mgmt_only      = var.mgmt_only
  description    = var.description
  label          = var.label
}
