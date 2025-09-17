resource "netbox_cable" "this" {
  # Terminações A (podem ser múltiplas)
  dynamic "a_termination" {
    for_each = var.a_terminations
    content {
      object_type = a_termination.value.object_type
      object_id   = a_termination.value.object_id
    }
  }

  # Terminações B (podem ser múltiplas)
  dynamic "b_termination" {
    for_each = var.b_terminations
    content {
      object_type = b_termination.value.object_type
      object_id   = b_termination.value.object_id
    }
  }

  status    = var.status
  label     = var.label
  tags      = var.tags
  tenant_id = var.tenant_id
}
