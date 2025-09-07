# Netbox Site Module

Este módulo Terraform gerencia sites no Netbox, seguindo as melhores práticas de infraestrutura como código.

## Funcionalidades

- Criação e gerenciamento de sites no Netbox
- Configuração completa de informações do site
- Suporte a campos customizados
- Geração automática de slug
- Validação de dados de entrada

## Uso

```hcl
module "site_example" {
  source = "./modules/netbox-site"
  
  name        = "Site São Paulo"
  description = "Data center principal em São Paulo"
  status      = "active"
  facility    = "SP-DC-01"
  asn         = 65001
  
  physical_address = "Av. Paulista, 1000 - São Paulo, SP"
  contact_name     = "João Silva"
  contact_email    = "joao.silva@empresa.com"
  contact_phone    = "+55 11 99999-9999"
  
  tags = ["production", "datacenter", "sp"]
  
  custom_fields = {
    "capacity" = "1000"
    "tier"     = "3"
  }
}
```

## Argumentos

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| name | Nome do site | `string` | n/a | sim |
| slug | Slug do site | `string` | `null` | não |
| description | Descrição do site | `string` | `""` | não |
| status | Status do site | `string` | `"active"` | não |
| region_id | ID da região | `number` | `null` | não |
| tenant_id | ID do tenant | `number` | `null` | não |
| facility | Facilidade do site | `string` | `""` | não |
| asn | ASN do site | `number` | `null` | não |
| time_zone | Fuso horário | `string` | `"America/Sao_Paulo"` | não |
| physical_address | Endereço físico | `string` | `""` | não |
| shipping_address | Endereço de entrega | `string` | `""` | não |
| latitude | Latitude | `number` | `null` | não |
| longitude | Longitude | `number` | `null` | não |
| contact_name | Nome do contato | `string` | `""` | não |
| contact_phone | Telefone do contato | `string` | `""` | não |
| contact_email | Email do contato | `string` | `""` | não |
| comments | Comentários | `string` | `""` | não |
| tags | Tags do site | `list(string)` | `[]` | não |
| custom_fields | Campos customizados | `map(string)` | `{}` | não |

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID do site no Netbox |
| name | Nome do site |
| slug | Slug do site |
| status | Status do site |
| url | URL do site no Netbox |
| created | Data de criação |
| last_updated | Data da última atualização |

## Validações

- **status**: Deve ser um dos valores: `active`, `planned`, `retired`
- **slug**: Se não fornecido, será gerado automaticamente baseado no nome
- **time_zone**: Padrão configurado para `America/Sao_Paulo`

## Exemplos

### Site Básico

```hcl
module "basic_site" {
  source = "./modules/netbox-site"
  
  name = "Site Rio de Janeiro"
}
```

### Site Completo

```hcl
module "complete_site" {
  source = "./modules/netbox-site"
  
  name        = "Data Center São Paulo"
  description = "Data center principal da empresa"
  status      = "active"
  facility    = "SP-DC-01"
  asn         = 65001
  
  physical_address = "Av. Paulista, 1000 - São Paulo, SP"
  latitude         = -23.5505
  longitude        = -46.6333
  
  contact_name  = "João Silva"
  contact_email = "joao.silva@empresa.com"
  contact_phone = "+55 11 99999-9999"
  
  tags = ["production", "datacenter", "sp", "tier3"]
  
  custom_fields = {
    "capacity"    = "1000"
    "tier"        = "3"
    "power_usage" = "500kW"
  }
}
```

### Site com Status Planned

```hcl
module "planned_site" {
  source = "./modules/netbox-site"
  
  name        = "Site Brasília"
  description = "Novo data center em Brasília"
  status      = "planned"
  facility    = "BSB-DC-01"
  
  tags = ["planned", "datacenter", "brasilia"]
}
```
