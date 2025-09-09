variable "name" {
  description = "Nome do role do device"
  type        = string
}

variable "slug" {
  description = "Slug do role do device (será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
}

variable "color_hex" {
  description = "Cor hexadecimal do role do device"
  type        = string
  default     = "000000"
  
  validation {
    condition     = can(regex("^[0-9A-Fa-f]{6}$", var.color_hex))
    error_message = "Color must be a valid 6-digit hexadecimal color code (e.g., FF0000)."
  }
}

variable "description" {
  description = "Descrição do role do device"
  type        = string
  default     = ""
}
