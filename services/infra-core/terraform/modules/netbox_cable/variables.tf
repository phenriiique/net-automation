variable "a_terminations" {
  description = "Lista de terminações A do cabo"
  type = list(object({
    object_type = string
    object_id   = number
  }))
  default = []
}

variable "b_terminations" {
  description = "Lista de terminações B do cabo"
  type = list(object({
    object_type = string
    object_id   = number
  }))
  default = []
}

variable "status" {
  description = "Status do cabo"
  type        = string
  default     = "connected"
  
  validation {
    condition = contains([
      "connected",
      "planned",
      "deprecated"
    ], var.status)
    error_message = "Status must be one of: connected, planned, deprecated."
  }
}

variable "label" {
  description = "Rótulo do cabo"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Lista de tags para o cabo"
  type        = list(string)
  default     = []
}

variable "tenant_id" {
  description = "ID do tenant"
  type        = number
  default     = null
}


