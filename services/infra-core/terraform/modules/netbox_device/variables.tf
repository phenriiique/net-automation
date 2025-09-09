variable "name" {
  description = "Nome do device"
  type        = string
}

variable "device_type_id" {
  description = "ID do tipo de device"
  type        = number
}

variable "role_id" {
  description = "ID do role do device"
  type        = number
}

variable "site_id" {
  description = "ID do site onde o device está localizado"
  type        = number
}

variable "rack_id" {
  description = "ID do rack onde o device está instalado"
  type        = number
  default     = null
}

variable "rack_position" {
  description = "Posição do device no rack (unidade U)"
  type        = number
  default     = null
}

variable "rack_face" {
  description = "Face do rack onde o device está instalado"
  type        = string
  default     = "front"
  
  validation {
    condition     = contains(["front", "rear"], var.rack_face)
    error_message = "Rack face must be either 'front' or 'rear'."
  }
}

variable "status" {
  description = "Status do device"
  type        = string
  default     = "active"
  
  validation {
    condition = contains([
      "active", "planned", "staged", "failed", "inventory", "decommissioning"
    ], var.status)
    error_message = "Status must be one of: active, planned, staged, failed, inventory, decommissioning."
  }
}

variable "tenant_id" {
  description = "ID do tenant proprietário do device"
  type        = number
  default     = null
}

variable "platform_id" {
  description = "ID da plataforma do device"
  type        = number
  default     = null
}

variable "serial" {
  description = "Número de série do device"
  type        = string
  default     = ""
}

variable "asset_tag" {
  description = "Tag de ativo do device"
  type        = string
  default     = ""
}

variable "description" {
  description = "Descrição do device"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Lista de tags para o device"
  type        = list(string)
  default     = []
}
