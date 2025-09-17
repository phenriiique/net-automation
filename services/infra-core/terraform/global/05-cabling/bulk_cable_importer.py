#!/usr/bin/env python3
"""
Script para import em lote de cabos de múltiplos racks com suporte a tenant
"""

import os
import csv
import requests
import json
import argparse
from typing import Dict, List, Any, Optional
import time

# Configuração do Netbox
NETBOX_URL = os.getenv('NETBOX_SERVER_URL', 'http://0.0.0.0:8000')
NETBOX_TOKEN = os.getenv('NETBOX_API_TOKEN', '')

# Headers para autenticação
headers = {
    'Authorization': f'Token {NETBOX_TOKEN}',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
}

def get_device_by_name(device_name: str, tenant_name: Optional[str] = None) -> Dict[str, Any]:
    """Busca device por nome no Netbox, opcionalmente filtrando por tenant"""
    url = f"{NETBOX_URL}/api/dcim/devices/"
    params = {'name': device_name}
    
    # Se tenant especificado, buscar tenant primeiro
    if tenant_name:
        tenant_url = f"{NETBOX_URL}/api/tenancy/tenants/"
        tenant_params = {'name': tenant_name}

        try:
            tenant_response = requests.get(tenant_url, headers=headers, params=tenant_params)
            tenant_response.raise_for_status()
            tenant_results = tenant_response.json()['results']

            if not tenant_results:
                print(f"❌ Tenant '{tenant_name}' não encontrado")
                return None

            tenant_id = tenant_results[0]['id']
            params['tenant_id'] = tenant_id

        except requests.exceptions.RequestException as e:
            print(f"❌ Erro ao buscar tenant '{tenant_name}': {e}")
            return None
    
    try:
        response = requests.get(url, headers=headers, params=params)
        response.raise_for_status()
        results = response.json()['results']
        
        if results:
            return results[0]
        else:
            print(f"❌ Device '{device_name}' não encontrado" + (f" no tenant '{tenant_name}'" if tenant_name else ""))
            return None
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao buscar device '{device_name}': {e}")
        return None

def get_interface_by_name(device_id: int, interface_name: str) -> Dict[str, Any]:
    """Busca interface por nome em um device específico"""
    url = f"{NETBOX_URL}/api/dcim/interfaces/"
    params = {
        'device_id': device_id,
        'name': interface_name
    }
    
    try:
        response = requests.get(url, headers=headers, params=params)
        response.raise_for_status()
        results = response.json()['results']
        
        if results:
            return results[0]
        else:
            print(f"❌ Interface '{interface_name}' não encontrada no device ID {device_id}")
            return None
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao buscar interface '{interface_name}': {e}")
        return None

def create_cable_from_csv_row(row: Dict[str, str], tenant_name: Optional[str] = None) -> bool:
    """Cria um cabo a partir de uma linha do CSV"""
    
    # Buscar device A
    device_a = get_device_by_name(row['side_a_device'], tenant_name)
    if not device_a:
        print(f"❌ Device A não encontrado: {row['side_a_device']}")
        return False
    
    # Buscar interface A
    interface_a = get_interface_by_name(device_a['id'], row['side_a_name'])
    if not interface_a:
        print(f"❌ Interface A não encontrada: {row['side_a_device']}:{row['side_a_name']}")
        return False
    
    # Buscar device B
    device_b = get_device_by_name(row['side_b_device'], tenant_name)
    if not device_b:
        print(f"❌ Device B não encontrado: {row['side_b_device']}")
        return False
    
    # Buscar interface B
    interface_b = get_interface_by_name(device_b['id'], row['side_b_name'])
    if not interface_b:
        print(f"❌ Interface B não encontrada: {row['side_b_device']}:{row['side_b_name']}")
        return False
    
    # Criar cabo
    cable_data = {
        'a_terminations': [
            {
                'object_type': 'dcim.interface',
                'object_id': interface_a['id']
            }
        ],
        'b_terminations': [
            {
                'object_type': 'dcim.interface',
                'object_id': interface_b['id']
            }
        ],
        'status': row.get('status', 'connected'),
        # 'tags': ['iac_network']  # Tag removida temporariamente para evitar erro 400
    }
    
    # Fazer requisição para criar o cabo
    url = f"{NETBOX_URL}/api/dcim/cables/"
    
    try:
        response = requests.post(url, headers=headers, json=cable_data)
        response.raise_for_status()
        
        cable = response.json()
        print(f"✅ Cabo criado: {row['side_a_device']}:{row['side_a_name']} -> {row['side_b_device']}:{row['side_b_name']} (ID: {cable['id']})")
        return True
        
    except requests.exceptions.HTTPError as e:
        # Capturar detalhes do erro HTTP
        try:
            error_details = response.json()
            print(f"❌ Erro HTTP {response.status_code}: {error_details}")
        except:
            print(f"❌ Erro HTTP {response.status_code}: {response.text}")
        return False
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro de conexão: {e}")
        return False

