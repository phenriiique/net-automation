resource "netbox_prefix" "this" {
  prefix      = var.prefix
  status      = var.status
  description = var.description
  site_id     = var.site_id
  tenant_id   = var.tenant_id
  vlan_id     = var.vlan_id
  is_pool     = var.is_pool
  role_id     = var.role_id
  tags        = var.tags
}
