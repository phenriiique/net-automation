# Tags Globais via Data Sources
# Este arquivo referencia as tags globais existentes no Netbox

# ====== TAGS DE INFRAESTRUTURA ======

data "netbox_tag" "tag_iac_network" {
  name = "iac_network"
}