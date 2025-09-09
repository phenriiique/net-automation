# Netbox Tag Module

Este módulo Terraform gerencia tags no Netbox, seguindo as melhores práticas de infraestrutura como código.

## Funcionalidades

- Criação e gerenciamento de tags no Netbox
- Configuração completa de informações da tag
- Suporte a cores personalizadas
- Geração automática de slug
- Validação de dados de entrada

## Uso

```hcl
module "tag_example" {
  source = "./modules/netbox_tag"
  
  name        = "database"
  slug        = "database"
  description = "Tag for database-related resources"
  color_hex   = "ff0000"
}
```

## Argumentos

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| name | Nome da tag | `string` | n/a | sim |
| slug | Slug da tag | `string` | `null` | não |
| description | Descrição da tag | `string` | `""` | não |
| color_hex | Cor da tag em formato hexadecimal | `string` | `"9e9e9e"` | não |

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID da tag no Netbox |
| name | Nome da tag |
| slug | Slug da tag |
| description | Descrição da tag |
| color_hex | Cor da tag |

## Validações

- **color_hex**: Deve ser um código hexadecimal válido de 6 dígitos (ex: ff0000)
- **slug**: Se não fornecido, será gerado automaticamente baseado no nome

## Exemplos

### Tag Básica

```hcl
module "basic_tag" {
  source = "./modules/netbox_tag"
  
  name = "production"
}
```

### Tag Completa

```hcl
module "complete_tag" {
  source = "./modules/netbox_tag"
  
  name        = "database"
  slug        = "database"
  description = "Tag for database-related resources"
  color_hex   = "ff0000"
}
```

### Tags com Cores Específicas

```hcl
# Tag para produção (vermelho)
module "tag_production" {
  source = "./modules/netbox_tag"
  
  name        = "production"
  description = "Production environment"
  color_hex   = "ff0000"
}

# Tag para desenvolvimento (azul)
module "tag_development" {
  source = "./modules/netbox_tag"
  
  name        = "development"
  description = "Development environment"
  color_hex   = "0000ff"
}

# Tag para infraestrutura (verde)
module "tag_infrastructure" {
  source = "./modules/netbox_tag"
  
  name        = "infrastructure"
  description = "Infrastructure components"
  color_hex   = "00ff00"
}

# Tag para monitoramento (laranja)
module "tag_monitoring" {
  source = "./modules/netbox_tag"
  
  name        = "monitoring"
  description = "Monitoring and observability"
  color_hex   = "ff8800"
}
```

### Tags Organizadas por Categoria

```hcl
# Tags de Ambiente
module "tag_prod" {
  source = "./modules/netbox_tag"
  
  name        = "production"
  description = "Production environment"
  color_hex   = "ff0000"
}

module "tag_dev" {
  source = "./modules/netbox_tag"
  
  name        = "development"
  description = "Development environment"
  color_hex   = "0000ff"
}

module "tag_staging" {
  source = "./modules/netbox_tag"
  
  name        = "staging"
  description = "Staging environment"
  color_hex   = "ff8800"
}

# Tags de Tipo de Serviço
module "tag_web" {
  source = "./modules/netbox_tag"
  
  name        = "web"
  description = "Web services"
  color_hex   = "00ff00"
}

module "tag_database" {
  source = "./modules/netbox_tag"
  
  name        = "database"
  description = "Database services"
  color       = "800080"
}

module "tag_api" {
  source = "./modules/netbox_tag"
  
  name        = "api"
  description = "API services"
  color       = "0080ff"
}

# Tags de Infraestrutura
module "tag_management" {
  source = "./modules/netbox_tag"
  
  name        = "management"
  description = "Management interfaces"
  color       = "808080"
}

module "tag_storage" {
  source = "./modules/netbox_tag"
  
  name        = "storage"
  description = "Storage systems"
  color       = "804000"
}

module "tag_monitoring" {
  source = "./modules/netbox_tag"
  
  name        = "monitoring"
  description = "Monitoring systems"
  color       = "ff8000"
}
```

## Cores Sugeridas

| Categoria | Cor | Código |
|-----------|-----|--------|
| Produção | Vermelho | `ff0000` |
| Desenvolvimento | Azul | `0000ff` |
| Staging | Laranja | `ff8800` |
| Infraestrutura | Verde | `00ff00` |
| Banco de Dados | Roxo | `800080` |
| API | Azul Claro | `0080ff` |
| Web | Verde Claro | `00ff80` |
| Monitoramento | Laranja | `ff8000` |
| Gerenciamento | Cinza | `808080` |
| Storage | Marrom | `804000` |
