terraform {
  required_version = ">= 1.0"
  
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.0"
    }
  }
}
