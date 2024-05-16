source "podman" "ubuntu-jammy" {
  image  = var.image-name-and-tag
  commit = true
}