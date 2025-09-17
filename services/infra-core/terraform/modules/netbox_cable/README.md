# Módulo Netbox Cable

Este módulo Terraform cria e gerencia cabos no Netbox.

## Recursos

- Criação de cabos com múltiplas terminações A e B
- Suporte a diferentes tipos de cabo
- Configuração de comprimento e unidade de medida
- Aplicação de tags e tenant
- Configuração de status e cor

## Uso

### Exemplo Básico

```hcl
module "cable_example" {
  source = "./modules/netbox_cable"
  
  a_terminations = [
    {
      object_type = "dcim.consoleserverport"
      object_id   = 123
    }
  ]
  
  b_terminations = [
    {
      object_type = "dcim.consoleport"
      object_id   = 456
    }
  ]
  
  status = "connected"
  label  = "KVM Cable"
  tags   = ["management", "kvm"]
}
```

### Exemplo com Múltiplas Terminações

```hcl
module "cable_kvm" {
  source = "./modules/netbox_cable"
  
  a_terminations = [
    {
      object_type = "dcim.consoleserverport"
      object_id   = netbox_device_console_server_port.kvm1.id
    },
    {
      object_type = "dcim.consoleserverport"
      object_id   = netbox_device_console_server_port.kvm2.id
    }
  ]
  
  b_terminations = [
    {
      object_type = "dcim.consoleport"
      object_id   = netbox_device_console_port.server1.id
    },
    {
      object_type = "dcim.consoleport"
      object_id   = netbox_device_console_port.server2.id
    }
  ]
  
  status    = "connected"
  label     = "KVM Cable Bundle"
  type      = "cat6"
  length    = 5
  length_unit = "m"
  tags      = ["management", "kvm", "console"]
  tenant_id = 1
}
```

## Variáveis

| Nome | Descrição | Tipo | Padrão | Obrigatório |
|------|-----------|------|--------|-------------|
| a_terminations | Lista de terminações A do cabo | `list(object)` | `[]` | Não |
| b_terminations | Lista de terminações B do cabo | `list(object)` | `[]` | Não |
| status | Status do cabo | `string` | `"connected"` | Não |
| label | Rótulo do cabo | `string` | `""` | Não |
| tags | Lista de tags | `list(string)` | `[]` | Não |
| tenant_id | ID do tenant | `number` | `null` | Não |
| type | Tipo do cabo | `string` | `null` | Não |
| length | Comprimento do cabo | `number` | `null` | Não |
| length_unit | Unidade de medida | `string` | `"m"` | Não |

### Tipos de Cabo Suportados

- **Ethernet**: `cat3`, `cat5`, `cat5e`, `cat6`, `cat6a`, `cat7`, `cat7a`, `cat8`
- **DAC**: `dac-active`, `dac-passive`
- **Coaxial**: `coaxial`
- **Fibra Multimodo**: `mmf`, `mmf-om1`, `mmf-om2`, `mmf-om3`, `mmf-om4`, `mmf-om5`
- **Fibra Monomodo**: `smf`, `smf-os1`, `smf-os2`
- **AOC**: `aoc`
- **Energia**: `power`

### Status Suportados

- `connected` - Conectado
- `planned` - Planejado
- `deprecated` - Descontinuado

### Unidades de Medida

- `m` - Metros
- `cm` - Centímetros
- `ft` - Pés
- `in` - Polegadas

## Outputs

| Nome | Descrição |
|------|-----------|
| id | ID do cabo no Netbox |
| status | Status do cabo |
| label | Rótulo do cabo |
| tags | Tags do cabo |
| tenant_id | ID do tenant |
| type | Tipo do cabo |
| length | Comprimento do cabo |
| length_unit | Unidade de medida |
| a_terminations | Terminações A |
| b_terminations | Terminações B |

## Tipos de Objeto Suportados

### Terminações A e B

- `dcim.consoleport`
- `dcim.consoleserverport`
- `dcim.frontport`
- `dcim.interface`
- `dcim.powerfeed`
- `dcim.poweroutlet`
- `dcim.powerport`
- `dcim.rearport`
- `circuits.circuittermination`
- `dcim.cable`

## Dependências

- Provider Netbox `e-breuninger/netbox` versão `~> 3.0`
- Terraform versão `>= 1.0`
