variable "environment" {
  description = "Ambiente de deploy"
  type        = string
  default     = "dev"
}

variable "netbox_url" {
  description = "URL do servidor Netbox"
  type        = string
  default     = "http://localhost:8000"
}

variable "netbox_token" {
  description = "Token de autenticação do Netbox"
  type        = string
  sensitive   = true
}
