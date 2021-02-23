terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

# Configure the provider with your Cisco APIC credentials.
provider "aci" {
    username = var.apic.username
    password = var.apic.password
    url      = var.apic.url
    insecure = true
}

variable "apic" {
  type        = map
  default     = {
    username = "admin"
    password = ""
    url      = ""
  }
}

# Define an ACI Tenant Resource.
resource "aci_tenant" "tenant1" {
    name        = "tenant_hands_on"
    description = "Created by terraform code"
}


