resource "netbox_device_interface" "this" {
  name         = var.name
  device_id    = var.device_id
  type         = var.type
  enabled      = var.enabled
  description  = var.description
  mode         = var.mode
  untagged_vlan = var.untagged_vlan
  tagged_vlans = var.tagged_vlans
  tags         = var.tags
}
