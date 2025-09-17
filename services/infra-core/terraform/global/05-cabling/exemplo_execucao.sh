#!/bin/bash
# Exemplo prático de execução da solução inteligente de cabeamento
# Localização: services/infra-core/terraform/global/05-cabling/

echo "🚀 Exemplo de Execução - Solução Inteligente de Cabeamento"
echo "=========================================================="

# Configurar variáveis de ambiente
echo "📋 Passo 1: Configurar variáveis de ambiente"
echo "export NETBOX_SERVER_URL='http://localhost:8000'"
echo "export NETBOX_API_TOKEN='seu_token_aqui'"
echo ""

# Listar tenants disponíveis
echo "📋 Passo 2: Listar tenants disponíveis no Netbox"
echo "python3 smart_rack_cable_generator.py --list-tenants"
echo ""

# Listar racks disponíveis
echo "📋 Passo 3: Listar racks disponíveis no Netbox"
echo "python3 smart_rack_cable_generator.py --list-racks"
echo ""

# Gerar CSV para um rack específico
echo "📋 Passo 4: Gerar CSV baseado em dados reais do Netbox"
echo "python3 smart_rack_cable_generator.py --rack RACK03 --tenant br-ne-1"
echo ""

# Importar cabos no Netbox
echo "📋 Passo 5: Importar cabos diretamente no Netbox"
echo "python3 bulk_cable_importer.py --rack 3 --tenant br-ne-1"
echo ""

# Processar múltiplos racks
echo "📋 Passo 6: Processar múltiplos racks"
echo "python3 smart_rack_cable_generator.py --racks RACK03 RACK04 RACK05 --tenant br-ne-1"
echo "python3 bulk_cable_importer.py --start 3 --end 5 --tenant br-ne-1"
echo ""

# Processar todos os racks
echo "📋 Passo 7: Processar todos os racks (rack03-rack22)"
echo "python3 smart_rack_cable_generator.py --racks RACK03 RACK04 RACK05 RACK06 RACK07 RACK08 RACK09 RACK10 RACK11 RACK12 RACK13 RACK14 RACK15 RACK16 RACK17 RACK18 RACK19 RACK20 RACK21 RACK22 --tenant br-ne-1"
echo "python3 bulk_cable_importer.py --all --tenant br-ne-1"
echo ""

# Verificar arquivos antes de importar
echo "📋 Passo 8: Verificar arquivos antes de importar (dry-run)"
echo "python3 bulk_cable_importer.py --rack 3 --tenant br-ne-1 --dry-run"
echo ""

echo "🎯 Vantagens da Nova Abordagem:"
echo "✅ Coleta dados reais do Netbox automaticamente"
echo "✅ Valida existência de devices e interfaces"
echo "✅ Segue padrões corretos de cabeamento"
echo "✅ Escala facilmente para múltiplos racks"
echo "✅ Fornece relatórios detalhados de progresso"
echo ""

echo "📊 Resultado esperado para 20 racks:"
echo "- 20 arquivos CSV gerados baseados em dados reais"
echo "- 1.800+ cabos criados automaticamente"
echo "- Tempo estimado: 20-40 minutos"
echo ""

echo "✅ Solução muito mais inteligente que a anterior!"
echo "   - Sem necessidade de IDs hardcoded"
echo "   - Coleta dados reais do Netbox"
echo "   - Validação automática de devices e interfaces"
echo "   - Apenas 2 comandos para processar todos os racks"
