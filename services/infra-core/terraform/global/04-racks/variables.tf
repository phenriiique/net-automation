# Variables for global racks
variable "rack_qtd" {
  description = "Quantidade de racks a serem criados"
  type        = number
  default     = 22
}

variable "status" {
  description = "Status dos devices"
  type        = string
  default     = "active"
}
