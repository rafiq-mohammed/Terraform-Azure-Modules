variable "nsg_array" {
  type = map(object({
    nsg_name                   = string
    location                   = string
    resource_group_name        = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = number
    source_address_prefixes    = string
    destination_address_prefix = string
  }))
}

variable "nsg_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}