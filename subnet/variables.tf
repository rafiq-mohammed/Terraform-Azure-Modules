#
variable "subnet_array" {
  type = map(object({
    address        = string
    resource_group = string
    vnet_name      = string
  }))
}
variable "subnet_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}