terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

# Configure the provider with your Cisco APIC credentials.
provider "aci" {
  # APIC Username
  username = var.apic.username
  # APIC Password
  password = var.apic.password
  # APIC URL
  url      = var.apic.url
  insecure = true
}

# Define an ACI Tenant Resource.
resource "aci_tenant" "terraform_tenant" {
    name        = "terraform_tenant"
    description = "This tenant is created by terraform"
}
