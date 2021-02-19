variable "apic" {
  description = "Login information"
  type        = map
  default     = {
    username = "admin"
    password = ""
    url      = ""
  }
}

variable "tenant" {
    type    = string
    default = "terraform_tenant"
}
variable "vrf" {
    type    = string
    default = "prod_vrf"
}
variable "bd" {
    type    = string
    default = "prod_bd"
}
variable "subnet" {
    type    = string
    default = "10.10.101.1/24"
}
