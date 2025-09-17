# 🚀 Solução Inteligente de Cabeamento via CSV

## 📋 **Visão Geral**

Solução automatizada para criação de cabos no Netbox que coleta dados reais de cada rack e gera cabos seguindo padrões corretos, sem necessidade de IDs hardcoded.

**📍 Localização:** `global/05-cabling/` - Solução global que pode ser usada para qualquer rack de qualquer site.

## ✨ **Características Principais**

- ✅ **Coleta dados reais** do Netbox automaticamente
- ✅ **Valida existência** de devices e interfaces
- ✅ **Segue padrões corretos** de cabeamento
- ✅ **Escalável** para qualquer número de racks
- ✅ **Sem IDs hardcoded** - usa apenas nomes
- ✅ **Validação automática** de disponibilidade

## 📁 **Arquivos Disponíveis**

### **Scripts Principais:**
- **`smart_rack_cable_generator.py`** - Gerador inteligente que coleta dados reais do Netbox
- **`csv_cable_importer.py`** - Importador individual de cabos
- **`bulk_cable_importer.py`** - Importador em lote para múltiplos racks

### **Documentação:**
- **`README.md`** - Este arquivo (visão geral)
- **`README-EXECUCAO.md`** - Guia detalhado de execução
- **`exemplo_execucao.sh`** - Script de exemplo prático

## 🚀 **Execução Rápida**

### **1. Configurar Netbox:**
```bash
export NETBOX_SERVER_URL='http://localhost:8000'
export NETBOX_API_TOKEN='seu_token_aqui'
```

### **2. Processar um rack:**
```bash
# Gerar CSV baseado em dados reais (com tenant)
python3 smart_rack_cable_generator.py --rack RACK03 --tenant br-ne-1

# Importar cabos no Netbox
python3 csv_cable_importer.py import --file br-ne-1_rack03_cables.csv
```

### **3. Processar múltiplos racks:**
```bash
# Gerar CSVs para múltiplos racks (com tenant)
python3 smart_rack_cable_generator.py --racks RACK03 RACK04 RACK05 --tenant br-ne-1

# Importar cabos em lote
python3 bulk_cable_importer.py --racks RACK03 RACK04 RACK05
```

## 🎯 **Comandos Úteis**

### **Listar tenants disponíveis:**
```bash
python3 smart_rack_cable_generator.py --list-tenants
```

### **Listar racks disponíveis:**
```bash
python3 smart_rack_cable_generator.py --list-racks
```

### **Ver exemplo completo:**
```bash
./exemplo_execucao.sh
```

### **Ajuda dos scripts:**
```bash
python3 smart_rack_cable_generator.py --help
python3 csv_cable_importer.py --help
python3 bulk_cable_importer.py --help
```

## 📊 **Resultado Esperado**

Para **20 racks (rack03-rack22)**:
- **20 arquivos CSV** gerados baseados em dados reais
- **1.800+ cabos** criados automaticamente
- **Tempo estimado:** 20-40 minutos
- **Apenas 2 comandos** para processar tudo

## 🔧 **Padrão de Cabeamento**

### **Por Rack:**
- **18 Servidores:** SRV-XXX-001 a SRV-XXX-018
- **4 Switches:** SWT-XXX-001, SWT-XXX-002, SWT-XXX-003, SWT-XXX-004
- **90 Cabos por rack:**
  - 18 cabos de gerenciamento (IDRAC) → Switches LO
  - 36 cabos de rede SLOT-0-NIC1 → Switches LO
  - 36 cabos de rede SLOT-6-NIC1 → Switches LD

## 🚨 **Pré-requisitos**

- **Netbox acessível** via URL configurada
- **Token de API** com permissões para criar cabos
- **Devices criados** no Netbox via Terraform
- **Interfaces criadas** nos devices via Terraform

## 📖 **Documentação Detalhada**

Para instruções detalhadas, consulte:
- **`README-EXECUCAO.md`** - Guia completo de execução
- **`exemplo_execucao.sh`** - Exemplos práticos

## 🎉 **Vantagens**

Esta solução é **muito mais inteligente** que abordagens anteriores:

1. **Coleta dados reais** do Netbox automaticamente
2. **Valida existência** de devices e interfaces
3. **Segue padrões corretos** de cabeamento
4. **Escala facilmente** para múltiplos racks
5. **Fornece relatórios detalhados** de progresso
6. **Elimina IDs hardcoded** completamente

Com apenas 2 comandos, você pode processar todos os racks e criar milhares de cabos automaticamente! 🚀
