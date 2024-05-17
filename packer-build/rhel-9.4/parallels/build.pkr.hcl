build {
  name        = "Packer Builder - Parallels - RHEL 9"
  description = <<EOF
This build uses the Parallels ISO Builder to create:
* a RHEL 9.4 Parallels VM
Using the following:
* [source.parallels-iso.rhel-9]
EOF

  sources = [
    "source.parallels-iso.rhel-9"
  ]

  provisioner "shell" {
    inline = [
      "echo Hello From - RHEL 9!"
    ]
  }

  post-processor "manifest" {}
}