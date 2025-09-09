variable "name" {
  description = "Nome do fabricante"
  type        = string
}

variable "slug" {
  description = "Slug do fabricante (será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
}

variable "description" {
  description = "Descrição do fabricante"
  type        = string
  default     = ""
}
