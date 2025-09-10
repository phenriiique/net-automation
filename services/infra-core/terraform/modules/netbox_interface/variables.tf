variable "name" {
  description = "Nome da interface"
  type        = string
}

variable "device_id" {
  description = "ID do device ao qual a interface pertence"
  type        = number
}

variable "type" {
  description = "Tipo da interface (1000base-t, 10gbase-t, etc.)"
  type        = string
  default     = "1000base-t"
}

variable "enabled" {
  description = "Se a interface está habilitada"
  type        = bool
  default     = true
}


variable "description" {
  description = "Descrição da interface"
  type        = string
  default     = ""
}

variable "mode" {
  description = "Modo da interface (access, tagged, tagged-all)"
  type        = string
  default     = "access"
  
  validation {
    condition     = contains(["access", "tagged", "tagged-all"], var.mode)
    error_message = "Mode must be one of: access, tagged, tagged-all."
  }
}

variable "untagged_vlan" {
  description = "ID da VLAN não marcada"
  type        = number
  default     = null
}

variable "tagged_vlans" {
  description = "Lista de IDs das VLANs marcadas"
  type        = list(number)
  default     = []
}

variable "tags" {
  description = "Lista de tags para a interface"
  type        = list(string)
  default     = []
}
