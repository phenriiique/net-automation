#!/usr/bin/env python3
"""
Script inteligente para gerar cabos baseado em dados reais do Netbox
Coleta automaticamente os nomes dos servidores e switches de cada rack
"""

import os
import csv
import requests
import json
import argparse
import yaml
from typing import Dict, List, Any, Optional

# Configuração do Netbox
NETBOX_URL = os.getenv('NETBOX_SERVER_URL', 'http://localhost:8000')
NETBOX_TOKEN = os.getenv('NETBOX_API_TOKEN', '')

# Headers para autenticação
headers = {
    'Authorization': f'Token {NETBOX_TOKEN}',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
}

def load_server_interface_model(yaml_file: str = "server-interface-model.yaml") -> Dict[str, Any]:
    """Carrega o modelo de interfaces dos servidores do arquivo YAML"""
    
    try:
        with open(yaml_file, 'r', encoding='utf-8') as f:
            model = yaml.safe_load(f)
        
        print(f"✅ Modelo de interfaces carregado: {yaml_file}")
        return model
        
    except FileNotFoundError:
        print(f"❌ Arquivo {yaml_file} não encontrado")
        return {}
    except yaml.YAMLError as e:
        print(f"❌ Erro ao ler arquivo YAML: {e}")
        return {}

def get_server_model_name(device_type: dict) -> str:
    """Extrai o slug do modelo do device type"""
    
    # Obter o slug do device type
    slug = device_type.get('slug', '').lower()
    
    # Mapear slugs conhecidos para os modelos do YAML
    model_mapping = {
        'dell-r750-srv009-balanced': 'dell-r750-srv009-balanced',
        'dell-r750-srv00a-gpu-l40': 'dell-r750-srv00a-gpu-l40',
        'dell-r750-srv013-performance': 'dell-r750-srv013-performance',
    }
    
    # Buscar correspondência exata
    if slug in model_mapping:
        return model_mapping[slug]
    
    # Se não encontrar, tentar extrair do slug
    if 'r750' in slug:
        if 'gpu' in slug or 'l40' in slug:
            return 'dell-r750-srv00a-gpu-l40'
        elif 'performance' in slug or 'srv013' in slug:
            return 'dell-r750-srv013-performance'
        elif 'balanced' in slug or 'srv009' in slug:
            return 'dell-r750-srv009-balanced'
    
    return 'dell-r750-srv009-balanced'  # fallback padrão

