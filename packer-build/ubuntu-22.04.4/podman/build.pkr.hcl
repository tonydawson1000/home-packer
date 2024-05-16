build {
  name        = "Packer Builder - Podman - Ubuntu 22.04.4 - Jammy Jellyfish"
  description = <<EOF
This build uses the Podman Builder to create:
* an Ubuntu 22.04.4 - Jammy Jellyfish Image
Using the following:
* [source.podman.ubuntu-jammy]
EOF

  sources = ["source.podman.ubuntu-jammy"]

  post-processor "manifest" {}
}