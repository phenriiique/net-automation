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

variable "environment" {
  description = "Ambiente de deploy (dev, staging, prod)"
  type        = string
  default     = "dev"
  
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "network-automation"
}

# variable "tags" {
#   description = "Tags padrão para recursos"
#   type        = map(string)
#   default = {
#     Project     = "network-automation"
#     ManagedBy   = "terraform"
#     Environment = "dev"
#   }
# }
