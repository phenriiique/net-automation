# Outputs do exemplo de sites organizados por categoria

# ====== SITE ======
output "site" {
  description = "Informações do Site"
  value = {
    site_br_ne_1_id   = module.site_br-ne-1.id
    site_br_ne_1_name = module.site_br-ne-1.name
  }
}

# ====== TENANT ======
output "tenant" {
  description = "Informações do Tenant"
  value = {
    tenant_br_ne_1_id   = module.tenant_br-ne-1.id
    tenant_br_ne_1_name = module.tenant_br-ne-1.name
  }
}

# ====== VLAN GROUP ======
output "vlan_groups" {
  description = "Informações dos VLAN Groups"
  value = {
    vlan_group_100_id   = module.vlan_group_100.id
    vlan_group_100_name = module.vlan_group_100.name
    vlan_group_100_slug = module.vlan_group_100.slug
    vlan_group_200_id   = module.vlan_group_200.id
    vlan_group_200_name = module.vlan_group_200.name
    vlan_group_200_slug = module.vlan_group_200.slug
    vlan_group_500_id   = module.vlan_group_500.id
    vlan_group_500_name = module.vlan_group_500.name
    vlan_group_500_slug = module.vlan_group_500.slug
  }
}