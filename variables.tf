variable "token" {
  type = string
  default = ""
  sensitive = true
}
variable "repositoty_name" {
    type = string
    default = "terraform-Pushgithub"
}

variable "owner_name" {
  type = string
  default = "PatriceNEUSSIofficiel"
  sensitive = true
}
variable "description" {
  type = string
  default = "create repository in github en push des code usiing scripting bash and terraform"
}