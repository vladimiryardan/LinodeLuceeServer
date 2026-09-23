variable "linode_token" {
  description = "Linode API token used by Terraform"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Linode region for the web server"
  type        = string
}

variable "instance_type" {
  description = "Linode instance type"
  type        = string
}

variable "image" {
  description = "Operating system image"
  type        = string
  default     = "linode/ubuntu24.04"
}

variable "instance_label" {
  description = "Linode instance label"
  type        = string
  default     = "lucee-webserver"
}

variable "hostname" {
  description = "Server hostname"
  type        = string
  default     = "lucee-webserver"
}

variable "ssh_public_key" {
  description = "SSH public key installed on the Linode"
  type        = string
  sensitive   = true
}