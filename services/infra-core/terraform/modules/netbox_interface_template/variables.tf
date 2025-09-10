variable "device_type_id" {
  description = "ID do device type ao qual o template de interface pertence"
  type        = number
}

variable "name" {
  description = "Nome do template de interface"
  type        = string
}

variable "type" {
  description = "Tipo do template de interface (1000base-t, 10gbase-t, etc.)"
  type        = string
  default     = "1000base-t"
}

variable "mgmt_only" {
  description = "Se o template de interface é apenas para gerenciamento"
  type        = bool
  default     = false
}

variable "description" {
  description = "Descrição do template de interface"
  type        = string
  default     = ""
}

variable "label" {
  description = "Label do template de interface"
  type        = string
  default     = ""
}
