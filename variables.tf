locals {
  labels = {
    terraform = "true"
    project   = "cloud"
    customer  = "customer"
  }
}

variable "labels" {
  description = "Labels map to assign to instance"
  type        = map(string)
  default     = {}
}

variable "lb_name" {
  description = "Name of this LB"
  type        = string
}

variable "folder_id" {
  description = "Folder id (default to provider config)"
  type        = string
}

variable "lb_network_id" {
  description = "VPC id for LB attachments"
  type        = string
}

variable "lb_subnet_name" {
  description = "LB Subnet name"
  type        = string
}

variable "lb_external_ip" {
  description = "External Static IP for LB"
  type        = string
  default     = null
}

variable "lb_port" {
  description = "Port for LB listener"
  type        = number
  default     = 443
}

variable "lb_certificate_id" {
  description = "Certificate ID from Yandex Certificate Manager"
  type        = string
}