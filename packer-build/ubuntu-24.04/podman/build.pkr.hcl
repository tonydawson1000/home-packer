build {
  name        = "Packer Builder - Podman - Ubuntu 24.04 - Noble Numbat"
  description = <<EOF
This build uses the Podman Builder to create:
* an Ubuntu 24.04 - Noble Numbat Image
Using the following:
* [source.podman.ubuntu-noble]
EOF

  sources = ["source.podman.ubuntu-noble"]

  post-processor "manifest" {}
}