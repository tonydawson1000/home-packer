# Treat Packer variables as constants — you cannot update them during run time.

variable "podman_image" {
  type    = string
  default = null
}



packer {
  required_plugins {
    name = {
      version = ">= 0.0.1"
      source  = "github.com/Polpetta/podman"
    }
  }
}

source "podman" "ubuntu" {
  image  = var.podman_image
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.podman.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world from ${var.podman_image}",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }

  provisioner "shell" {
    inline = ["echo Running ${var.podman_image} Podman image."]
  }
}