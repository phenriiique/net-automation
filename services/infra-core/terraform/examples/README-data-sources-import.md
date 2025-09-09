# 📚 Guia Completo: Data Sources vs Import no Terraform + Netbox

## 🎯 **Conceitos Fundamentais**

### **Data Sources** 🔍
- **Função**: **Consultar** recursos existentes sem gerenciá-los
- **Estado**: Não são adicionados ao estado do Terraform
- **Controle**: Apenas leitura, não modifica o recurso
- **Uso**: Referenciar recursos existentes em novos recursos

### **Import** 📥
- **Função**: **Assumir controle** de recursos existentes
- **Estado**: São adicionados ao estado do Terraform
- **Controle**: Gerenciamento completo (criar, modificar, destruir)
- **Uso**: Migrar recursos manuais para IaC

---

## 🔄 **Comparação Prática**

| Aspecto | Data Source | Import |
|---------|-------------|---------|
| **Objetivo** | Consultar recursos existentes | Gerenciar recursos existentes |
| **Estado Terraform** | ❌ Não adiciona ao estado | ✅ Adiciona ao estado |
| **Modificação** | ❌ Apenas leitura | ✅ Pode modificar |
| **Destruição** | ❌ Não pode destruir | ✅ Pode destruir |
| **Comando** | `terraform plan/apply` | `terraform import` |
| **Casos de uso** | Referenciar recursos existentes | Migrar para IaC |

---

## 🌐 **Data Sources Disponíveis no Netbox**

### **Recursos que podem ser consultados:**

```hcl
# Consultar site existente
data "netbox_site" "existing" {
  name = "Site São Paulo"
}

# Consultar tenant existente
data "netbox_tenant" "existing" {
  name = "br-ne-1"
}

# Consultar VLAN existente
data "netbox_vlan" "existing" {
  vid = 100
}

# Consultar prefixo existente
data "netbox_prefix" "existing" {
  prefix = "10.0.0.0/16"
}

# Consultar tag existente
data "netbox_tag" "existing" {
  name = "production"
}

# Consultar VLAN group existente
data "netbox_vlan_group" "existing" {
  name = "VLANs 100 - Infraestrutura"
}
```

---

## 📋 **Casos de Uso Práticos**

### **1. Data Sources - Quando usar:**

#### **🎯 Cenário 1: Integração com Netbox Produtivo**
```hcl
# Consultar recursos existentes no Netbox produtivo
data "netbox_site" "prod_site" {
  name = "Data Center São Paulo"
}

data "netbox_tenant" "prod_tenant" {
  name = "empresa-principal"
}

# Criar novos recursos usando dados existentes
resource "netbox_vlan" "new_vlan" {
  name        = "VLAN 300 - Novo Projeto"
  vid         = 300
  site_id     = data.netbox_site.prod_site.id      # ← Usando data source
  tenant_id   = data.netbox_tenant.prod_tenant.id  # ← Usando data source
}
```

#### **🎯 Cenário 2: Referenciar Infraestrutura Existente**
```hcl
# Consultar VLAN existente para criar prefixo
data "netbox_vlan" "production_vlan" {
  vid = 250
}

# Criar prefixo associado à VLAN existente
resource "netbox_prefix" "new_prefix" {
  prefix      = "10.1.0.0/24"
  vlan_id     = data.netbox_vlan.production_vlan.id  # ← Usando data source
  site_id     = data.netbox_site.prod_site.id
}
```

### **2. Import - Quando usar:**

#### **🎯 Cenário 1: Migração de Recursos Manuais**
```bash
# Importar site criado manualmente
terraform import netbox_site.existing_site 123

# Importar tenant criado manualmente
terraform import netbox_tenant.existing_tenant 456

# Importar VLAN criada manualmente
terraform import netbox_vlan.existing_vlan 789
```

