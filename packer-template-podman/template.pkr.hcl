variable "podman_ubuntu_image_22_04_jammy_jellyfish" {
  type    = string
  default = null
}

variable "podman_ubuntu_image_24_04_noble_numbat" {
  type    = string
  default = null
}

packer {
  required_plugins {
    podman = {
      version = ">= 0.0.1"
      source  = "github.com/Polpetta/podman"
    }
  }
}

source "podman" "ubuntu-jammy" {
  image  = var.podman_ubuntu_image_22_04_jammy_jellyfish
  commit = true
}

source "podman" "ubuntu-noble" {
  image  = var.podman_ubuntu_image_24_04_noble_numbat
  commit = true
}

build {
  name = "packer-template-podman"
  sources = [
    "source.podman.ubuntu-jammy",
    "source.podman.ubuntu-noble"
  ]

  # File Provisioner - Copy entire (files) Folder (inc contents)
  provisioner "file" {
    source      = "sources/files"
    destination = "/tmp/"
  }

  # File Provisioner - Copy entire (web) Folder (inc contents)
  provisioner "file" {
    source      = "sources/web"
    destination = "/tmp/"
  }

  # File Provisioner - Copy single file
  provisioner "file" {
    source      = "sources/config"
    destination = "/tmp/"
  }

  # Shell (inline) Provisioner
  # Move the remote files (and folder) copied into the image above from /tmp
  provisioner "shell" {
    #execute_command = "echo 'packer' | sudo -S env {{ .Vars }} {{ .Path }}"
    inline = [
      "mkdir -p /var/globoticket",
      "mv /tmp/files /var/globoticket/files",
      "mv /tmp/web /var/globoticket/web",
      "mv /tmp/config /var/globoticket/"
    ]
  }

  # Shell (script) Provisioner
  # Set a 'temp' Environment Variable (that the script will use when its executed)
  # Upload the script, run it and cleanup once done
  provisioner "shell" {
    environment_vars = ["MY_ENV_VAR=The Build Name is : ${build.name}"]
    script           = "sources/scripts/install-nginx.sh"
  }
}