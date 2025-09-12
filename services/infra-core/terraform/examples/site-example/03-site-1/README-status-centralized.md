# 🎯 Status Centralizado - Guia de Uso

## 📋 **Visão Geral**

As variáveis `status_site_rack` e `status_vlan_prefix` centralizadas permitem controlar o status de **todos os recursos** do site através de duas configurações no `main.tf`.

**Por que duas variáveis?** Diferentes recursos do Netbox têm validações diferentes para o campo `status`.

## 🔧 **Configuração**

### **Localização:**
```hcl
# main.tf
locals {
  tenant_name    = "br-ne-1"
  site_name      = "Site Nordeste" 
  description    = "Data center ${local.site_name} - Em planejamento"
  base_network   = "10.0"
  rack_qtd       = 22
  
  # Status centralizados - diferentes recursos têm validações diferentes
  status_site_rack = "planned"  # Para Site e Rack (suportam "planned")
  status_vlan_prefix = "active" # Para VLAN e Prefix (não suportam "planned")
}
```

### **Valores Possíveis por Tipo de Recurso:**

#### **Site e Rack (`status_site_rack`):**
| Status | Descrição | Uso Recomendado |
|--------|-----------|-----------------|
| `"planned"` | Planejado | Ambiente em planejamento |
| `"active"` | Ativo | Ambiente em produção |
| `"reserved"` | Reservado | Ambiente reservado (apenas Rack) |
| `"available"` | Disponível | Ambiente disponível (apenas Rack) |
| `"deprecated"` | Descontinuado | Ambiente sendo descontinuado (apenas Rack) |
| `"retired"` | Aposentado | Ambiente aposentado (apenas Site) |

#### **VLAN e Prefix (`status_vlan_prefix`):**
| Status | Descrição | Uso Recomendado |
|--------|-----------|-----------------|
| `"active"` | Ativo | Ambiente em produção |
| `"reserved"` | Reservado | Ambiente reservado |
| `"deprecated"` | Descontinuado | Ambiente sendo descontinuado |
| `"container"` | Container | Prefixo container (apenas Prefix) |

## 🎯 **Recursos Afetados**

As variáveis de status centralizadas afetam os seguintes recursos:

### **1. Site (usa `status_site_rack`)**
```hcl
module "site_br-ne-1" {
  status = local.status_site_rack  # ← Usa status para Site/Rack
}
```

### **2. Racks (22 racks - usa `status_site_rack`)**
```hcl
resource "netbox_rack" "racks" {
  status = local.status_site_rack  # ← Usa status para Site/Rack
}
```

### **3. VLANs (9 VLANs - usa `status_vlan_prefix`)**
```hcl
module "vlan_100" {
  status = local.status_vlan_prefix  # ← Usa status para VLAN/Prefix
}
# ... todas as outras VLANs
```

### **4. Prefixos (41 prefixos - usa `status_vlan_prefix`)**
```hcl
module "prefix_container_main" {
  status = local.status_vlan_prefix  # ← Usa status para VLAN/Prefix
}
# ... todos os outros prefixos
```

## 🚀 **Cenários de Uso**

### **Cenário 1: Ambiente em Planejamento**
```hcl
locals {
  status_site_rack = "planned"    # Site e Racks como "planned"
  status_vlan_prefix = "active"   # VLANs e Prefixos como "active"
}
```

### **Cenário 2: Ativação do Ambiente**
```hcl
locals {
  status_site_rack = "active"     # Site e Racks como "active"
  status_vlan_prefix = "active"   # VLANs e Prefixos como "active"
}
```

### **Cenário 3: Ambiente Reservado**
```hcl
locals {
  status_site_rack = "reserved"   # Site e Racks como "reserved"
  status_vlan_prefix = "reserved" # VLANs e Prefixos como "reserved"
}
```

### **Cenário 4: Descontinuação**
```hcl
locals {
  status_site_rack = "deprecated"   # Site e Racks como "deprecated"
  status_vlan_prefix = "deprecated" # VLANs e Prefixos como "deprecated"
}
```

## 📊 **Impacto da Mudança**

### **Antes (Status Individual):**
```hcl
# Cada recurso com status diferente
module "site_br-ne-1" {
  status = "planned"
}

module "vlan_100" {
  status = "active"
}

resource "netbox_rack" "racks" {
  status = "reserved"
}
```

