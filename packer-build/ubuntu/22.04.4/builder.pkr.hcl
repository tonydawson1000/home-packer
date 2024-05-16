build {
  name        = "Ubuntu 22.04.4"
  description = <<EOF
This Packer Builder is used to create Ubuntu Base Image for :
* 22.04.4 LTS (Jammy Jellyfish)
For the following Builders :
* source.parallels-iso.ubuntu-22.04.4
    EOF

  sources = [
    "source.parallels-iso.ubuntu-22-04-4"
  ]

  provisioner "shell" {
    inline = [
      "echo Hello From - Ubuntu 22.04.4 - Packer Builder!"
    ]
  }

  post-processor "manifest" {}
}