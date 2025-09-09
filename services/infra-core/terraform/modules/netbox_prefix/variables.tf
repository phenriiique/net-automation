variable "prefix" {
  description = "O prefixo CIDR a ser criado no NetBox (ex: 10.0.0.0/24)"
  type        = string
}

variable "status" {
  description = "Status do prefixo (active, reserved, deprecated, container)"
  type        = string
  default     = "active"
  
  validation {
    condition     = contains(["active", "reserved", "deprecated", "container"], var.status)
    error_message = "Status must be one of: active, reserved, deprecated, container."
  }
}

variable "description" {
  description = "Descrição do prefixo"
  type        = string
  default     = ""
}

variable "site_id" {
  description = "ID do site associado ao prefixo"
  type        = number
  default     = null
}

variable "tenant_id" {
  description = "ID do tenant associado ao prefixo"
  type        = number
  default     = null
}

variable "vlan_id" {
  description = "ID da VLAN associada ao prefixo"
  type        = number
  default     = null
}

variable "is_pool" {
  description = "Indica se o prefixo é um pool de endereços"
  type        = bool
  default     = false
}

variable "role_id" {
  description = "ID do papel (role) associado ao prefixo"
  type        = number
  default     = null
}

variable "tags" {
  description = "Lista de nomes das tags associadas ao prefixo"
  type        = list(string)
  default     = []
}
