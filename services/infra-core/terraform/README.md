# Terraform - Network Automation Infrastructure

Este repositório contém a infraestrutura como código para automação de rede usando Terraform e Netbox.

## 🏗️ Estrutura do Projeto

```
terraform/
├── modules/                    # Módulos reutilizáveis
│   └── netbox-site/           # Módulo para gerenciar sites no Netbox
├── examples/                   # Exemplos de uso dos módulos
│   └── site-example/          # Exemplo de criação de sites
├── environments/               # Configurações por ambiente
│   ├── dev/                   # Ambiente de desenvolvimento
│   ├── staging/               # Ambiente de staging
│   └── prod/                  # Ambiente de produção
├── providers.tf               # Configuração dos providers
├── variables.tf               # Variáveis globais
├── outputs.tf                 # Outputs globais
└── README.md                  # Esta documentação
```

## 🚀 Início Rápido

### Pré-requisitos

- **Terraform** >= 1.0
- **Netbox** rodando e acessível
- **Token de API** do Netbox

### Configuração Inicial

1. **Configure as variáveis de ambiente:**
   ```bash
   export NETBOX_URL="http://localhost:8000"
   export NETBOX_TOKEN="seu-token-aqui"
   ```

2. **Navegue para o diretório do exemplo:**
   ```bash
   cd examples/site-example
   ```

3. **Inicialize o Terraform:**
   ```bash
   terraform init
   ```

4. **Execute o exemplo:**
   ```bash
   terraform plan
   terraform apply
   ```

## 📦 Módulos Disponíveis

### netbox-site

Módulo para gerenciar sites no Netbox.

**Funcionalidades:**
- Criação e gerenciamento de sites
- Configuração completa de informações
- Suporte a campos customizados
- Validação de dados

**Uso:**
```hcl
module "site_example" {
  source = "./modules/netbox-site"
  
  name        = "Site São Paulo"
  description = "Data center principal"
  status      = "active"
  facility    = "SP-DC-01"
  
  tags = ["production", "datacenter"]
}
```

## 🌍 Ambientes

### Desenvolvimento (dev)
- Configurações básicas
- Recursos de teste
- Validação de módulos

### Staging
- Configurações similares à produção
- Testes de integração
- Validação de processos

### Produção (prod)
- Configurações otimizadas
- Recursos críticos
- Monitoramento completo

## 🔧 Configuração

### Providers

O projeto usa os seguintes providers:

- **netbox**: `e-breuninger/netbox` ~> 3.0

### Variáveis Globais

| Nome | Descrição | Padrão |
|------|-----------|--------|
| `netbox_url` | URL do Netbox | `http://localhost:8000` |
| `netbox_token` | Token de API | - |
| `environment` | Ambiente (dev/staging/prod) | `dev` |
| `project_name` | Nome do projeto | `network-automation` |
| `tags` | Tags padrão | `{}` |

## 📋 Exemplos

### Criar Sites Básicos

```hcl
module "site_sp" {
  source = "./modules/netbox-site"
  
  name     = "Site São Paulo"
  status   = "active"
  facility = "SP-DC-01"
}
```

### Criar Site Completo

```hcl
module "site_rj" {
  source = "./modules/netbox-site"
  
  name        = "Data Center Rio de Janeiro"
  description = "Data center secundário"
  status      = "active"
  facility    = "RJ-DC-01"
  asn         = 65002
  
  physical_address = "Av. Atlântica, 2000 - Rio de Janeiro, RJ"
  latitude         = -22.9068
  longitude        = -43.1729
  
  contact_name  = "Maria Santos"
  contact_email = "maria.santos@empresa.com"
  
  tags = ["production", "datacenter", "rj"]
  
  custom_fields = {
    "capacity" = "500"
    "tier"     = "2"
  }
}
```

## 🔒 Segurança

### Boas Práticas

1. **Tokens de API:**
   - Use variáveis de ambiente
   - Rotacione regularmente
   - Limite permissões

2. **Estado do Terraform:**
   - Use backend remoto
   - Habilite versionamento
   - Configure bloqueios

3. **Secrets:**
   - Nunca commite tokens
   - Use ferramentas de gerenciamento
   - Criptografe dados sensíveis

### Configuração de Backend

```hcl
terraform {
  backend "s3" {
    bucket = "terraform-state-bucket"
    key    = "network-automation/terraform.tfstate"
    region = "us-east-1"
  }
}
```

## 🧪 Testes

### Validação de Sintaxe

```bash
# Validar arquivos Terraform
terraform validate

# Formatar código
terraform fmt -recursive

# Verificar segurança
tfsec .
```

### Testes de Módulos

```bash
# Testar módulo específico
cd modules/netbox-site
terraform init
terraform validate
```

## 📊 Monitoramento

### Logs

- **Terraform**: Logs de execução
- **Netbox**: Logs de API
- **Aplicação**: Logs de aplicação

### Métricas

- **Recursos criados**: Contagem de recursos
- **Tempo de execução**: Duração dos planos
- **Erros**: Taxa de falhas

## 🤝 Contribuição

### Processo

1. Fork do repositório
2. Crie uma branch para sua feature
3. Implemente as mudanças
4. Adicione testes
5. Documente as mudanças
6. Abra um Pull Request

### Padrões

- **Código**: Siga as convenções do Terraform
- **Documentação**: Mantenha READMEs atualizados
- **Commits**: Use mensagens descritivas
- **Testes**: Adicione testes para novas funcionalidades

## 📚 Recursos

- [Documentação do Terraform](https://www.terraform.io/docs/)
- [Provider Netbox](https://registry.terraform.io/providers/e-breuninger/netbox/latest/docs)
- [Netbox Documentation](https://docs.netbox.dev/)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)

## 🐛 Troubleshooting

### Problemas Comuns

1. **Erro de conexão com Netbox:**
   - Verifique se o Netbox está rodando
   - Confirme a URL e token
   - Teste conectividade

2. **Erro de permissão:**
   - Verifique permissões do token
   - Confirme acesso aos recursos
   - Teste com usuário admin

3. **Erro de validação:**
   - Verifique sintaxe dos arquivos
   - Confirme tipos de dados
   - Valide referências

### Logs de Debug

```bash
# Habilitar logs detalhados
export TF_LOG=DEBUG
export TF_LOG_PATH=terraform.log

# Executar com logs
terraform plan
```

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para detalhes.
