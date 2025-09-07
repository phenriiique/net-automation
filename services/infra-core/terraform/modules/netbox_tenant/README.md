# Módulo Netbox Tenant

Este módulo Terraform cria e gerencia tenants no Netbox.

## Recursos

- Criação de tenants no Netbox
- Geração automática de slug (tratamento de acentos)
- Suporte a grupos de tenants
- Suporte a tags
- Suporte a campos customizados

## Uso

```hcl
module "tenant_exemplo" {
  source = "../../modules/netbox-tenant"
  
  name        = "Empresa Exemplo"
  description = "Tenant para a Empresa Exemplo"
  group_id    = 1
  tags        = ["produção", "brasil"]
  
  custom_fields = {
    "contato" = "contato@exemplo.com"
    "telefone" = "+55 11 99999-9999"
  }
}
```

## Variáveis

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| name | Nome do tenant | string | - | sim |
| slug | Slug do tenant | string | null | não |
| description | Descrição do tenant | string | "" | não |
| group_id | ID do grupo do tenant | number | null | não |
| tags | Tags para o tenant | list(string) | [] | não |
| custom_fields | Campos customizados | map(string) | {} | não |

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID do tenant criado no Netbox |
| name | Nome do tenant |
| slug | Slug do tenant |
| description | Descrição do tenant |
| group_id | ID do grupo do tenant |
| tags | Tags do tenant |

## Exemplos

### Tenant Básico

```hcl
module "tenant_basico" {
  source = "../../modules/netbox-tenant"
  
  name = "Tenant Básico"
}
```

### Tenant Completo

```hcl
module "tenant_completo" {
  source = "../../modules/netbox-tenant"
  
  name        = "Empresa ABC"
  description = "Tenant para a Empresa ABC"
  group_id    = 1
  tags        = ["produção", "brasil", "sp"]
  
  custom_fields = {
    "contato" = "contato@abc.com"
    "telefone" = "+55 11 99999-9999"
    "endereco" = "São Paulo, SP"
  }
}
```