def import_cables_from_csv(csv_file: str, tenant_name: Optional[str] = None, delay: float = 0.1) -> Dict[str, int]:
    """Importa cabos de um arquivo CSV"""
    
    if not os.path.exists(csv_file):
        print(f"❌ Arquivo CSV não encontrado: {csv_file}")
        return {'success': 0, 'error': 0}
    
    print(f"🚀 Importando cabos do arquivo: {csv_file}" + (f" (tenant: {tenant_name})" if tenant_name else ""))
    
    success_count = 0
    error_count = 0
    
    with open(csv_file, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        
        for row_num, row in enumerate(reader, 1):
            print(f"\n📡 Processando linha {row_num}: {row['side_a_device']}:{row['side_a_name']} -> {row['side_b_device']}:{row['side_b_name']}")
            
            if create_cable_from_csv_row(row, tenant_name):
                success_count += 1
            else:
                error_count += 1
            
            # Delay para não sobrecarregar a API
            if delay > 0:
                time.sleep(delay)
    
    print(f"\n📊 RESUMO DA IMPORTAÇÃO - {os.path.basename(csv_file)}:")
    print(f"✅ Cabos criados com sucesso: {success_count}")
    print(f"❌ Erros: {error_count}")
    print(f"📝 Total processado: {success_count + error_count}")
    
    return {'success': success_count, 'error': error_count}

def import_multiple_racks(start_rack: int, end_rack: int, tenant_name: Optional[str] = None, csv_dir: str = ".", delay: float = 0.1) -> None:
    """Importa cabos de múltiplos racks"""
    
    print(f"🚀 Importando cabos para racks {start_rack:02d} a {end_rack:02d}" + (f" (tenant: {tenant_name})" if tenant_name else ""))
    print(f"📁 Diretório dos CSVs: {csv_dir}")
    
    total_success = 0
    total_errors = 0
    
    for rack_num in range(start_rack, end_rack + 1):
        # Novo padrão de nomenclatura: {tenant}_{rack}_cables.csv
        if tenant_name:
            csv_file = os.path.join(csv_dir, f"{tenant_name.lower()}_rack{rack_num:02d}_cables.csv")
        else:
            csv_file = os.path.join(csv_dir, f"rack{rack_num:02d}_cables.csv")
        
        if os.path.exists(csv_file):
            print(f"\n{'='*60}")
            print(f"📡 PROCESSANDO RACK {rack_num:02d}")
            print(f"{'='*60}")
            
            result = import_cables_from_csv(csv_file, tenant_name, delay)
            total_success += result['success']
            total_errors += result['error']
        else:
            print(f"⚠️  Arquivo não encontrado: {csv_file}")
    
    print(f"\n{'='*60}")
    print(f"📊 RESUMO GERAL")
    print(f"{'='*60}")
    print(f"✅ Total de cabos criados: {total_success}")
    print(f"❌ Total de erros: {total_errors}")
    print(f"📝 Total processado: {total_success + total_errors}")

def import_single_rack(rack_number: int, tenant_name: Optional[str] = None, csv_dir: str = ".", delay: float = 0.1) -> None:
    """Importa cabos de um rack específico"""
    
    # Novo padrão de nomenclatura: {tenant}_{rack}_cables.csv
    if tenant_name:
        csv_file = os.path.join(csv_dir, f"{tenant_name.lower()}_rack{rack_number:02d}_cables.csv")
    else:
        csv_file = os.path.join(csv_dir, f"rack{rack_number:02d}_cables.csv")
    
    if not os.path.exists(csv_file):
        print(f"❌ Arquivo CSV não encontrado: {csv_file}")
        return
    
    print(f"🚀 Importando cabos para rack {rack_number:02d}" + (f" (tenant: {tenant_name})" if tenant_name else ""))
    import_cables_from_csv(csv_file, tenant_name, delay)

def main():
    parser = argparse.ArgumentParser(description='Importador em lote de cabos CSV para Netbox com suporte a tenant')
    parser.add_argument('--rack', '-r', type=int, help='Número do rack específico')
    parser.add_argument('--start', '-s', type=int, help='Rack inicial (inclusive)')
    parser.add_argument('--end', '-e', type=int, help='Rack final (inclusive)')
    parser.add_argument('--all', '-a', action='store_true', help='Importar para todos os racks (rack03-rack22)')
    parser.add_argument('--tenant', '-t', help='Nome do tenant (ex: br-ne-1)')
    parser.add_argument('--csv-dir', '-d', default='.', help='Diretório dos arquivos CSV (padrão: diretório atual)')
    parser.add_argument('--delay', type=float, default=0.1, help='Delay entre requisições em segundos (padrão: 0.1)')
    parser.add_argument('--dry-run', action='store_true', help='Apenas verificar arquivos, não importar')
    
    args = parser.parse_args()
    
    if not NETBOX_TOKEN:
        print("❌ Erro: NETBOX_API_TOKEN não configurado")
        print("Configure a variável de ambiente: export NETBOX_API_TOKEN='seu_token'")
        return
    
    if args.dry_run:
        print("🔍 MODO DRY-RUN: Apenas verificando arquivos...")
        
        if args.all:
            # Verificar todos os racks
            for rack_num in range(3, 23):
                if args.tenant:
                    csv_file = os.path.join(args.csv_dir, f"{args.tenant.lower()}_rack{rack_num:02d}_cables.csv")
                else:
                    csv_file = os.path.join(args.csv_dir, f"rack{rack_num:02d}_cables.csv")
                
                if os.path.exists(csv_file):
                    print(f"✅ {csv_file}")
                else:
                    print(f"❌ {csv_file}")
        elif args.rack:
            # Verificar rack específico
            if args.tenant:
                csv_file = os.path.join(args.csv_dir, f"{args.tenant.lower()}_rack{args.rack:02d}_cables.csv")
            else:
                csv_file = os.path.join(args.csv_dir, f"rack{args.rack:02d}_cables.csv")
            
            if os.path.exists(csv_file):
                print(f"✅ {csv_file}")
            else:
                print(f"❌ {csv_file}")
        elif args.start and args.end:
            # Verificar range de racks
            for rack_num in range(args.start, args.end + 1):
                if args.tenant:
                    csv_file = os.path.join(args.csv_dir, f"{args.tenant.lower()}_rack{rack_num:02d}_cables.csv")
                else:
                    csv_file = os.path.join(args.csv_dir, f"rack{rack_num:02d}_cables.csv")
                
                if os.path.exists(csv_file):
                    print(f"✅ {csv_file}")
                else:
                    print(f"❌ {csv_file}")
        return
    
    if args.all:
        import_multiple_racks(3, 22, args.tenant, args.csv_dir, args.delay)
    elif args.rack:
        import_single_rack(args.rack, args.tenant, args.csv_dir, args.delay)
    elif args.start and args.end:
        import_multiple_racks(args.start, args.end, args.tenant, args.csv_dir, args.delay)
    else:
        print("❌ Erro: Especifique --rack, --start/--end, ou --all")
        parser.print_help()

if __name__ == "__main__":
    main()
