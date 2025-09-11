

# VLAN Group 100 - Management Fabric
module "vlan_group_100" {
  source = "../../../modules/netbox_vlan_group"
  
  name        = "VLANs 100 - Management Fabric"
  slug        = "vlans-100-mgmt"
  description = "VLANs Management Fabric para o ${local.site_name}"
  vid_ranges  = [[100, 199]]
  # tags        = [data.netbox_tag.tag_iac_network.id]  # Comentado temporariamente
}

# VLAN Group 200 - Data Networks
module "vlan_group_200" {
  source = "../../../modules/netbox_vlan_group"
  
  name        = "VLANs 200 - Data Networks"
  slug        = "vlans-200-data"
  description = "VLANs Data Networks para o ${local.site_name}"
  vid_ranges  = [[200, 299]]
  # tags        = [data.netbox_tag.tag_iac_network.id]  # Comentado temporariamente
}
