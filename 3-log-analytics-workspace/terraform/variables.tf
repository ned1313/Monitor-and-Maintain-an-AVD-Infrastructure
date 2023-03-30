variable "naming_prefix" {
  type        = string
  description = "A prefix to use for naming resources"
  default = "taco"
}

variable "location" {
  type        = string
  description = "The Azure region to create resources in"
  default = "westus"
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU to use for the Log Analytics Workspace"
    default = "PerGB2018"
}

variable "sku_capacity" {
  type        = number
  description = "The capacity of the SKU to use for the Log Analytics Workspace"
    default = 1000
}