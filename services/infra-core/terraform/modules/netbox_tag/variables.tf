variable "name" {
  description = "Nome da tag"
  type        = string
}

variable "slug" {
  description = "Slug da tag (será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
}

variable "description" {
  description = "Descrição da tag"
  type        = string
  default     = ""
}

variable "color_hex" {
  description = "Cor da tag em formato hexadecimal (ex: ff0000 para vermelho)"
  type        = string
  default     = "9e9e9e"
  
  validation {
    condition     = can(regex("^[0-9a-fA-F]{6}$", var.color_hex))
    error_message = "Color must be a valid 6-digit hexadecimal color code (e.g., ff0000)."
  }
}
