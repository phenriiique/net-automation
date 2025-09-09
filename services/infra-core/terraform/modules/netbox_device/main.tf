resource "netbox_device" "this" {
  name           = var.name
  device_type_id = var.device_type_id
  role_id        = var.role_id
  site_id        = var.site_id
  rack_id        = var.rack_id
  rack_position  = var.rack_position
  rack_face      = var.rack_face
  status         = var.status
  tenant_id      = var.tenant_id
  platform_id    = var.platform_id
  serial         = var.serial
  asset_tag      = var.asset_tag
  description    = var.description
  tags           = var.tags
}