### **Depois (Status Centralizado):**
```hcl
# Recursos agrupados por tipo com status centralizado
locals {
  status_site_rack = "active"     # ← Uma mudança afeta Site e Racks
  status_vlan_prefix = "active"   # ← Uma mudança afeta VLANs e Prefixos
}

module "site_br-ne-1" {
  status = local.status_site_rack  # ← "active"
}

module "vlan_100" {
  status = local.status_vlan_prefix  # ← "active"
}

resource "netbox_rack" "racks" {
  status = local.status_site_rack  # ← "active"
}
```

## 🔄 **Fluxo de Trabalho**

### **1. Planejamento Inicial**
```hcl
locals {
  status_site_rack = "planned"    # Site e Racks em planejamento
  status_vlan_prefix = "active"   # VLANs e Prefixos ativos
}
```

### **2. Ativação do Ambiente**
```hcl
locals {
  status_site_rack = "active"     # Site e Racks ativos
  status_vlan_prefix = "active"   # VLANs e Prefixos ativos
}
```

### **3. Aplicar Mudanças**
```bash
terraform plan   # Verificar mudanças
terraform apply  # Aplicar mudanças
```

## ⚡ **Vantagens**

### **✅ Simplicidade**
- Duas variáveis controlam todo o ambiente
- Mudanças rápidas e consistentes
- Menos chance de erro

### **✅ Consistência**
- Recursos agrupados por tipo com status consistente
- Estado uniforme do ambiente
- Facilita auditoria

### **✅ Escalabilidade**
- Fácil replicação para outros sites
- Padrão consistente entre ambientes
- Manutenção simplificada

### **✅ Flexibilidade**
- Mudança rápida de status por grupo
- Suporte a diferentes cenários
- Adaptação a necessidades do negócio
- Respeita validações específicas de cada recurso

## 🎯 **Exemplos Práticos**

### **Ativar Ambiente Completo**
```hcl
# main.tf
locals {
  status_site_rack = "active"     # ← Mudança para Site e Racks
  status_vlan_prefix = "active"   # ← Mudança para VLANs e Prefixos
}
```

**Resultado:** Todos os 73 recursos (1 site + 22 racks + 9 VLANs + 41 prefixos) ficam com status "active"

### **Colocar Ambiente em Manutenção**
```hcl
# main.tf
locals {
  status_site_rack = "reserved"   # ← Mudança para Site e Racks
  status_vlan_prefix = "reserved" # ← Mudança para VLANs e Prefixos
}
```

**Resultado:** Todos os 73 recursos ficam com status "reserved"

### **Descontinuar Ambiente**
```hcl
# main.tf
locals {
  status_site_rack = "deprecated"   # ← Mudança para Site e Racks
  status_vlan_prefix = "deprecated" # ← Mudança para VLANs e Prefixos
}
```

**Resultado:** Todos os 73 recursos ficam com status "deprecated"

## 🔍 **Verificação**

### **Comando para verificar status:**
```bash
terraform plan | grep "status"
```

### **Output esperado:**
```
# module.site_br-ne-1.netbox_site.this will be updated in-place
  ~ status = "planned" -> "active"

# netbox_rack.racks[1] will be updated in-place
  ~ status = "planned" -> "active"

# module.vlan_100.netbox_vlan.this will be updated in-place
  ~ status = "active" -> "active"  # Já estava ativo

# module.prefix_container_main.netbox_prefix.this will be updated in-place
  ~ status = "active" -> "active"  # Já estava ativo
```

## 📝 **Notas Importantes**

1. **Backup:** Sempre faça backup antes de mudanças de status
2. **Teste:** Use `terraform plan` antes de `terraform apply`
3. **Documentação:** Mantenha registro das mudanças de status
4. **Comunicação:** Informe a equipe sobre mudanças de status
5. **Monitoramento:** Monitore o impacto das mudanças

## 🎉 **Conclusão**

A implementação do status centralizado com duas variáveis oferece:
- **Controle unificado** de todo o ambiente
- **Mudanças rápidas** e consistentes
- **Facilidade de manutenção** e escalabilidade
- **Padrão consistente** entre ambientes
- **Respeito às validações** específicas de cada recurso

Agora você pode ativar um ambiente completo mudando apenas duas variáveis! 🚀
