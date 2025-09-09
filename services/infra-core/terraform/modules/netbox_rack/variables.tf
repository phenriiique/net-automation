variable "name" {
  description = "Nome do rack"
  type        = string
}

variable "site_id" {
  description = "ID do site onde o rack será criado"
  type        = number
}

variable "status" {
  description = "Status do rack"
  type        = string
  default     = "active"
  
  validation {
    condition = contains([
      "active", "planned", "reserved", "available", "deprecated"
    ], var.status)
    error_message = "Status deve ser um dos seguintes: active, planned, reserved, available, deprecated."
  }
}

variable "width" {
  description = "Largura do rack em polegadas"
  type        = number
  default     = 19
  
  validation {
    condition     = var.width == 19 || var.width == 23
    error_message = "Largura deve ser 19 ou 23 polegadas."
  }
}

variable "u_height" {
  description = "Altura do rack em unidades U"
  type        = number
  default     = 42
  
  validation {
    condition     = var.u_height >= 1 && var.u_height <= 100
    error_message = "Altura deve estar entre 1 e 100 unidades U."
  }
}

variable "tenant_id" {
  description = "ID do tenant proprietário do rack"
  type        = number
  default     = null
}

variable "tags" {
  description = "Lista de tags para o rack"
  type        = list(string)
  default     = []
}
