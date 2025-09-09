resource "netbox_rack" "this" {
  name      = var.name
  site_id   = var.site_id
  status    = var.status
  width     = var.width
  u_height  = var.u_height
  tenant_id = var.tenant_id
  tags      = var.tags
}
