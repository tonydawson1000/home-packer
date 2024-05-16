packer {
  required_version = ">= 1.10.0"
  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = "~> 1"
    }

    hyperv = {
      source  = "github.com/hashicorp/hyperv"
      version = "~> 1"
    }

    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = "~> 1"
    }

    parallels = {
      source  = "github.com/parallels/parallels"
      version = ">= 1.1.5"
    }

    podman = {
      version = ">= 0.1.0"
      source  = "github.com/Polpetta/podman"
    }

    vagrant = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}