#### **🎯 Cenário 2: Assumir Controle de Infraestrutura Existente**
```hcl
# Recursos que serão importados
resource "netbox_site" "existing_site" {
  name        = "Site Existente"
  description = "Site criado manualmente"
  status      = "active"
}

resource "netbox_tenant" "existing_tenant" {
  name        = "Tenant Existente"
  description = "Tenant criado manualmente"
}
```

---

## 🚀 **Fluxo de Trabalho Recomendado**

### **Para Data Sources:**
1. **Identificar** recursos existentes no Netbox
2. **Consultar** usando data sources
3. **Referenciar** em novos recursos
4. **Aplicar** com `terraform apply`

### **Para Import:**
1. **Identificar** recursos existentes no Netbox
2. **Criar** definições no código Terraform
3. **Importar** com `terraform import`
4. **Verificar** com `terraform plan`
5. **Ajustar** valores se necessário
6. **Aplicar** com `terraform apply`

---

## ⚠️ **Considerações Importantes**

### **Data Sources:**
- ✅ **Seguros**: Não modificam recursos existentes
- ✅ **Flexíveis**: Podem ser usados em múltiplos recursos
- ❌ **Limitados**: Apenas leitura
- ❌ **Dependentes**: Dependem da existência do recurso

### **Import:**
- ✅ **Controle total**: Gerenciamento completo
- ✅ **Migração**: Permite migrar para IaC
- ⚠️ **Cuidado**: Pode modificar recursos existentes
- ⚠️ **Complexo**: Requer sincronização manual

---

## 🔧 **Comandos Práticos**

### **Data Sources:**
```bash
# Verificar se os data sources funcionam
terraform plan

# Aplicar usando data sources
terraform apply
```

### **Import:**
```bash
# Importar recurso específico
terraform import netbox_site.existing_site 123

# Verificar estado após import
terraform plan

# Aplicar mudanças
terraform apply
```

---

## 📊 **Exemplo Completo: Cenário Híbrido**

```hcl
# ====== CONSULTAR RECURSOS EXISTENTES (Data Sources) ======
data "netbox_site" "prod_site" {
  name = "Data Center São Paulo"
}

data "netbox_tenant" "prod_tenant" {
  name = "empresa-principal"
}

# ====== IMPORTAR RECURSOS EXISTENTES ======
resource "netbox_vlan" "existing_vlan" {
  name        = "VLAN 100 - Management"
  vid         = 100
  status      = "active"
  description = "VLAN de gerenciamento existente"
  site_id     = data.netbox_site.prod_site.id      # ← Usando data source
  tenant_id   = data.netbox_tenant.prod_tenant.id  # ← Usando data source
}

# ====== CRIAR NOVOS RECURSOS ======
resource "netbox_prefix" "new_prefix" {
  prefix      = "10.1.0.0/24"
  status      = "active"
  description = "Novo prefixo criado via Terraform"
  site_id     = data.netbox_site.prod_site.id      # ← Usando data source
  tenant_id   = data.netbox_tenant.prod_tenant.id  # ← Usando data source
  vlan_id     = netbox_vlan.existing_vlan.id       # ← Usando recurso importado
}
```

---

## 🎯 **Recomendações**

### **Use Data Sources quando:**
- ✅ Precisa referenciar recursos existentes
- ✅ Não quer gerenciar o recurso existente
- ✅ Quer criar novos recursos baseados em existentes
- ✅ Trabalha com Netbox produtivo

### **Use Import quando:**
- ✅ Quer migrar recursos manuais para IaC
- ✅ Precisa gerenciar recursos existentes
- ✅ Quer controle total sobre a infraestrutura
- ✅ Está consolidando tudo no Terraform

---

## 🔗 **Próximos Passos**

1. **Teste Data Sources**: Use o arquivo `data-sources-example.tf`
2. **Teste Import**: Use o arquivo `import-example.tf`
3. **Integre com Netbox Produtivo**: Configure variáveis de ambiente
4. **Automatize**: Crie scripts para importação em massa
5. **Documente**: Mantenha registro dos recursos importados
