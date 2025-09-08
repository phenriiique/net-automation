# Netbox VLAN Group Module

Este módulo Terraform gerencia VLAN groups no Netbox, seguindo as melhores práticas de infraestrutura como código.

## Funcionalidades

- Criação e gerenciamento de VLAN groups no Netbox
- Configuração completa de informações do VLAN group
- Suporte a tags e ranges de VLAN IDs
- Geração automática de slug
- Validação de dados de entrada

## Uso

```hcl
module "vlan_group_example" {
  source = "./modules/netbox_vlan_group"
  
  name        = "Second Example"
  slug        = "example2"
  scope_type  = "dcim.site"
  description = "Second Example VLAN Group"
  tags        = [netbox_tag.example.id]
  vid_ranges  = [[1, 2], [3, 4]]
}
```

## Argumentos

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| name | Nome do VLAN group | `string` | n/a | sim |
| slug | Slug do VLAN group | `string` | `null` | não |
| scope_type | Tipo de escopo do VLAN group | `string` | `"dcim.site"` | não |
| description | Descrição do VLAN group | `string` | `""` | não |
| tags | Lista de IDs das tags do Netbox | `list(number)` | `[]` | não |
| vid_ranges | Lista de ranges de VLAN IDs | `list(list(number))` | `[]` | não |

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID do VLAN group no Netbox |
| name | Nome do VLAN group |
| slug | Slug do VLAN group |
| scope_type | Tipo de escopo do VLAN group |
| description | Descrição do VLAN group |
| tags | Tags do VLAN group |
| vid_ranges | Ranges de VLAN IDs |

## Validações

- **slug**: Se não fornecido, será gerado automaticamente baseado no nome
- **scope_type**: Padrão configurado para `dcim.site`
- **vid_ranges**: Formato esperado é `[[min1, max1], [min2, max2]]`

## Exemplos

### VLAN Group Básico

```hcl
module "basic_vlan_group" {
  source = "./modules/netbox_vlan_group"
  
  name = "Production VLANs"
}
```

### VLAN Group Completo

```hcl
module "complete_vlan_group" {
  source = "./modules/netbox_vlan_group"
  
  name        = "Data Center VLANs"
  slug        = "dc-vlans"
  scope_type  = "dcim.site"
  description = "VLANs para o data center principal"
  tags        = [netbox_tag.production.id, netbox_tag.datacenter.id]
  vid_ranges  = [[100, 200], [300, 400]]
}
```

### VLAN Group com Múltiplos Ranges

```hcl
module "multi_range_vlan_group" {
  source = "./modules/netbox_vlan_group"
  
  name        = "Multi Range VLANs"
  description = "VLANs com múltiplos ranges"
  vid_ranges  = [[1, 10], [20, 30], [100, 150]]
}
```

### VLAN Group para Região

```hcl
module "region_vlan_group" {
  source = "./modules/netbox_vlan_group"
  
  name        = "São Paulo Region VLANs"
  scope_type  = "dcim.region"
  description = "VLANs para a região de São Paulo"
  vid_ranges  = [[1000, 1999]]
}
```
