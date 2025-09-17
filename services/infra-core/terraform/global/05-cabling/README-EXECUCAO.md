# 🚀 Guia de Execução - Solução Inteligente de Cabeamento

## 📋 **Visão Geral**

Esta solução coleta automaticamente os dados reais de cada rack no Netbox e gera cabos seguindo o padrão correto, sem precisar de IDs hardcoded.

**📍 Localização:** `global/05-cabling/` - Solução global que pode ser usada para qualquer rack de qualquer site.

## 🔧 **Configuração Inicial**

### **1. Configurar Variáveis de Ambiente**
```bash
export NETBOX_SERVER_URL='http://localhost:8000'
export NETBOX_API_TOKEN='seu_token_aqui'
```

### **2. Verificar Conexão**
```bash
# Listar tenants disponíveis no Netbox
python3 smart_rack_cable_generator.py --list-tenants

# Listar racks disponíveis no Netbox
python3 smart_rack_cable_generator.py --list-racks
```

## 🎯 **Execução Passo a Passo**

### **Passo 1: Gerar CSV Baseado em Dados Reais do Netbox**

#### **Para um rack específico:**
```bash
python3 smart_rack_cable_generator.py --rack RACK03 --tenant br-ne-1
```

#### **Para múltiplos racks:**
```bash
python3 smart_rack_cable_generator.py --racks RACK03 RACK04 RACK05 --tenant br-ne-1
```

#### **Para todos os racks (rack03-rack22):**
```bash
python3 smart_rack_cable_generator.py --racks RACK03 RACK04 RACK05 RACK06 RACK07 RACK08 RACK09 RACK10 RACK11 RACK12 RACK13 RACK14 RACK15 RACK16 RACK17 RACK18 RACK19 RACK20 RACK21 RACK22 --tenant br-ne-1
```

### **Passo 2: Importar Cabos no Netbox**

#### **Importar um rack específico:**
```bash
# Sem tenant
python3 bulk_cable_importer.py --rack 3

# Com tenant
python3 bulk_cable_importer.py --rack 3 --tenant br-ne-1
```

#### **Importar múltiplos racks:**
```bash
# Sem tenant
python3 bulk_cable_importer.py --start 3 --end 5

# Com tenant
python3 bulk_cable_importer.py --start 3 --end 5 --tenant br-ne-1
```

#### **Importar todos os racks (rack03-rack22):**
```bash
# Sem tenant
python3 bulk_cable_importer.py --all

# Com tenant
python3 bulk_cable_importer.py --all --tenant br-ne-1
```

#### **Verificar arquivos antes de importar (dry-run):**
```bash
python3 bulk_cable_importer.py --rack 3 --tenant br-ne-1 --dry-run
```

## 📊 **Exemplo Completo para RACK03**

### **1. Gerar CSV baseado em dados reais:**
```bash
python3 smart_rack_cable_generator.py --rack RACK03 --tenant br-ne-1
```

**Saída esperada:**
```
============================================================
🚀 PROCESSANDO RACK: RACK03
============================================================
🔍 Coletando devices do rack: RACK03
✅ Rack encontrado: RACK03 (ID: 123)
📊 Total de devices encontrados: 22
🖥️  Servidores encontrados: 18
   - SRV-003-001 (posição: 1, tipo: Dell R750)
   - SRV-003-002 (posição: 2, tipo: Dell R750)
   ...
🔌 Switches encontrados: 4
   - SWT-003-001 (posição: 20, tipo: Dell N3248TE)
   - SWT-003-002 (posição: 21, tipo: Dell N3248TE)
   - SWT-003-003 (posição: 22, tipo: Dell S5248F)
   - SWT-003-004 (posição: 23, tipo: Dell S5248F)
🔌 Switches LO: ['SWT-003-001', 'SWT-003-002']
🔌 Switches LD: ['SWT-003-003', 'SWT-003-004']
🔍 Gerando cabos de gerenciamento...
🔍 Gerando cabos de rede SLOT-0-NIC1...
🔍 Gerando cabos de rede SLOT-6-NIC1...

✅ Rack RACK03: ./rack03_cables.csv
   📊 Total de cabos: 90
   🔌 Cabos de gerenciamento: 18
   🌐 Cabos de rede: 72
```

### **2. Importar cabos no Netbox:**
```bash
python3 csv_cable_importer.py import --file br-ne-1_rack03_cables.csv
```

**Saída esperada:**
```
🚀 Importando cabos do arquivo: rack03_cables.csv

📡 Processando linha 1: SRV-003-001:IDRAC -> SWT-003-001:0/25
✅ Cabo criado: SRV-003-001:IDRAC -> SWT-003-001:0/25 (ID: 15)

📡 Processando linha 2: SRV-003-002:IDRAC -> SWT-003-001:0/26
✅ Cabo criado: SRV-003-002:IDRAC -> SWT-003-001:0/26 (ID: 17)

...

📊 RESUMO DA IMPORTAÇÃO:
✅ Cabos criados com sucesso: 90
❌ Erros: 0
📝 Total processado: 90
```