def get_rack_devices(rack_name: str, tenant_name: str = None) -> Dict[str, List[Dict[str, Any]]]:
    """Coleta todos os devices de um rack específico do Netbox"""
    
    print(f"🔍 Coletando devices do rack: {rack_name}" + (f" (tenant: {tenant_name})" if tenant_name else ""))
    
    # Buscar o rack por nome e tenant
    rack_url = f"{NETBOX_URL}/api/dcim/racks/"
    rack_params = {'name': rack_name}
    
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
                return {'servers': [], 'switches': []}
            
            tenant_id = tenant_results[0]['id']
            rack_params['tenant_id'] = tenant_id
            print(f"✅ Tenant encontrado: {tenant_name} (ID: {tenant_id})")
            
        except requests.exceptions.RequestException as e:
            print(f"❌ Erro ao buscar tenant '{tenant_name}': {e}")
            return {'servers': [], 'switches': []}
    
    try:
        rack_response = requests.get(rack_url, headers=headers, params=rack_params)
        rack_response.raise_for_status()
        rack_results = rack_response.json()['results']
        
        if not rack_results:
            print(f"❌ Rack '{rack_name}' não encontrado")
            return {'servers': [], 'switches': []}
        
        rack_id = rack_results[0]['id']
        print(f"✅ Rack encontrado: {rack_name} (ID: {rack_id})")
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao buscar rack '{rack_name}': {e}")
        return {'servers': [], 'switches': []}
    
    # Buscar devices no rack
    devices_url = f"{NETBOX_URL}/api/dcim/devices/"
    devices_params = {'rack_id': rack_id}
    
    try:
        devices_response = requests.get(devices_url, headers=headers, params=devices_params)
        devices_response.raise_for_status()
        devices_results = devices_response.json()['results']
        
        print(f"📊 Total de devices encontrados: {len(devices_results)}")
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao buscar devices do rack: {e}")
        return {'servers': [], 'switches': []}
    
    # Separar servidores e switches
    servers = []
    switches = []
    
    for device in devices_results:
        device_name = device['name']
        device_type = device.get('device_type', {})
        device_type_name = device_type.get('model', '').lower()
        device_type_slug = device_type.get('slug', '').lower()
        
        # Identificar tipo de device baseado no device type (não no nome)
        if ('server' in device_type_name or 'r750' in device_type_name or 
            'server' in device_type_slug or 'r750' in device_type_slug):
            model_name = get_server_model_name(device_type)
            servers.append({
                'id': device['id'],
                'name': device_name,
                'position': device.get('position'),
                'face': device.get('face'),
                'device_type': device_type.get('model', 'Unknown'),
                'device_type_slug': device_type.get('slug', 'Unknown'),
                'model_name': model_name
            })
        elif ('switch' in device_type_name or 'n3248' in device_type_name or 's5248' in device_type_name or
              'switch' in device_type_slug or 'n3248' in device_type_slug or 's5248' in device_type_slug):
            switches.append({
                'id': device['id'],
                'name': device_name,
                'position': device.get('position'),
                'face': device.get('face'),
                'device_type': device_type.get('model', 'Unknown'),
                'device_type_slug': device_type.get('slug', 'Unknown')
            })
    
    # Ordenar por posição no rack
    servers.sort(key=lambda x: x['position'] or 0)
    switches.sort(key=lambda x: x['position'] or 0)
    
    print(f"🖥️  Servidores encontrados: {len(servers)}")
    for server in servers:
        print(f"   - {server['name']} (posição: {server['position']}, tipo: {server['device_type']})")
    
    print(f"🔌 Switches encontrados: {len(switches)}")
    for switch in switches:
        print(f"   - {switch['name']} (posição: {switch['position']}, tipo: {switch['device_type']})")
    
    return {'servers': servers, 'switches': switches}

def get_device_interfaces(device_id: int, device_name: str) -> List[Dict[str, Any]]:
    """Coleta interfaces de um device específico"""
    
    interfaces_url = f"{NETBOX_URL}/api/dcim/interfaces/"
    interfaces_params = {'device_id': device_id}
    
    try:
        interfaces_response = requests.get(interfaces_url, headers=headers, params=interfaces_params)
        interfaces_response.raise_for_status()
        interfaces_results = interfaces_response.json()['results']
        
        return interfaces_results
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao buscar interfaces do device {device_name}: {e}")
        return []

