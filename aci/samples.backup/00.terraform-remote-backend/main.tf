terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "simyung-cisco"

    workspaces {
      name = "cisco-terraform-templates"
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
    name        = "terraform_tenant_3"
    description = "This tenant is created by terraform"
}

