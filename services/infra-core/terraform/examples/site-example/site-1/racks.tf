# Racks para o Site Nordeste
# Este arquivo cria racks dinamicamente baseado na variável rack_qtd

# Criar racks dinamicamente usando for_each
resource "netbox_rack" "racks" {
  for_each = {
    for i in range(1, local.rack_qtd + 1) : i => {
      name = "RACK${format("%02d", i)}"
    }
  }
  
  name      = each.value.name
  site_id   = module.site_br-ne-1.id
  status    = local.status_site_rack
  width     = 19
  u_height  = 47
  tenant_id = module.tenant_br-ne-1.id
  tags      = [data.netbox_tag.tag_iac_network.name]
}
