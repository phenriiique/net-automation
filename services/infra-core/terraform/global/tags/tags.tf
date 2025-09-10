# Tags Globais
# Este arquivo cria todas as tags que podem ser reutilizadas por todos os sites

# ====== Tags de Ambiente ======

module "tag_production" {
  source = "../../modules/netbox_tag"
  
  name        = "production"
  description = "Production environment"
  color_hex   = "ff0000"
}

module "tag_development" {
  source = "../../modules/netbox_tag"
  
  name        = "development"
  description = "Development environment"
  color_hex   = "0000ff"
}

# ====== Tags de Tipo de Serviço ======

module "tag_web" {
  source = "../../modules/netbox_tag"
  
  name        = "web"
  description = "Web services"
  color_hex   = "00ff00"
}

module "tag_database" {
  source = "../../modules/netbox_tag"
  
  name        = "database"
  description = "Database services"
  color_hex   = "800080"
}

module "tag_api" {
  source = "../../modules/netbox_tag"
  
  name        = "api"
  description = "API services"
  color_hex   = "0080ff"
}

# ====== Tags de Infraestrutura ======

module "tag_management" {
  source = "../../modules/netbox_tag"
  
  name        = "management"
  description = "Management interfaces"
  color_hex   = "808080"
}

module "tag_storage" {
  source = "../../modules/netbox_tag"
  
  name        = "storage"
  description = "Storage systems"
  color_hex   = "804000"
}

module "tag_monitoring" {
  source = "../../modules/netbox_tag"
  
  name        = "monitoring"
  description = "Monitoring systems"
  color_hex   = "ff8000"
}

module "tag_infrastructure" {
  source = "../../modules/netbox_tag"
  
  name        = "infrastructure"
  description = "Infrastructure components"
  color_hex   = "00ff00"
}

module "tag_iac_network" {
  source = "../../modules/netbox_tag"
  
  name        = "iac_network"
  description = "Infrastructure as Code - Network resources"
  color_hex   = "0000ff"
}
