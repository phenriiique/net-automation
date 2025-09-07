# Exemplo de Uso - Sites Netbox

Este exemplo demonstra como usar o módulo `netbox-site` para criar e gerenciar sites no Netbox.

## Pré-requisitos

1. **Netbox rodando**: Certifique-se de que o Netbox está rodando e acessível
2. **Token de API**: Obtenha um token de API do Netbox
3. **Variáveis de ambiente**: Configure as variáveis necessárias

## Configuração

### 1. Variáveis de Ambiente

Configure as seguintes variáveis de ambiente:

```bash
export NETBOX_URL="http://localhost:8000"
export NETBOX_TOKEN="seu-token-aqui"
```

### 2. Executar o Exemplo

```bash
# Navegar para o diretório do exemplo
cd examples/site-example

# Inicializar o Terraform
terraform init

# Planejar as mudanças
terraform plan

# Aplicar as mudanças
terraform apply
```

## Sites Criados

Este exemplo cria três sites:

### 1. Site São Paulo (Básico)
- **Nome**: Site São Paulo
- **Status**: Active
- **Facility**: SP-DC-01
- **Tags**: production, datacenter, sp

### 2. Site Rio de Janeiro (Completo)
- **Nome**: Data Center Rio de Janeiro
- **Status**: Active
- **Facility**: RJ-DC-01
- **ASN**: 65002
- **Endereço**: Av. Atlântica, 2000 - Rio de Janeiro, RJ
- **Coordenadas**: -22.9068, -43.1729
- **Contato**: Maria Santos (maria.santos@empresa.com)
- **Tags**: production, datacenter, rj, secondary
- **Campos customizados**: capacity=500, tier=2, power_usage=250kW

### 3. Site Brasília (Planejado)
- **Nome**: Site Brasília
- **Status**: Planned
- **Facility**: BSB-DC-01
- **Endereço**: Setor Comercial Sul - Brasília, DF
- **Contato**: Carlos Oliveira (carlos.oliveira@empresa.com)
- **Tags**: planned, datacenter, brasilia
- **Campos customizados**: expected_capacity=300, tier=2, planned_date=2024-06-01

## Outputs

Após a execução, você terá acesso aos seguintes outputs:

- `site_sp_id`: ID do site São Paulo
- `site_sp_url`: URL do site São Paulo no Netbox
- `site_rj_id`: ID do site Rio de Janeiro
- `site_rj_url`: URL do site Rio de Janeiro no Netbox
- `site_bsb_id`: ID do site Brasília
- `site_bsb_url`: URL do site Brasília no Netbox
- `all_sites`: Informações consolidadas de todos os sites

## Limpeza

Para remover os recursos criados:

```bash
terraform destroy
```

## Personalização

Você pode modificar o arquivo `main.tf` para:

- Alterar informações dos sites
- Adicionar novos sites
- Modificar campos customizados
- Ajustar tags e metadados

## Troubleshooting

### Erro de Conexão
- Verifique se o Netbox está rodando
- Confirme se a URL está correta
- Teste a conectividade: `curl $NETBOX_URL/api/status/`

### Erro de Autenticação
- Verifique se o token está correto
- Confirme se o token tem permissões adequadas
- Teste a autenticação: `curl -H "Authorization: Token $NETBOX_TOKEN" $NETBOX_URL/api/status/`

### Erro de Validação
- Verifique se os valores dos campos estão corretos
- Confirme se as tags existem no Netbox
- Verifique se os campos customizados estão configurados
