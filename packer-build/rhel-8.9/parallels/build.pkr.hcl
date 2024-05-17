build {
  name        = "Packer Builder - Parallels - RHEL 8"
  description = <<EOF
This build uses the Parallels ISO Builder to create:
* a RHEL 8.9 Parallels VM
Using the following:
* [source.parallels-iso.rhel-8]
EOF

  sources = [
    "source.parallels-iso.rhel-8"
  ]

  provisioner "shell" {
    inline = [
      "echo Hello From - RHEL 8!"
    ]
  }

  post-processor "manifest" {}
}