resource "netbox_device_type" "this" {
  model           = var.model
  manufacturer_id = var.manufacturer_id
  part_number     = var.part_number
  u_height        = var.u_height
  is_full_depth   = var.is_full_depth
}
