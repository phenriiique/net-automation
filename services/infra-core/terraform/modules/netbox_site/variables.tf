variable "name" {
  description = "Nome do site"
  type        = string
}

variable "slug" {
  description = "Slug do site (será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
}

variable "description" {
  description = "Descrição do site"
  type        = string
  default     = ""
}

variable "status" {
  description = "Status do site (active, planned, retired)"
  type        = string
  default     = "active"
  
  validation {
    condition     = contains(["active", "planned", "retired"], var.status)
    error_message = "Status must be one of: active, planned, retired."
  }
}

variable "tenant_id" {
  description = "ID do tenant no Netbox"
  type        = number
  default     = null
}


