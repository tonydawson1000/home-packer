build {
  name        = "Ubuntu 24.04"
  description = <<EOF
This Packer Builder is used to create Ubuntu Base Image for :
* 24.04 (Noble Numbat)
For the following Builders :
* source.parallels-iso.ubuntu-24.04
    EOF

  sources = [
    "source.parallels-iso.ubuntu-24-04"
  ]

  provisioner "shell" {
    inline = [
      "echo Hello From - Ubuntu 24.04 - Packer Builder!"
    ]
  }

  post-processor "manifest" {}
}