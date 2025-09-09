# Netbox Prefix Module

Este módulo Terraform gerencia prefixes no Netbox, seguindo as melhores práticas de infraestrutura como código.

## Funcionalidades

- Criação e gerenciamento de prefixes no Netbox
- Configuração completa de informações do prefixo
- Suporte a associação com sites, tenants e VLANs
- Configuração de pools de endereços
- Suporte a tags e roles
- Validação de dados de entrada

## Uso

```hcl
module "prefix_example" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.0.0/24"
  status      = "active"
  description = "test prefix"
  site_id     = netbox_site.example.id
  tenant_id   = netbox_tenant.example.id
  vlan_id     = netbox_vlan.example.id
  is_pool     = false
  tags        = ["production", "web"]
}
```

## Argumentos

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| prefix | Prefixo CIDR (ex: 10.0.0.0/24) | `string` | n/a | sim |
| status | Status do prefixo | `string` | `"active"` | não |
| description | Descrição do prefixo | `string` | `""` | não |
| site_id | ID do site associado | `number` | `null` | não |
| tenant_id | ID do tenant associado | `number` | `null` | não |
| vlan_id | ID da VLAN associada | `number` | `null` | não |
| is_pool | Se é um pool de endereços | `bool` | `false` | não |
| role_id | ID do papel (role) | `number` | `null` | não |
| tags | Lista de nomes das tags | `list(string)` | `[]` | não |

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID do prefixo no Netbox |
| prefix | Prefixo CIDR |
| status | Status do prefixo |
| description | Descrição do prefixo |
| site_id | ID do site |
| tenant_id | ID do tenant |
| vlan_id | ID da VLAN |
| is_pool | Se é um pool de endereços |
| role_id | ID do papel (role) |
| tags | Tags do prefixo |

## Validações

- **status**: Deve ser um dos valores: `active`, `reserved`, `deprecated`, `container`
- **prefix**: Deve ser um prefixo CIDR válido
- **is_pool**: Boolean para indicar se é um pool de endereços

## Exemplos

### Prefixo Básico

```hcl
module "basic_prefix" {
  source = "./modules/netbox_prefix"
  
  prefix = "192.168.1.0/24"
}
```

### Prefixo Completo

```hcl
module "complete_prefix" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.1.0/24"
  status      = "active"
  description = "Rede de produção web"
  site_id     = module.site_prod.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_web.id
  is_pool     = false
  tags        = ["production", "web", "dmz"]
}
```

### Prefixo Container

```hcl
module "container_prefix" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.0.0/16"
  status      = "container"
  description = "Container para redes de produção"
  site_id     = module.site_prod.id
  tenant_id   = module.tenant_main.id
  is_pool     = false
  tags        = ["container", "production"]
}
```

### Prefixo Pool

```hcl
module "pool_prefix" {
  source = "./modules/netbox_prefix"
  
  prefix      = "172.16.0.0/12"
  status      = "active"
  description = "Pool de endereços para desenvolvimento"
  site_id     = module.site_dev.id
  tenant_id   = module.tenant_dev.id
  is_pool     = true
  tags        = ["pool", "development"]
}
```

### Prefixo Reservado

```hcl
module "reserved_prefix" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.255.0.0/24"
  status      = "reserved"
  description = "Prefixo reservado para uso futuro"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  tags        = ["reserved", "future"]
}
```

### Múltiplos Prefixos por VLAN

```hcl
# Prefixo para VLAN de gerenciamento
module "prefix_mgmt" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.100.0/24"
  description = "Rede de gerenciamento"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_100.id
  tags        = ["management", "infrastructure"]
}

# Prefixo para VLAN de produção web
module "prefix_web_prod" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.250.0/24"
  description = "Rede de produção web"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_250.id
  tags        = ["web", "production"]
}

# Prefixo para VLAN de banco de dados
module "prefix_db_prod" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.251.0/24"
  description = "Rede de banco de dados de produção"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_251.id
  tags        = ["database", "production"]
}

# Prefixo para VLAN de desenvolvimento
module "prefix_dev" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.550.0/24"
  description = "Rede de desenvolvimento"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_550.id
  tags        = ["development", "web"]
}
```

### Hierarquia de Prefixos

```hcl
# Container principal
module "prefix_container" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.0.0/16"
  status      = "container"
  description = "Container principal do site"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  tags        = ["container", "main"]
}

# Sub-redes dentro do container
module "prefix_infra" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.100.0/24"
  description = "Rede de infraestrutura"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_100.id
  tags        = ["infrastructure"]
}

module "prefix_prod" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.200.0/24"
  description = "Rede de produção"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_250.id
  tags        = ["production"]
}

module "prefix_dev" {
  source = "./modules/netbox_prefix"
  
  prefix      = "10.0.500.0/24"
  description = "Rede de desenvolvimento"
  site_id     = module.site_main.id
  tenant_id   = module.tenant_main.id
  vlan_id     = module.vlan_550.id
  tags        = ["development"]
}
```
