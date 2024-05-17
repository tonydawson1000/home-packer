build {
  name        = "Packer Builder - Parallels - Ubuntu 22.04.4 - Jammy Jellyfish"
  description = <<EOF
This build uses the Parallels ISO Builder to create:
* an Ubuntu 22.04.4 - Jammy Jellyfish Parallels VM
Using the following:
* [source.parallels-iso.ubuntu-jammy]
EOF

  sources = [
    "source.parallels-iso.ubuntu-jammy"
  ]

  provisioner "shell" {
    inline = [
      "echo Hello From - Ubuntu 22.04.4 - Jammy Jellyfish!"
    ]
  }

  post-processor "manifest" {}
}