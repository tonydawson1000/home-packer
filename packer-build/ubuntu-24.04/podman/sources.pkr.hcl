source "podman" "ubuntu-noble" {
  image  = var.image-name-and-tag
  commit = true
}