# Treat Packer variables as constants — you cannot update them during run time.

variable "image-name-and-tag" {
  type    = string
  default = "ubuntu:noble"
}