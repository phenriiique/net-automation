# 🌐 Recursos Globais - Terraform Netbox

## 📋 **Visão Geral**

Este diretório contém recursos **globais** que podem ser utilizados em **qualquer site** do ambiente, independentemente da localização específica.

## 📁 **Estrutura dos Recursos Globais**

### **00-tags** - Tags Globais
- Tags padronizadas para todo o ambiente
- Categorização consistente de recursos
- **Execução:** Primeiro, antes de qualquer outro recurso

### **01-device_types** - Tipos de Dispositivos
- Definições de tipos de servidores e switches
- Manufacturers e device roles
- **Execução:** Segundo, após as tags

### **04-racks** - Racks Globais
- Definições de racks físicos
- Devices (servidores e switches) nos racks
- **Execução:** Terceiro, após device types

### **05-cabling** - Solução de Cabeamento
- **Nova solução inteligente** para criação de cabos
- Coleta dados reais do Netbox automaticamente
- Gera cabos seguindo padrões corretos
- **Execução:** Último, após todos os devices estarem criados

## 🔄 **Ordem de Execução**

```bash
# 1. Tags globais (base para tudo)
cd global/00-tags
terraform apply

# 2. Tipos de dispositivos
cd ../01-device_types
terraform apply

# 3. Racks e devices
cd ../04-racks
terraform apply

# 4. Cabeamento (último)
cd ../05-cabling
# Usar scripts Python para gerar e importar cabos
```

## 🚀 **Solução de Cabeamento (05-cabling)**

### **Características:**
- ✅ **Coleta dados reais** do Netbox automaticamente
- ✅ **Valida existência** de devices e interfaces
- ✅ **Segue padrões corretos** de cabeamento
- ✅ **Escalável** para qualquer número de racks
- ✅ **Sem IDs hardcoded** - usa apenas nomes
- ✅ **Validação automática** de disponibilidade

### **Uso:**
```bash
# Configurar Netbox
export NETBOX_SERVER_URL='http://localhost:8000'
export NETBOX_API_TOKEN='seu_token_aqui'

# Processar um rack (com tenant)
cd global/05-cabling
python3 smart_rack_cable_generator.py --rack RACK03 --tenant br-ne-1
python3 csv_cable_importer.py import --file br-ne-1_rack03_cables.csv

# Processar múltiplos racks (com tenant)
python3 smart_rack_cable_generator.py --racks RACK03 RACK04 RACK05 --tenant br-ne-1
python3 bulk_cable_importer.py --racks RACK03 RACK04 RACK05
```

### **Documentação:**
- **`05-cabling/README.md`** - Visão geral da solução
- **`05-cabling/README-EXECUCAO.md`** - Guia detalhado de execução
- **`05-cabling/exemplo_execucao.sh`** - Exemplos práticos

## 🎯 **Vantagens da Estrutura Global**

1. **Reutilização:** Recursos podem ser usados em qualquer site
2. **Consistência:** Padrões uniformes em todo o ambiente
3. **Manutenção:** Centralização facilita atualizações
4. **Escalabilidade:** Fácil adição de novos sites
5. **Organização:** Separação clara entre global e específico

## 📊 **Resultado Esperado**

Para **20 racks (rack03-rack22)**:
- **20 arquivos CSV** gerados baseados em dados reais
- **1.800+ cabos** criados automaticamente
- **Tempo estimado:** 20-40 minutos
- **Apenas 2 comandos** para processar tudo

## 🔧 **Pré-requisitos**

- **Netbox acessível** via URL configurada
- **Token de API** com permissões adequadas
- **Recursos globais** executados na ordem correta
- **Devices criados** no Netbox via Terraform

## 🎉 **Conclusão**

Esta estrutura global permite uma **gestão centralizada** e **escalável** de recursos, com a solução de cabeamento sendo **completamente automatizada** e **inteligente**. Com apenas alguns comandos, você pode processar todos os racks e criar milhares de cabos automaticamente! 🚀
