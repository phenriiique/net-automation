variable "name" {
  description = "Nome do tenant"
  type        = string
}

variable "slug" {
  description = "Slug do tenant (será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
}

variable "description" {
  description = "Descrição do tenant"
  type        = string
  default     = ""
}

