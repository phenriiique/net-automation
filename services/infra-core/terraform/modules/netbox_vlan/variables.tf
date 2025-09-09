variable "name" {
  description = "Nome da VLAN"
  type        = string
}

variable "vid" {
  description = "VLAN ID (número da VLAN)"
  type        = number
}

variable "status" {
  description = "Status da VLAN (active, reserved, deprecated)"
  type        = string
  default     = "active"
  
  validation {
    condition     = contains(["active", "reserved", "deprecated"], var.status)
    error_message = "Status must be one of: active, reserved, deprecated."
  }
}

variable "description" {
  description = "Descrição da VLAN"
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "ID do tenant no Netbox"
  type        = number
  default     = null
}

variable "site_id" {
  description = "ID do site no Netbox"
  type        = number
  default     = null
}

variable "group_id" {
  description = "ID do VLAN group no Netbox"
  type        = number
  default     = null
}

variable "tags" {
  description = "Lista de nomes das tags do Netbox"
  type        = list(string)
  default     = []
}
