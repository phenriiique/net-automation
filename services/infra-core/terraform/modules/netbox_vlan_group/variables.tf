variable "name" {
  description = "Nome do VLAN group"
  type        = string
}

variable "slug" {
  description = "Slug do VLAN group (será gerado automaticamente se não fornecido)"
  type        = string
  default     = null
}

variable "description" {
  description = "Descrição do VLAN group"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Lista de IDs das tags do Netbox"
  type        = list(number)
  default     = []
}

variable "vid_ranges" {
  description = "Lista de ranges de VLAN IDs no formato [[min1, max1], [min2, max2]]"
  type        = list(list(number))
  default     = []
}
