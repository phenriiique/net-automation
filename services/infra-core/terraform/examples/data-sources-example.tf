# ====== EXEMPLO DE DATA SOURCES COM NETBOX ======
# Este arquivo demonstra como usar data sources para consultar recursos existentes no Netbox

# ====== 1. CONSULTAR SITE EXISTENTE ======
# Busca um site existente no Netbox produtivo
data "netbox_site" "existing_site" {
  name = "Site São Paulo"  # Nome exato do site existente
}

# ====== 2. CONSULTAR TENANT EXISTENTE ======
# Busca um tenant existente no Netbox produtivo
data "netbox_tenant" "existing_tenant" {
  name = "br-ne-1"  # Nome exato do tenant existente
}

# ====== 3. CONSULTAR VLAN EXISTENTE ======
# Busca uma VLAN existente no Netbox produtivo
data "netbox_vlan" "existing_vlan" {
  vid = 100  # VID da VLAN existente
}

# ====== 4. CONSULTAR PREFIXO EXISTENTE ======
# Busca um prefixo existente no Netbox produtivo
data "netbox_prefix" "existing_prefix" {
  prefix = "10.0.0.0/16"  # Prefixo exato existente
}

# ====== 5. CONSULTAR TAG EXISTENTE ======
# Busca uma tag existente no Netbox produtivo
data "netbox_tag" "existing_tag" {
  name = "production"  # Nome exato da tag existente
}

# ====== 6. CONSULTAR VLAN GROUP EXISTENTE ======
# Busca um VLAN group existente no Netbox produtivo
data "netbox_vlan_group" "existing_vlan_group" {
  name = "VLANs 100 - Infraestrutura"  # Nome exato do VLAN group existente
}

# ====== 7. CONSULTAR RACK EXISTENTE ======
# Busca um rack existente no Netbox produtivo
data "netbox_rack" "existing_rack" {
  name = "RACK01"  # Nome exato do rack existente
}

# ====== EXEMPLOS DE USO DOS DATA SOURCES ======

# Criar um novo prefixo usando dados do site existente
resource "netbox_prefix" "new_prefix" {
  prefix      = "10.1.0.0/24"
  status      = "active"
  description = "Novo prefixo criado via Terraform"
  site_id     = data.netbox_site.existing_site.id  # ← Usando data source
  tenant_id   = data.netbox_tenant.existing_tenant.id  # ← Usando data source
  tags        = [data.netbox_tag.existing_tag.name]  # ← Usando data source
}

# Criar uma nova VLAN usando dados existentes
resource "netbox_vlan" "new_vlan" {
  name        = "VLAN 300 - Teste"
  vid         = 300
  status      = "active"
  description = "Nova VLAN criada via Terraform"
  site_id     = data.netbox_site.existing_site.id  # ← Usando data source
  tenant_id   = data.netbox_tenant.existing_tenant.id  # ← Usando data source
  group_id    = data.netbox_vlan_group.existing_vlan_group.id  # ← Usando data source
  tags        = [data.netbox_tag.existing_tag.name]  # ← Usando data source
}

# Criar um novo rack usando dados existentes
resource "netbox_rack" "new_rack" {
  name      = "RACK06"
  site_id   = data.netbox_site.existing_site.id  # ← Usando data source
  status    = "active"
  width     = 19
  u_height  = 47
  tenant_id = data.netbox_tenant.existing_tenant.id  # ← Usando data source
  tags      = [data.netbox_tag.existing_tag.name]  # ← Usando data source
}

# ====== OUTPUTS DOS DATA SOURCES ======
# Expor informações dos recursos existentes consultados

output "existing_site_info" {
  description = "Informações do site existente consultado"
  value = {
    id          = data.netbox_site.existing_site.id
    name        = data.netbox_site.existing_site.name
    slug        = data.netbox_site.existing_site.slug
    status      = data.netbox_site.existing_site.status
    description = data.netbox_site.existing_site.description
  }
}

output "existing_tenant_info" {
  description = "Informações do tenant existente consultado"
  value = {
    id   = data.netbox_tenant.existing_tenant.id
    name = data.netbox_tenant.existing_tenant.name
    slug = data.netbox_tenant.existing_tenant.slug
  }
}

output "existing_vlan_info" {
  description = "Informações da VLAN existente consultada"
  value = {
    id   = data.netbox_vlan.existing_vlan.id
    name = data.netbox_vlan.existing_vlan.name
    vid  = data.netbox_vlan.existing_vlan.vid
  }
}

output "existing_prefix_info" {
  description = "Informações do prefixo existente consultado"
  value = {
    id     = data.netbox_prefix.existing_prefix.id
    prefix = data.netbox_prefix.existing_prefix.prefix
  }
}

output "existing_tag_info" {
  description = "Informações da tag existente consultada"
  value = {
    id   = data.netbox_tag.existing_tag.id
    name = data.netbox_tag.existing_tag.name
    slug = data.netbox_tag.existing_tag.slug
  }
}

output "existing_vlan_group_info" {
  description = "Informações do VLAN group existente consultado"
  value = {
    id   = data.netbox_vlan_group.existing_vlan_group.id
    name = data.netbox_vlan_group.existing_vlan_group.name
    slug = data.netbox_vlan_group.existing_vlan_group.slug
  }
}

output "existing_rack_info" {
  description = "Informações do rack existente consultado"
  value = {
    id       = data.netbox_rack.existing_rack.id
    name     = data.netbox_rack.existing_rack.name
    site_id  = data.netbox_rack.existing_rack.site_id
    status   = data.netbox_rack.existing_rack.status
    width    = data.netbox_rack.existing_rack.width
    u_height = data.netbox_rack.existing_rack.u_height
  }
}
