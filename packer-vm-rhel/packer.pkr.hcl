packer {
  required_version = ">= 1.10.0"
  required_plugins {
    parallels = {
      source  = "github.com/parallels/parallels"
      version = ">= 1.1.5"
    }
    vagrant = {
      version = "~> 1"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}