

# VLAN Group 100 - VLANs de infraestrutura
module "vlan_group_100" {
  source = "../../../modules/netbox_vlan_group"
  
  name        = "VLANs 100 - Infraestrutura"
  slug        = "vlans-100-infra"
  description = "VLANs de infraestrutura para o ${local.site_name}"
  vid_ranges  = [[100, 199]]
}

# VLAN Group 200 - VLANs de produção
module "vlan_group_200" {
  source = "../../../modules/netbox_vlan_group"
  
  name        = "VLANs 200 - Produção"
  slug        = "vlans-200-prod"
  description = "VLANs de produção para o ${local.site_name}"
  vid_ranges  = [[200, 299]]
}

# VLAN Group 500 - VLANs de desenvolvimento
module "vlan_group_500" {
  source = "../../../modules/netbox_vlan_group"
  
  name        = "VLANs 500 - Desenvolvimento"
  slug        = "vlans-500-dev"
  description = "VLANs de desenvolvimento para o ${local.site_name}"
  vid_ranges  = [[500, 599]]
}
