#!/usr/bin/env python3
"""
Script para importar cabos via CSV diretamente no Netbox
Elimina a necessidade de coletar IDs de interfaces manualmente
"""

import os
import csv
import requests
import json
from typing import Dict, List, Any
import argparse

# Configuração do Netbox
NETBOX_URL = os.getenv('NETBOX_SERVER_URL', 'http://0.0.0.0:8000')
NETBOX_TOKEN = os.getenv('NETBOX_API_TOKEN', '')

# Headers para autenticação
headers = {
    'Authorization': f'Token {NETBOX_TOKEN}',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
}

def get_device_by_name(device_name: str) -> Dict[str, Any]:
    """Busca device por nome no Netbox"""
    url = f"{NETBOX_URL}/api/dcim/devices/"
    params = {'name': device_name}
    
    try:
        response = requests.get(url, headers=headers, params=params)
        response.raise_for_status()
        results = response.json()['results']
        
        if results:
            return results[0]
        else:
            print(f"❌ Device '{device_name}' não encontrado")
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

def create_cable_from_csv_row(row: Dict[str, str]) -> bool:
    """Cria um cabo a partir de uma linha do CSV"""
    
    # Buscar device A
    device_a = get_device_by_name(row['side_a_device'])
    if not device_a:
        print(f"❌ Device A não encontrado: {row['side_a_device']}")
        return False
    
    # Buscar interface A
    interface_a = get_interface_by_name(device_a['id'], row['side_a_name'])
    if not interface_a:
        print(f"❌ Interface A não encontrada: {row['side_a_device']}:{row['side_a_name']}")
        return False
    
    # Buscar device B
    device_b = get_device_by_name(row['side_b_device'])
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
        'label': row.get('label', ''),
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

