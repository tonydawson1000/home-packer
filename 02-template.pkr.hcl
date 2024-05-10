data "amazon-ami" "globoticket" {
  filters = {
    virtualization-type = "hvm"
    name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
    root-device-type    = "ebs"
  }
  owners      = ["099720109477"]
  most_recent = true
}

data "amazon-secretsmanager" "globoticket-live" {
  name = "Globoticket-live"
  key  = "SECRET_ARTIST_NAME"
}

source "amazon-ebs" "globoticket" {
  ssh_username  = "ubuntu"
  ami_name      = "globoticket-${uuidv4()}"
  source_ami    = data.amazon-ami.globoticket.id
  instance_type = "t3.micro"
}

source "virtualbox-iso" "globoticket" {
  guest_os_type          = "Ubuntu_64"
  headless               = false
  iso_url                = "http://releases.ubuntu.com/20.04/ubuntu-20.04.2-live-server-amd64.iso"
  iso_checksum           = "d1f2bf834bbe9bb43faf16f9be992a6f3935e65be0edece1dee2aa6eb1767423"
  ssh_username           = "vagrant"
  ssh_password           = "vagrant"
  ssh_handshake_attempts = 20
  ssh_timeout            = "30m"
  http_directory         = "http"
  cpus                   = 3
  memory                 = 8192
  boot_wait              = "5s"
  boot_command = [
    "<enter><enter><f6><esc><wait> ",
    "autoinstall ds=nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]
  shutdown_command = "echo '/sbin/halt -h -p' > shutdown.sh; echo 'vagrant'|sudo -S bash 'shutdown.sh'"
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--graphicscontroller", "vmsvga"],
    ["modifyvm", "{{.Name}}", "--vram", "32"]
  ]
}

build {
  sources = ["source.virtualbox-iso.globoticket", "source.amazon-ebs.globoticket"]
  provisioner "file" {
    source      = "config/nginx.service"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "config/nginx.conf"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "globoticket_assets"
    destination = "/tmp/"
  }
  provisioner "shell" {
    execute_command = "sudo -S env {{ .Vars }} {{ .Path }}"
    inline = [
      "mkdir -p /var/globoticket",
      "mv /tmp/nginx.conf /var/globoticket/",
      "mv /tmp/nginx.service /etc/systemd/system/nginx.service",
      "mv /tmp/globoticket_assets/** /var/globoticket"
    ]
  }
  provisioner "shell" {
    execute_command  = "sudo -S env {{ .Vars }} {{ .Path }}"
    environment_vars = ["SECRET_ARTIST_NAME=${data.amazon-secretsmanager.globoticket-live.value}"]
    script           = "scripts/build_nginx_webapp.sh"
    only             = ["amazon-ebs.globoticket"]
  }
  provisioner "shell" {
    execute_command = "sudo -S env {{ .Vars }} {{ .Path }}"
    script          = "scripts/build_nginx_webapp.sh"
    only            = ["virtualbox-iso.globoticket"]
  }
  provisioner "shell" {
    execute_command = "sudo -S env {{ .Vars }} {{ .Path }}"
    script          = "scripts/virtualbox.sh"
    only            = ["virtualbox-iso.globoticket"]
  }
  provisioner "shell" {
    execute_command = "sudo -S env {{ .Vars }} {{ .Path }}"
    script          = "scripts/vagrant.sh"
    only            = ["virtualbox-iso.globoticket"]
  }
  post-processor "vagrant" {
    only = ["virtualbox-iso.globoticket"]
  }
}
