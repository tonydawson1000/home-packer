build {
  name        = "Packer Builder - Parallels - Ubuntu 24.04 - Noble Numbat"
  description = <<EOF
This build uses the Parallels ISO Builder to create:
* an Ubuntu 24.04 - Noble Numbat Parallels VM
Using the following:
* [source.parallels-iso.ubuntu-noble]
EOF

  sources = [
    "source.parallels-iso.ubuntu-noble"
  ]

  provisioner "shell" {
    inline = [
      "echo Hello From - Ubuntu 24.04 - Noble Numbat!"
    ]
  }

  post-processor "manifest" {}
}