# Outputs dos Racks Globais
# Este arquivo expõe informações sobre os racks e devices

# ====== RACKS ======

output "racks" {
  description = "Informações dos racks criados"
  value = {
    for k, v in netbox_rack.racks : k => {
      id   = v.id
      name = v.name
    }
  }
}

output "rack03_id" {
  description = "ID do RACK03"
  value       = netbox_rack.racks[3].id
}

# ====== RACK03 DEVICES ======

# ====== SERVIDORES ======

# Servidores Balanced
output "servers_balanced" {
  description = "IDs dos servidores Balanced"
  value = {
    srv_003_001 = module.device_srv_003_001.id
    srv_003_003 = module.device_srv_003_003.id
    srv_003_004 = module.device_srv_003_004.id
    srv_003_005 = module.device_srv_003_005.id
    srv_003_006 = module.device_srv_003_006.id
    srv_003_007 = module.device_srv_003_007.id
    srv_003_008 = module.device_srv_003_008.id
    srv_003_009 = module.device_srv_003_009.id
  }
}

# Servidores Performance
output "servers_performance" {
  description = "IDs dos servidores Performance"
  value = {
    srv_003_002 = module.device_srv_003_002.id
    srv_003_012 = module.device_srv_003_012.id
    srv_003_013 = module.device_srv_003_013.id
    srv_003_014 = module.device_srv_003_014.id
    srv_003_015 = module.device_srv_003_015.id
    srv_003_016 = module.device_srv_003_016.id
    srv_003_017 = module.device_srv_003_017.id
    srv_003_018 = module.device_srv_003_018.id
  }
}

# Servidores GPU
output "servers_gpu" {
  description = "IDs dos servidores GPU"
  value = {
    srv_003_010 = module.device_srv_003_010.id
    srv_003_011 = module.device_srv_003_011.id
  }
}

# ====== SWITCHES ======

# Switches N3248TE
output "switches_n3248te" {
  description = "IDs dos switches N3248TE"
  value = {
    swt_003_001 = module.device_swt_003_001.id
    swt_003_002 = module.device_swt_003_002.id
  }
}

# Switches S5248F
output "switches_s5248f" {
  description = "IDs dos switches S5248F"
  value = {
    swt_003_003 = module.device_swt_003_003.id
    swt_003_004 = module.device_swt_003_004.id
  }
}

# ====== RESUMO ======

output "rack03_summary" {
  description = "Resumo do RACK03"
  value = {
    total_servers = 18
    total_switches = 4
    servers_balanced = 8
    servers_performance = 8
    servers_gpu = 2
    switches_n3248te = 2
    switches_s5248f = 2
  }
}
