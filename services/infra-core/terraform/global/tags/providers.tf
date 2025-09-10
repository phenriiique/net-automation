terraform {
  required_version = ">= 1.0"
  
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "~> 3.0"
    }
  }
}

provider "netbox" {
  # Configuration will be provided via environment variables
  # NETBOX_TOKEN and NETBOX_URL
}
