# Tags Globais via Data Sources
# Este arquivo referencia as tags globais existentes no Netbox

# ====== TAGS DE AMBIENTE ======

data "netbox_tag" "tag_production" {
  name = "production"
}

data "netbox_tag" "tag_development" {
  name = "development"
}

# ====== TAGS DE TIPO DE SERVIÇO ======

data "netbox_tag" "tag_web" {
  name = "web"
}

data "netbox_tag" "tag_database" {
  name = "database"
}

data "netbox_tag" "tag_api" {
  name = "api"
}

# ====== TAGS DE INFRAESTRUTURA ======

data "netbox_tag" "tag_management" {
  name = "management"
}

data "netbox_tag" "tag_storage" {
  name = "storage"
}

data "netbox_tag" "tag_monitoring" {
  name = "monitoring"
}

data "netbox_tag" "tag_infrastructure" {
  name = "infrastructure"
}

data "netbox_tag" "tag_iac_network" {
  name = "iac_network"
}
