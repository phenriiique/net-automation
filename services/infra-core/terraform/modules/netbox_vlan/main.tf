resource "netbox_vlan" "this" {
  name        = var.name
  vid         = var.vid
  status      = var.status
  description = var.description
  tenant_id   = var.tenant_id
  site_id     = var.site_id
  group_id    = var.group_id
  tags        = var.tags
}
