# Tags Globais via Data Sources
# Este arquivo referencia as tags globais existentes no Netbox

# ====== TAGS DE INFRAESTRUTURA ======

data "netbox_tag" "tag_iac_network" {
  name = "iac_network"
}

data "netbox_tag" "tag_switch_dados" {
  name = "switch_dados"
}

data "netbox_tag" "tag_switch_dados_a" {
  name = "switch_dados_a"
}

data "netbox_tag" "tag_switch_dados_b" {
  name = "switch_dados_b"
}

data "netbox_tag" "tag_switch_oam" {
  name = "switch_oam"
}

data "netbox_tag" "tag_switch_oam_a" {
  name = "switch_oam_a"
}

data "netbox_tag" "tag_switch_oam_b" {
  name = "switch_oam_b"
}

