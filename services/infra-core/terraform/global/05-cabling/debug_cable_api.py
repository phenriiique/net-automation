#!/usr/bin/env python3
"""
Script de diagnóstico para problemas na API de cabos do Netbox
"""

import os
import requests
import json
from typing import Dict, Any

# Configuração do Netbox
NETBOX_URL = os.getenv('NETBOX_SERVER_URL', 'http://localhost:8000')
NETBOX_TOKEN = os.getenv('NETBOX_API_TOKEN', '')

# Headers para autenticação
headers = {
    'Authorization': f'Token {NETBOX_TOKEN}',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
}

def test_netbox_connection():
    """Testa conexão básica com o Netbox"""
    print("🔍 Testando conexão com Netbox...")
    
    try:
        response = requests.get(f"{NETBOX_URL}/api/", headers=headers)
        response.raise_for_status()
        print(f"✅ Conexão OK: {response.status_code}")
        return True
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro de conexão: {e}")
        return False

def test_cable_endpoint():
    """Testa endpoint de cabos"""
    print("\n🔍 Testando endpoint de cabos...")
    
    try:
        response = requests.get(f"{NETBOX_URL}/api/dcim/cables/", headers=headers)
        print(f"📊 Status: {response.status_code}")
        
        if response.status_code == 200:
            data = response.json()
            print(f"✅ Endpoint OK - Total de cabos: {data.get('count', 0)}")
            return True
        else:
            print(f"❌ Erro no endpoint: {response.text}")
            return False
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao acessar endpoint: {e}")
        return False

def find_device_by_name(device_name: str) -> Dict[str, Any]:
    """Busca device por nome"""
    print(f"\n🔍 Buscando device: {device_name}")
    
    try:
        response = requests.get(f"{NETBOX_URL}/api/dcim/devices/", 
                              headers=headers, 
                              params={'name': device_name})
        response.raise_for_status()
        
        results = response.json()['results']
        if results:
            device = results[0]
            print(f"✅ Device encontrado: {device['name']} (ID: {device['id']})")
            return device
        else:
            print(f"❌ Device não encontrado: {device_name}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao buscar device: {e}")
        return None

def find_interface_by_name(device_id: int, interface_name: str) -> Dict[str, Any]:
    """Busca interface por nome em um device"""
    print(f"🔍 Buscando interface: {interface_name} no device ID {device_id}")
    
    try:
        response = requests.get(f"{NETBOX_URL}/api/dcim/interfaces/", 
                              headers=headers, 
                              params={'device_id': device_id, 'name': interface_name})
        response.raise_for_status()
        
        results = response.json()['results']
        if results:
            interface = results[0]
            print(f"✅ Interface encontrada: {interface['name']} (ID: {interface['id']})")
            return interface
        else:
            print(f"❌ Interface não encontrada: {interface_name}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao buscar interface: {e}")
        return None

def test_cable_creation():
    """Testa criação de cabo com dados de exemplo"""
    print("\n🔍 Testando criação de cabo...")
    
    # Buscar devices de exemplo
    device_a = find_device_by_name("SRV-003-001")
    if not device_a:
        print("❌ Não é possível testar - device A não encontrado")
        return False
    
    device_b = find_device_by_name("SWT-003-001")
    if not device_b:
        print("❌ Não é possível testar - device B não encontrado")
        return False
    
    # Buscar interfaces de exemplo
    interface_a = find_interface_by_name(device_a['id'], "IDRAC")
    if not interface_a:
        print("❌ Não é possível testar - interface A não encontrada")
        return False
    
    interface_b = find_interface_by_name(device_b['id'], "0/25")
    if not interface_b:
        print("❌ Não é possível testar - interface B não encontrada")
        return False
    
    # Testar criação de cabo
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
        'status': 'connected',
        'label': 'TEST-CABLE-DEBUG',
        # 'tags': ['iac_network']  # Tag removida temporariamente
    }
    
    print(f"\n🔍 Tentando criar cabo com dados:")
    print(json.dumps(cable_data, indent=2))
    
    try:
        response = requests.post(f"{NETBOX_URL}/api/dcim/cables/", 
                               headers=headers, 
                               json=cable_data)
        
        print(f"📊 Status: {response.status_code}")
        
        if response.status_code == 201:
            cable = response.json()
            print(f"✅ Cabo criado com sucesso! ID: {cable['id']}")
            return True
        else:
            print(f"❌ Erro ao criar cabo:")
            print(f"Status: {response.status_code}")
            print(f"Resposta: {response.text}")
            return False
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro na requisição: {e}")
        return False

def check_cable_permissions():
    """Verifica permissões para criar cabos"""
    print("\n🔍 Verificando permissões...")
    
    try:
        # Tentar acessar endpoint de cabos
        response = requests.get(f"{NETBOX_URL}/api/dcim/cables/", headers=headers)
        
        if response.status_code == 200:
            print("✅ Permissão de leitura: OK")
        else:
            print(f"❌ Permissão de leitura: {response.status_code}")
            return False
        
        # Verificar se pode fazer POST (sem dados)
        response = requests.post(f"{NETBOX_URL}/api/dcim/cables/", 
                               headers=headers, 
                               json={})
        
        if response.status_code in [400, 405]:  # 400 = bad request (esperado), 405 = method not allowed
            print("✅ Permissão de escrita: OK")
            return True
        elif response.status_code == 403:
            print("❌ Permissão de escrita: NEGADA")
            return False
        else:
            print(f"⚠️  Status inesperado: {response.status_code}")
            return True
            
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro ao verificar permissões: {e}")
        return False

def main():
    print("🚀 Diagnóstico da API de Cabos do Netbox")
    print("=" * 50)
    
    if not NETBOX_TOKEN:
        print("❌ Erro: NETBOX_API_TOKEN não configurado")
        print("Configure a variável de ambiente: export NETBOX_API_TOKEN='seu_token'")
        return
    
    print(f"🌐 Netbox URL: {NETBOX_URL}")
    print(f"🔑 Token configurado: {'Sim' if NETBOX_TOKEN else 'Não'}")
    
    # Testes sequenciais
    if not test_netbox_connection():
        return
    
    if not test_cable_endpoint():
        return
    
    if not check_cable_permissions():
        return
    
    test_cable_creation()
    
    print("\n" + "=" * 50)
    print("🎯 Diagnóstico concluído!")

if __name__ == "__main__":
    main()
