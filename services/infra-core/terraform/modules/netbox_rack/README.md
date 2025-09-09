# Netbox Rack Module

Este módulo Terraform gerencia racks no Netbox, seguindo as melhores práticas de infraestrutura como código.

## Funcionalidades

- Criação e gerenciamento de racks no Netbox
- Configuração completa de informações do rack
- Suporte a diferentes larguras (19" e 23")
- Validação de dados de entrada
- Suporte a tags

## Uso

```hcl
module "rack_example" {
  source = "./modules/netbox_rack"
  
  name      = "RACK01"
  site_id   = module.site_example.id
  status    = "active"
  width     = 19
  u_height  = 42
  tenant_id = module.tenant_example.id
  tags      = ["production", "datacenter"]
}
```

## Argumentos

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| name | Nome do rack | `string` | n/a | sim |
| site_id | ID do site onde o rack será criado | `number` | n/a | sim |
| status | Status do rack | `string` | `"active"` | não |
| width | Largura do rack em polegadas | `number` | `19` | não |
| u_height | Altura do rack em unidades U | `number` | `42` | não |
| tenant_id | ID do tenant proprietário do rack | `number` | `null` | não |
| tags | Lista de tags para o rack | `list(string)` | `[]` | não |

## Validações

### Status
O status deve ser um dos seguintes valores:
- `active`: Rack ativo e em uso
- `planned`: Rack planejado para instalação
- `reserved`: Rack reservado
- `available`: Rack disponível
- `deprecated`: Rack descontinuado

### Largura
A largura deve ser:
- `19`: Rack padrão de 19 polegadas
- `23`: Rack de 23 polegadas

### Altura
A altura deve estar entre 1 e 100 unidades U.

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID do rack criado |
| name | Nome do rack |
| site_id | ID do site onde o rack está localizado |
| status | Status do rack |
| width | Largura do rack em polegadas |
| u_height | Altura do rack em unidades U |
| tenant_id | ID do tenant proprietário do rack |
| tags | Lista de tags do rack |

## Exemplos

### Rack Básico
```hcl
module "rack_basic" {
  source = "./modules/netbox_rack"
  
  name    = "RACK01"
  site_id = module.site_example.id
}
```

### Rack Completo
```hcl
module "rack_complete" {
  source = "./modules/netbox_rack"
  
  name      = "RACK01"
  site_id   = module.site_example.id
  status    = "active"
  width     = 19
  u_height  = 47
  tenant_id = module.tenant_example.id
  tags      = ["production", "datacenter", "sp"]
}
```

### Múltiplos Racks
```hcl
module "rack_01" {
  source = "./modules/netbox_rack"
  
  name    = "RACK01"
  site_id = module.site_example.id
}

module "rack_02" {
  source = "./modules/netbox_rack"
  
  name    = "RACK02"
  site_id = module.site_example.id
}

module "rack_03" {
  source = "./modules/netbox_rack"
  
  name    = "RACK03"
  site_id = module.site_example.id
}
```
