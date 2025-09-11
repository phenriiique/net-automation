# Racks Globais
# Este arquivo cria racks dinamicamente baseado na variável rack_qtd

# Criar racks dinamicamente usando for_each
resource "netbox_rack" "racks" {
  for_each = {
    for i in range(1, var.rack_qtd + 1) : i => {
      name = "RACK${format("%02d", i)}"
    }
  }
  
  name      = each.value.name
  site_id   = local.site_id
  status    = var.status
  width     = 19
  u_height  = 47
  tenant_id = local.tenant_id
  tags      = [local.tag_iac_network]
}
