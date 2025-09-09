# Netbox VLAN Module

Este módulo Terraform gerencia VLANs no Netbox, seguindo as melhores práticas de infraestrutura como código.

## Funcionalidades

- Criação e gerenciamento de VLANs no Netbox
- Configuração completa de informações da VLAN
- Suporte a tags e associação com sites, tenants e VLAN groups
- Validação de dados de entrada
- Status configurável (active, reserved, deprecated)

## Uso

```hcl
module "vlan_example" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN 2"
  vid         = 1778
  status      = "reserved"
  description = "Reserved example VLAN"
  tenant_id   = netbox_tenant.ex.id
  site_id     = netbox_site.ex.id
  group_id    = netbox_vlan_group.ex.id
  tags        = [netbox_tag.ex.name]
}
```

## Argumentos

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| name | Nome da VLAN | `string` | n/a | sim |
| vid | VLAN ID (número da VLAN) | `number` | n/a | sim |
| status | Status da VLAN | `string` | `"active"` | não |
| description | Descrição da VLAN | `string` | `""` | não |
| tenant_id | ID do tenant no Netbox | `number` | `null` | não |
| site_id | ID do site no Netbox | `number` | `null` | não |
| group_id | ID do VLAN group no Netbox | `number` | `null` | não |
| tags | Lista de nomes das tags do Netbox | `list(string)` | `[]` | não |

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID da VLAN no Netbox |
| name | Nome da VLAN |
| vid | VLAN ID |
| status | Status da VLAN |
| description | Descrição da VLAN |
| tenant_id | ID do tenant |
| site_id | ID do site |
| group_id | ID do VLAN group |
| tags | Tags da VLAN |

## Validações

- **status**: Deve ser um dos valores: `active`, `reserved`, `deprecated`
- **vid**: Deve ser um número único dentro do escopo
- **name**: Nome único da VLAN

## Exemplos

### VLAN Básica

```hcl
module "basic_vlan" {
  source = "./modules/netbox_vlan"
  
  name = "VLAN 100"
  vid  = 100
}
```

### VLAN Completa

```hcl
module "complete_vlan" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN Produção Web"
  vid         = 200
  status      = "active"
  description = "VLAN para servidores web de produção"
  tenant_id   = module.tenant_prod.id
  site_id     = module.site_sp.id
  group_id    = module.vlan_group_prod.id
  tags        = ["production", "web", "dmz"]
}
```

### VLAN Reservada

```hcl
module "reserved_vlan" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN Reservada"
  vid         = 1778
  status      = "reserved"
  description = "VLAN reservada para uso futuro"
  tenant_id   = module.tenant_main.id
  site_id     = module.site_main.id
  tags        = ["reserved", "future"]
}
```

### VLAN Deprecada

```hcl
module "deprecated_vlan" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN Legacy"
  vid         = 50
  status      = "deprecated"
  description = "VLAN legada - será removida em breve"
  tenant_id   = module.tenant_legacy.id
  site_id     = module.site_legacy.id
  tags        = ["legacy", "deprecated"]
}
```

### Múltiplas VLANs

```hcl
# VLANs de infraestrutura
module "vlan_mgmt" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN Management"
  vid         = 100
  description = "VLAN de gerenciamento"
  group_id    = module.vlan_group_infra.id
  tags        = ["management", "infrastructure"]
}

module "vlan_storage" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN Storage"
  vid         = 101
  description = "VLAN de storage"
  group_id    = module.vlan_group_infra.id
  tags        = ["storage", "infrastructure"]
}

# VLANs de produção
module "vlan_web" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN Web"
  vid         = 200
  description = "VLAN para servidores web"
  group_id    = module.vlan_group_prod.id
  tags        = ["web", "production"]
}

module "vlan_db" {
  source = "./modules/netbox_vlan"
  
  name        = "VLAN Database"
  vid         = 201
  description = "VLAN para servidores de banco de dados"
  group_id    = module.vlan_group_prod.id
  tags        = ["database", "production"]
}
```