def import_cables_from_csv(csv_file: str) -> None:
    """Importa cabos de um arquivo CSV"""
    
    if not os.path.exists(csv_file):
        print(f"❌ Arquivo CSV não encontrado: {csv_file}")
        return
    
    print(f"🚀 Importando cabos do arquivo: {csv_file}")
    
    success_count = 0
    error_count = 0
    
    with open(csv_file, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        
        for row_num, row in enumerate(reader, 1):
            print(f"\n📡 Processando linha {row_num}: {row['side_a_device']}:{row['side_a_name']} -> {row['side_b_device']}:{row['side_b_name']}")
            
            if create_cable_from_csv_row(row):
                success_count += 1
            else:
                error_count += 1
    
    print(f"\n📊 RESUMO DA IMPORTAÇÃO:")
    print(f"✅ Cabos criados com sucesso: {success_count}")
    print(f"❌ Erros: {error_count}")
    print(f"📝 Total processado: {success_count + error_count}")

def generate_csv_template(rack_number: int, output_file: str = None) -> None:
    """Gera template CSV para um rack específico"""
    
    if not output_file:
        output_file = f"rack{rack_number:02d}_cables.csv"
    
    # Configuração padrão para o rack
    servers = [f"SRV-{rack_number:03d}-{i:03d}" for i in range(1, 19)]  # 18 servidores
    switches_lo = [f"SWT-{rack_number:03d}-001", f"SWT-{rack_number:03d}-002"]  # Switches LO
    switches_ld = [f"SWT-{rack_number:03d}-003", f"SWT-{rack_number:03d}-004"]  # Switches LD
    
    cables = []
    
    # Cabos de gerenciamento (IDRAC)
    for i, server in enumerate(servers):
        if i < 10:  # Primeiros 10 servidores no switch LO 1
            switch = switches_lo[0]
            port = f"0/{25 + i}"
        else:  # Últimos 8 servidores no switch LO 2
            switch = switches_lo[1]
            port = f"0/{25 + (i - 10)}"
        
        cables.append({
            'side_a_device': server,
            'side_a_type': 'dcim.interface',
            'side_a_name': 'IDRAC',
            'side_b_name': port,
            'side_b_type': 'dcim.interface',
            'side_b_device': switch,
            'status': 'connected',
            'label': f'MGMT-{server}-IDRAC'
        })
    
    # Cabos de rede - SLOT-0-NIC1 (primeira interface de rede)
    for i, server in enumerate(servers):
        if i < 10:  # Primeiros 10 servidores
            switch_a = switches_lo[0]
            switch_b = switches_lo[1]
            port_a = f"0/{1 + i}"
            port_b = f"0/{1 + i}"
        else:  # Últimos 8 servidores
            switch_a = switches_lo[0]
            switch_b = switches_lo[1]
            port_a = f"0/{1 + i}"
            port_b = f"0/{1 + i}"
        
        # Primeira interface de rede
        cables.append({
            'side_a_device': server,
            'side_a_type': 'dcim.interface',
            'side_a_name': 'SLOT-0-NIC1-1',
            'side_b_name': port_a,
            'side_b_type': 'dcim.interface',
            'side_b_device': switch_a,
            'status': 'connected',
            'label': f'NET-{server}-SLOT-0-NIC1-1'
        })
        
        # Segunda interface de rede
        cables.append({
            'side_a_device': server,
            'side_a_type': 'dcim.interface',
            'side_a_name': 'SLOT-0-NIC1-2',
            'side_b_name': port_b,
            'side_b_type': 'dcim.interface',
            'side_b_device': switch_b,
            'status': 'connected',
            'label': f'NET-{server}-SLOT-0-NIC1-2'
        })
    
    # Cabos de rede - SLOT-6-NIC1 (segunda interface de rede)
    for i, server in enumerate(servers):
        if i < 10:  # Primeiros 10 servidores
            switch_a = switches_ld[0]
            switch_b = switches_ld[1]
            port_a = f"0/{1 + i}"
            port_b = f"0/{1 + i}"
        else:  # Últimos 8 servidores
            switch_a = switches_ld[0]
            switch_b = switches_ld[1]
            port_a = f"0/{1 + i}"
            port_b = f"0/{1 + i}"
        
        # Primeira interface SLOT-6
        cables.append({
            'side_a_device': server,
            'side_a_type': 'dcim.interface',
            'side_a_name': 'SLOT-6-NIC1-1',
            'side_b_name': port_a,
            'side_b_type': 'dcim.interface',
            'side_b_device': switch_a,
            'status': 'connected',
            'label': f'NET-{server}-SLOT-6-NIC1-1'
        })
        
        # Segunda interface SLOT-6
        cables.append({
            'side_a_device': server,
            'side_a_type': 'dcim.interface',
            'side_a_name': 'SLOT-6-NIC1-2',
            'side_b_name': port_b,
            'side_b_type': 'dcim.interface',
            'side_b_device': switch_b,
            'status': 'connected',
            'label': f'NET-{server}-SLOT-6-NIC1-2'
        })
    
    # Salvar CSV
    with open(output_file, 'w', newline='', encoding='utf-8') as f:
        fieldnames = ['side_a_device', 'side_a_type', 'side_a_name', 'side_b_name', 'side_b_type', 'side_b_device', 'status', 'label']
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        
        writer.writeheader()
        writer.writerows(cables)
    
    print(f"✅ Template CSV gerado: {output_file}")
    print(f"📊 Total de cabos: {len(cables)}")
    print(f"   - Cabos de gerenciamento: {len(servers)}")
    print(f"   - Cabos de rede SLOT-0: {len(servers) * 2}")
    print(f"   - Cabos de rede SLOT-6: {len(servers) * 2}")

def main():
    parser = argparse.ArgumentParser(description='Importador de cabos CSV para Netbox')
    parser.add_argument('action', choices=['import', 'generate'], help='Ação a executar')
    parser.add_argument('--file', '-f', help='Arquivo CSV para importar ou gerar')
    parser.add_argument('--rack', '-r', type=int, help='Número do rack (para gerar template)')
    
    args = parser.parse_args()
    
    if not NETBOX_TOKEN:
        print("❌ Erro: NETBOX_API_TOKEN não configurado")
        print("Configure a variável de ambiente: export NETBOX_API_TOKEN='seu_token'")
        return
    
    if args.action == 'import':
        if not args.file:
            print("❌ Erro: --file é obrigatório para import")
            return
        import_cables_from_csv(args.file)
    
    elif args.action == 'generate':
        if not args.rack:
            print("❌ Erro: --rack é obrigatório para generate")
            return
        generate_csv_template(args.rack, args.file)

if __name__ == "__main__":
    main()
