variable "apic" {
  description = "Login information"
  type        = map
  default     = {
    username = "admin"
    password = ""
    url      = ""
  }
}