## 🔄 **Processo Automatizado para Múltiplos Racks**

### **Script de Automação Completa:**
```bash
#!/bin/bash
# Script para processar todos os racks automaticamente

# Configurar Netbox
export NETBOX_SERVER_URL='http://localhost:8000'
export NETBOX_API_TOKEN='seu_token_aqui'

# Lista de racks
RACKS="RACK03 RACK04 RACK05 RACK06 RACK07 RACK08 RACK09 RACK10 RACK11 RACK12 RACK13 RACK14 RACK15 RACK16 RACK17 RACK18 RACK19 RACK20 RACK21 RACK22"

echo "🚀 Iniciando processamento de todos os racks..."

# Passo 1: Gerar CSVs baseados em dados reais
echo "📋 Passo 1: Gerando CSVs baseados em dados reais do Netbox..."
python3 smart_rack_cable_generator.py --racks $RACKS

# Passo 2: Importar cabos no Netbox
echo "📋 Passo 2: Importando cabos no Netbox..."
python3 bulk_cable_importer.py --racks $RACKS

echo "✅ Processamento concluído!"
```

## 🛠️ **Comandos Úteis**

### **Verificar racks disponíveis:**
```bash
python3 smart_rack_cable_generator.py --list-racks
```

### **Gerar CSV para rack específico:**
```bash
python3 smart_rack_cable_generator.py --rack RACK03
```

### **Gerar CSV para múltiplos racks:**
```bash
python3 smart_rack_cable_generator.py --racks RACK03 RACK04 RACK05
```

### **Importar CSV específico:**
```bash
python3 csv_cable_importer.py import --file rack03_cables.csv
```

### **Importar múltiplos racks:**
```bash
python3 bulk_cable_importer.py --racks RACK03 RACK04 RACK05
```

### **Importar com delay personalizado:**
```bash
python3 bulk_cable_importer.py --racks RACK03 RACK04 --delay 0.5
```

## 📁 **Estrutura de Arquivos Gerados**

```
05-cabling-new/
├── smart_rack_cable_generator.py  # Gerador inteligente
├── csv_cable_importer.py          # Importador individual
├── bulk_cable_importer.py         # Importador em lote
├── rack03_cables.csv              # CSV gerado para RACK03
├── rack04_cables.csv              # CSV gerado para RACK04
└── ...
```

## 🎯 **Vantagens da Nova Abordagem**

### **✅ Coleta Dados Reais:**
- Busca automaticamente os devices no Netbox
- Identifica servidores e switches por tipo
- Coleta interfaces reais de cada device
- Valida existência de devices e interfaces

### **✅ Segue Padrões Corretos:**
- Cabos de gerenciamento (IDRAC) → Switches LO
- Cabos de rede SLOT-0-NIC1 → Switches LO
- Cabos de rede SLOT-6-NIC1 → Switches LD
- Portas corretas baseadas na posição do servidor

### **✅ Validação Automática:**
- Verifica se devices existem
- Verifica se interfaces existem
- Verifica se interfaces estão disponíveis
- Relatórios detalhados de erros

### **✅ Escalável:**
- Funciona para qualquer número de racks
- Processa múltiplos racks em lote
- Adapta-se a diferentes configurações de rack

## 🚨 **Troubleshooting**

### **Erro: Rack não encontrado**
- Verifique se o rack existe no Netbox
- Use `--list-racks` para ver racks disponíveis
- Confirme o nome exato do rack

### **Erro: Device não encontrado**
- Verifique se os devices estão no rack correto
- Confirme se os devices foram criados via Terraform
- Verifique se os nomes dos devices estão corretos

### **Erro: Interface não encontrada**
- Verifique se as interfaces foram criadas via Terraform
- Confirme se os nomes das interfaces estão corretos
- Verifique se as interfaces estão habilitadas

### **Erro: API Token**
- Configure a variável de ambiente: `export NETBOX_API_TOKEN='seu_token'`
- Verifique se o token tem permissões para criar cabos
- Confirme se o Netbox está acessível

## 🎉 **Conclusão**

Esta solução é **muito mais inteligente** que a anterior porque:

1. **Coleta dados reais** do Netbox automaticamente
2. **Valida existência** de devices e interfaces
3. **Segue padrões corretos** de cabeamento
4. **Escala facilmente** para múltiplos racks
5. **Fornece relatórios detalhados** de progresso

Com apenas 2 comandos, você pode processar todos os racks e criar milhares de cabos automaticamente! 🚀
