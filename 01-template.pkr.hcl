source "amazon-ebs" "globoticket" {
  ssh_username  = "ubuntu"
  ami_name      = "globoticket-${uuidv4()}"
  source_ami    = "ami-03d5c68bab01f3496"
  instance_type = "t3.micro"

}

build {
  sources = ["source.amazon-ebs.globoticket"]
}
