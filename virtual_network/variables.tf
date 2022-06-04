#
variable "vnet_array" {
  type = map(object({
    location        = string
    address         = string
    resource_group  = string
  }))
}
variable "vnet_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}