def generate_cables_for_rack(rack_name: str, devices: Dict[str, List[Dict[str, Any]]], interface_model: Dict[str, Any]) -> List[Dict[str, str]]:
    """Gera cabos para um rack baseado nos devices reais coletados"""
    
    servers = devices['servers']
    switches = devices['switches']
    
    if not servers:
        print(f"⚠️  Nenhum servidor encontrado no rack {rack_name}")
        return []
    
    if not switches:
        print(f"⚠️  Nenhum switch encontrado no rack {rack_name}")
        return []
    
    cables = []
    
    # Separar switches por tipo (assumindo padrão: LO = switches 1-2, LD = switches 3-4)
    # Ordenar switches por posição no rack (maior para menor)
    switches_sorted = sorted(switches, key=lambda x: x['position'] or 0, reverse=True)
    
    # LO = switches 1-2 (posições maiores - 28, 26)
    switches_lo = switches_sorted[:2] if len(switches_sorted) >= 2 else switches_sorted
    # LD = switches 3-4 (posições menores - 24, 22)  
    switches_ld = switches_sorted[2:4] if len(switches_sorted) >= 4 else switches_sorted[2:] if len(switches_sorted) > 2 else []
    
    print(f"🔌 Switches LO: {[s['name'] for s in switches_lo]}")
    if switches_ld:
        print(f"🔌 Switches LD: {[s['name'] for s in switches_ld]}")
    
    # 1. CABOS DE GERENCIAMENTO (BMC)
    print(f"🔍 Gerando cabos de gerenciamento...")
    
    for i, server in enumerate(servers):
        # Obter modelo do servidor
        model_name = server.get('model_name', 'dell-r750-srv009-balanced')
        
        # Verificar se o modelo existe no YAML
        if model_name not in interface_model:
            print(f"⚠️  Modelo {model_name} não encontrado no arquivo YAML")
            continue
        
        # Obter interfaces de gerenciamento do modelo
        bmc_interfaces = interface_model[model_name].get('bmc', {})
        if not bmc_interfaces:
            print(f"⚠️  Nenhuma interface BMC definida para o modelo {model_name}")
            continue
        
        # Determinar switch de gerenciamento baseado na posição no rack (alterna a cada 5 servidores)
        if switches_lo and len(switches_lo) >= 2:
            # Usar índice sequencial do servidor (não a posição no rack)
            server_index = i  # Índice sequencial do servidor no array
            switch_index = (server_index // 5) % 2
            mgmt_switch = switches_lo[switch_index]
            # Porta baseada no grupo e posição dentro do grupo
            group_number = server_index // 5
            group_position = server_index % 5
            if group_number == 0:  # Primeiro grupo (0-4)
                port_offset = 25 + group_position
            elif group_number == 1:  # Segundo grupo (5-9)
                port_offset = 25 + group_position
            elif group_number == 2:  # Terceiro grupo (10-14)
                port_offset = 30 + group_position
            else:  # Quarto grupo e seguintes (15+)
                port_offset = 30 + group_position
        elif switches_lo:
            mgmt_switch = switches_lo[0]
            port_offset = 25 + i
        else:
            continue
        
        # Verificar se a interface BMC existe no servidor
        server_interfaces = get_device_interfaces(server['id'], server['name'])
        bmc_interface = None
        
        for bmc_interface_name in bmc_interfaces.keys():
            for interface in server_interfaces:
                if interface['name'] == bmc_interface_name:
                    bmc_interface = interface
                    break
            if bmc_interface:
                break
        
        if not bmc_interface:
            print(f"⚠️  Interface BMC não encontrada no servidor {server['name']}")
            continue
        
        # Verificar se a porta existe no switch
        switch_interfaces = get_device_interfaces(mgmt_switch['id'], mgmt_switch['name'])
        target_port = None
        
        for interface in switch_interfaces:
            if interface['name'] == f"0/{port_offset}":
                target_port = interface
                break
        
        if not target_port:
            print(f"⚠️  Porta 0/{port_offset} não encontrada no switch {mgmt_switch['name']}")
            continue
        
        cables.append({
            'side_a_device': server['name'],
            'side_a_type': 'dcim.interface',
            'side_a_name': bmc_interface['name'],
            'side_b_name': target_port['name'],
            'side_b_type': 'dcim.interface',
            'side_b_device': mgmt_switch['name'],
            'status': 'connected'
        })
    
    # 2. CABOS DE REDE - OAM (SLOT-0-NIC1)
    print(f"🔍 Gerando cabos de rede OAM...")
    
    for i, server in enumerate(servers):
        # Obter modelo do servidor
        model_name = server.get('model_name', 'dell-r750-srv009-balanced')
        
        # Verificar se o modelo existe no YAML
        if model_name not in interface_model:
            print(f"⚠️  Modelo {model_name} não encontrado no arquivo YAML")
            continue
        
        # Obter interfaces OAM do modelo
        oam_interfaces = interface_model[model_name].get('oam', {})
        if not oam_interfaces:
            print(f"⚠️  Nenhuma interface OAM definida para o modelo {model_name}")
            continue
        
        # Verificar interfaces OAM no servidor
        server_interfaces = get_device_interfaces(server['id'], server['name'])
        oam_interface_list = []
        
        for oam_interface_name in oam_interfaces.keys():
            for interface in server_interfaces:
                if interface['name'] == oam_interface_name:
                    oam_interface_list.append(interface)
                    break
        
        if len(oam_interface_list) < 2:
            print(f"⚠️  Interfaces OAM insuficientes no servidor {server['name']}")
            continue
        
        # Usar índice sequencial do servidor para determinar porta
        server_index = i + 1  # Índice sequencial (1, 2, 3, 4...)
        
        # Conectar primeira interface OAM ao primeiro switch LO
        if switches_lo:
            switch_interfaces = get_device_interfaces(switches_lo[0]['id'], switches_lo[0]['name'])
            target_port = None
            
            for interface in switch_interfaces:
                if interface['name'] == f"0/{server_index}":
                    target_port = interface
                    break
            
            if target_port:
                cables.append({
                    'side_a_device': server['name'],
                    'side_a_type': 'dcim.interface',
                    'side_a_name': oam_interface_list[0]['name'],
                    'side_b_name': target_port['name'],
                    'side_b_type': 'dcim.interface',
                    'side_b_device': switches_lo[0]['name'],
                    'status': 'connected'
                })
        
        # Conectar segunda interface OAM ao segundo switch LO
        if len(switches_lo) > 1:
            switch_interfaces = get_device_interfaces(switches_lo[1]['id'], switches_lo[1]['name'])
            target_port = None
            
            for interface in switch_interfaces:
                if interface['name'] == f"0/{server_index}":
                    target_port = interface
                    break
            
            if target_port:
                cables.append({
                    'side_a_device': server['name'],
                    'side_a_type': 'dcim.interface',
                    'side_a_name': oam_interface_list[1]['name'],
                    'side_b_name': target_port['name'],
                    'side_b_type': 'dcim.interface',
                    'side_b_device': switches_lo[1]['name'],
                    'status': 'connected'
                })
    
    # 3. CABOS DE REDE - DADOS (DATA1 e DATA2) (se switches LD existirem)
    if switches_ld:
        print(f"🔍 Gerando cabos de rede de dados...")
        
        port_counter = 1  # Contador de portas sequenciais
        
        for i, server in enumerate(servers):
            # Obter modelo do servidor
            model_name = server.get('model_name', 'dell-r750-srv009-balanced')
            
            # Verificar se o modelo existe no YAML
            if model_name not in interface_model:
                print(f"⚠️  Modelo {model_name} não encontrado no arquivo YAML")
                continue
            
            # Obter interfaces de dados do modelo
            data1_interfaces = interface_model[model_name].get('data1', {})
            data2_interfaces = interface_model[model_name].get('data2', {})
            
            # Verificar interfaces de dados no servidor
            server_interfaces = get_device_interfaces(server['id'], server['name'])
            
            # Processar DATA1 se existir
            if data1_interfaces:
                data1_interface_list = []
                for data1_interface_name in data1_interfaces.keys():
                    for interface in server_interfaces:
                        if interface['name'] == data1_interface_name:
                            data1_interface_list.append(interface)
                            break
                
                if len(data1_interface_list) >= 2:
                    # Conectar primeira interface DATA1 ao primeiro switch LD
                    switch_interfaces = get_device_interfaces(switches_ld[0]['id'], switches_ld[0]['name'])
                    target_port = None
                    
                    for interface in switch_interfaces:
                        if interface['name'] == f"0/{port_counter}":
                            target_port = interface
                            break
                    
                    if target_port:
                        cables.append({
                            'side_a_device': server['name'],
                            'side_a_type': 'dcim.interface',
                            'side_a_name': data1_interface_list[0]['name'],
                            'side_b_name': target_port['name'],
                            'side_b_type': 'dcim.interface',
                            'side_b_device': switches_ld[0]['name'],
                            'status': 'connected'
                        })
                    
                    # Conectar segunda interface DATA1 ao segundo switch LD
                    if len(switches_ld) > 1:
                        switch_interfaces = get_device_interfaces(switches_ld[1]['id'], switches_ld[1]['name'])
                        target_port = None
                        
                        for interface in switch_interfaces:
                            if interface['name'] == f"0/{port_counter}":
                                target_port = interface
                                break
                        
                        if target_port:
                            cables.append({
                                'side_a_device': server['name'],
                                'side_a_type': 'dcim.interface',
                                'side_a_name': data1_interface_list[1]['name'],
                                'side_b_name': target_port['name'],
                                'side_b_type': 'dcim.interface',
                                'side_b_device': switches_ld[1]['name'],
                                'status': 'connected'
                            })
                    
                    port_counter += 1
            
            # Processar DATA2 se existir
            if data2_interfaces:
                data2_interface_list = []
                for data2_interface_name in data2_interfaces.keys():
                    for interface in server_interfaces:
                        if interface['name'] == data2_interface_name:
                            data2_interface_list.append(interface)
                            break
                
                if len(data2_interface_list) >= 2:
                    # Conectar primeira interface DATA2 ao primeiro switch LD
                    switch_interfaces = get_device_interfaces(switches_ld[0]['id'], switches_ld[0]['name'])
                    target_port = None
                    
                    for interface in switch_interfaces:
                        if interface['name'] == f"0/{port_counter}":
                            target_port = interface
                            break
                    
                    if target_port:
                        cables.append({
                            'side_a_device': server['name'],
                            'side_a_type': 'dcim.interface',
                            'side_a_name': data2_interface_list[0]['name'],
                            'side_b_name': target_port['name'],
                            'side_b_type': 'dcim.interface',
                            'side_b_device': switches_ld[0]['name'],
                            'status': 'connected'
                        })
                    
                    # Conectar segunda interface DATA2 ao segundo switch LD
                    if len(switches_ld) > 1:
                        switch_interfaces = get_device_interfaces(switches_ld[1]['id'], switches_ld[1]['name'])
                        target_port = None
                        
                        for interface in switch_interfaces:
                            if interface['name'] == f"0/{port_counter}":
                                target_port = interface
                                break
                        
                        if target_port:
                            cables.append({
                                'side_a_device': server['name'],
                                'side_a_type': 'dcim.interface',
                                'side_a_name': data2_interface_list[1]['name'],
                                'side_b_name': target_port['name'],
                                'side_b_type': 'dcim.interface',
                                'side_b_device': switches_ld[1]['name'],
                                'status': 'connected'
                            })
                    
                    port_counter += 1
    
    return cables

def save_csv_file(cables: List[Dict[str, str]], filename: str) -> None:
    """Salva lista de cabos em arquivo CSV"""
    
    with open(filename, 'w', newline='', encoding='utf-8') as f:
        fieldnames = ['side_a_device', 'side_a_type', 'side_a_name', 'side_b_name', 'side_b_type', 'side_b_device', 'status']
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        
        writer.writeheader()
        writer.writerows(cables)

def process_single_rack(rack_name: str, tenant_name: str = None, output_dir: str = ".") -> None:
    """Processa um rack específico"""
    
    print(f"\n{'='*60}")
    print(f"🚀 PROCESSANDO RACK: {rack_name}" + (f" (TENANT: {tenant_name})" if tenant_name else ""))
    print(f"{'='*60}")
    
    # Carregar modelo de interfaces
    interface_model = load_server_interface_model()
    if not interface_model:
        print(f"❌ Não foi possível carregar o modelo de interfaces")
        return
    
    # Coletar devices do rack
    devices = get_rack_devices(rack_name, tenant_name)
    
    if not devices['servers'] and not devices['switches']:
        print(f"❌ Nenhum device encontrado no rack {rack_name}")
        return
    
    # Gerar cabos
    cables = generate_cables_for_rack(rack_name, devices, interface_model)
    
    if not cables:
        print(f"❌ Nenhum cabo gerado para o rack {rack_name}")
        return
    
    # Salvar CSV
    if tenant_name:
        filename = os.path.join(output_dir, f"{tenant_name.lower()}_{rack_name.lower()}_cables.csv")
    else:
        filename = os.path.join(output_dir, f"{rack_name.lower()}_cables.csv")
    save_csv_file(cables, filename)
    
    # Contar tipos de cabos
    bmc_cables = len([c for c in cables if 'IDRAC' in c['side_a_name'] or 'BMC' in c['side_a_name']])
    oam_cables = len([c for c in cables if 'SLOT-0-NIC1' in c['side_a_name']])
    data1_cables = len([c for c in cables if 'SLOT-6-NIC1' in c['side_a_name']])
    data2_cables = len([c for c in cables if 'SLOT-7-NIC1' in c['side_a_name']])
    
    print(f"\n✅ Rack {rack_name}: {filename}")
    print(f"   📊 Total de cabos: {len(cables)}")
    print(f"   🔌 Cabos de gerenciamento (BMC): {bmc_cables}")
    print(f"   🌐 Cabos de rede OAM: {oam_cables}")
    print(f"   🌐 Cabos de rede DATA1: {data1_cables}")
    print(f"   🌐 Cabos de rede DATA2: {data2_cables}")

def process_multiple_racks(rack_names: List[str], tenant_name: str = None, output_dir: str = ".") -> None:
    """Processa múltiplos racks"""
    
    print(f"🚀 Processando {len(rack_names)} racks..." + (f" (TENANT: {tenant_name})" if tenant_name else ""))
    print(f"📁 Diretório de saída: {output_dir}")
    
    total_cables = 0
    
    for rack_name in rack_names:
        process_single_rack(rack_name, tenant_name, output_dir)
        
        # Contar cabos do arquivo gerado
        if tenant_name:
            filename = os.path.join(output_dir, f"{tenant_name.lower()}_{rack_name.lower()}_cables.csv")
        else:
            filename = os.path.join(output_dir, f"{rack_name.lower()}_cables.csv")
        if os.path.exists(filename):
            with open(filename, 'r') as f:
                cable_count = sum(1 for line in f) - 1  # -1 para o header
            total_cables += cable_count
    
    print(f"\n📊 RESUMO GERAL:")
    print(f"✅ Racks processados: {len(rack_names)}")
    print(f"📊 Total de cabos gerados: {total_cables}")
    print(f"📁 Arquivos salvos em: {output_dir}")

def main():
    parser = argparse.ArgumentParser(description='Gerador inteligente de cabos baseado em dados reais do Netbox')
    parser.add_argument('--rack', '-r', help='Nome do rack específico (ex: RACK03)')
    parser.add_argument('--racks', nargs='+', help='Lista de nomes de racks (ex: RACK03 RACK04 RACK05)')
    parser.add_argument('--tenant', '-t', help='Nome do tenant (ex: SITE-1)')
    parser.add_argument('--output', '-o', default='.', help='Diretório de saída (padrão: diretório atual)')
    parser.add_argument('--list-racks', action='store_true', help='Listar todos os racks disponíveis no Netbox')
    parser.add_argument('--list-tenants', action='store_true', help='Listar todos os tenants disponíveis no Netbox')
    
    args = parser.parse_args()
    
    if not NETBOX_TOKEN:
        print("❌ Erro: NETBOX_API_TOKEN não configurado")
        print("Configure a variável de ambiente: export NETBOX_API_TOKEN='seu_token'")
        return
    
    # Criar diretório de saída se não existir
    if not os.path.exists(args.output):
        os.makedirs(args.output)
    
    if args.list_racks:
        # Listar racks disponíveis
        racks_url = f"{NETBOX_URL}/api/dcim/racks/"
        try:
            racks_response = requests.get(racks_url, headers=headers)
            racks_response.raise_for_status()
            racks_results = racks_response.json()['results']
            
            print("📋 Racks disponíveis no Netbox:")
            for rack in racks_results:
                tenant_info = f" (tenant: {rack.get('tenant', {}).get('name', 'N/A')})" if rack.get('tenant') else " (sem tenant)"
                print(f"   - {rack['name']} (ID: {rack['id']}){tenant_info}")
                
        except requests.exceptions.RequestException as e:
            print(f"❌ Erro ao listar racks: {e}")
        return
    
    if args.list_tenants:
        # Listar tenants disponíveis
        tenants_url = f"{NETBOX_URL}/api/tenancy/tenants/"
        try:
            tenants_response = requests.get(tenants_url, headers=headers)
            tenants_response.raise_for_status()
            tenants_results = tenants_response.json()['results']
            
            print("📋 Tenants disponíveis no Netbox:")
            for tenant in tenants_results:
                print(f"   - {tenant['name']} (ID: {tenant['id']})")
                
        except requests.exceptions.RequestException as e:
            print(f"❌ Erro ao listar tenants: {e}")
        return
    
    if args.rack:
        process_single_rack(args.rack, args.tenant, args.output)
    elif args.racks:
        process_multiple_racks(args.racks, args.tenant, args.output)
    else:
        print("❌ Erro: Especifique --rack ou --racks")
        parser.print_help()

if __name__ == "__main__":
    main()
