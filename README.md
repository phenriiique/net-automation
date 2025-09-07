# Network Automation

Este repositório contém ferramentas e automações para gerenciamento de infraestrutura de rede usando Netbox e Terraform.

## Estrutura do Projeto

```
network-automation/
├── services/
│   ├── infra-core/          # Infraestrutura como código (Terraform)
│   │   └── terraform/
│   │       ├── modules/     # Módulos Terraform reutilizáveis
│   │       └── examples/    # Exemplos de uso dos módulos
│   ├── monitoring/          # Monitoramento (Grafana, Prometheus)
│   └── netbox/             # Ambiente Netbox (Docker Compose)
└── README.md
```

## Módulos Terraform Disponíveis

### netbox-site
Módulo para criação e gerenciamento de sites no Netbox.

**Recursos:**
- Criação de sites
- Geração automática de slug (tratamento de acentos)
- Suporte a status (active, planned, retired)
- Suporte a tags e campos customizados

### netbox-tenant
Módulo para criação e gerenciamento de tenants no Netbox.

**Recursos:**
- Criação de tenants
- Geração automática de slug (tratamento de acentos)
- Suporte a grupos de tenants
- Suporte a tags e campos customizados

## Pré-requisitos

- Docker e Docker Compose
- Terraform >= 1.0
- Git

## Configuração Inicial

### 1. Clonar o repositório
```bash
git clone git@github.com:phenriiique/NETWORK-AUTOMATION.git
cd NETWORK-AUTOMATION
```

### 2. Iniciar o ambiente Netbox
```bash
cd services/netbox
docker-compose up -d
```

### 3. Configurar variáveis de ambiente
```bash
cd services/infra-core/terraform
source env
```

### 4. Usar os módulos Terraform
```bash
cd examples/site-example
terraform init
terraform plan
terraform apply
```

## Exemplos de Uso

### Criar um site
```hcl
module "site_exemplo" {
  source = "../../modules/netbox-site"
  
  name        = "Site São Paulo"
  description = "Data center principal em São Paulo"
  status      = "active"
  tags        = ["produção", "brasil"]
}
```

### Criar um tenant
```hcl
module "tenant_exemplo" {
  source = "../../modules/netbox-tenant"
  
  name        = "Empresa ABC"
  description = "Tenant para a Empresa ABC"
  tags        = ["produção", "brasil"]
}
```

## Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
