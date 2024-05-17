# Treat Packer variables as constants — you cannot update them during run time.

variable "version" {
  type    = string
  default = "8.9"
}

variable "arch" {
  type    = string
  default = "x86_64"
}

variable "user" {
  type = object({
    username              = string
    encrypted_password    = string
    password              = string
    force_password_change = bool
  })
  default = {
    username              = "parallels"
    encrypted_password    = "$6$parallels$tb6hm4RSqzwG3j51DSzdFD7Zw3Fxy/x5aen.Yvud7IfLqarIxMEuuM8efQy0gO.pHhT.lIz9tNYoppTGBGCsB/"
    password              = "parallels"
    force_password_change = true
  }
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "iso_checksum" {
  type    = string
  default = ""
}

variable "machine_name" {
  type    = string
  default = ""
}

// variable "hostname" {
//   type    = string
//   default = ""
// }

variable "machine_specs" {
  type = object({
    cpus      = number
    memory    = number
    disk_size = string
  })
  default = {
    cpus      = 2
    memory    = 2048
    disk_size = "65536"
  }
}

variable "boot_wait" {
  type    = string
  default = "10s"
}

variable "boot_command" {
  type    = list(string)
  default = []
}

variable "ssh_username" {
  type    = string
  default = ""
}

variable "ssh_password" {
  type    = string
  default = ""
}

variable "ssh_timeout" {
  type    = string
  default = "60m"
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "ssh_wait_timeout" {
  type    = string
  default = "10000s"
}

variable "create_vagrant_box" {
  type    = bool
  default = false
}

variable "shutdown_timeout" {
  type    = string
  default = "15m"
}

variable "output_directory" {
  type    = string
  default = ""
}

// variable "addons" {
//   type    = list(string)
//   default = []
// }