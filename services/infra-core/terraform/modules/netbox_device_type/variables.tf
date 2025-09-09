variable "model" {
  description = "Modelo do device type"
  type        = string
}

variable "manufacturer_id" {
  description = "ID do fabricante do device type"
  type        = number
}

variable "part_number" {
  description = "Número da peça do device type"
  type        = string
  default     = ""
}

variable "u_height" {
  description = "Altura em unidades U do device type"
  type        = number
  default     = 1
  
  validation {
    condition     = var.u_height >= 0 && var.u_height <= 100
    error_message = "U height must be between 0 and 100."
  }
}

variable "is_full_depth" {
  description = "Se o device type ocupa a profundidade completa do rack"
  type        = bool
  default     = true
}

variable "description" {
  description = "Descrição do device type"
  type        = string
  default     = ""
}
