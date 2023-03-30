variable "name_prefix" {
  description = "Prefix to add to the names of resources created by this configuration"
  type        = string
}

variable "location" {
  description = "Location where resources should be created"
  type        = string
  default     = "westus"
}