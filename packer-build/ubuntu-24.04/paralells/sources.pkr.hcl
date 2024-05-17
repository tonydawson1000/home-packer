locals {
  timestamp = regex_replace(timestamp(), "[ TZ:]", "")

  version = replace(var.version, ".", "_")

  # Remotely Hosted ISO and Checksum
  # iso_url = var.iso_url == "" ? "https://cdimage.ubuntu.com/releases/${var.version}/release/ubuntu-${var.version}-live-server-arm64.iso" : var.iso_url
  # iso_checksum = var.iso_checksum == "" ? "file:https://cdimage.ubuntu.com/releases/${var.version}/release/SHA256SUMS" : var.iso_checksum

  # Locally Hosted ISO and Checksum
  iso_url      = var.iso_url == "" ? "../../iso/ubuntu-${var.version}/ubuntu-${var.version}-live-server-${var.arch}.iso" : var.iso_url
  iso_checksum = var.iso_checksum == "" ? "file:./../../iso/ubuntu-${var.version}/SHA256SUMS" : var.iso_checksum

  machine_name = var.machine_name == "" ? "ubuntu-${local.version}-base-${local.timestamp}" : var.machine_name
  # hostname = var.hostname == "" ? "ubuntu_${local.version}-base" : var.hostname

  boot_command = length(var.boot_command) == 0 ? [
    "<wait>e<wait><down><down><down><end><wait> this is where we enter autoinstall ..."
    //     "<wait>e<wait><down><down><down><end><wait> autoinstall ds=nocloud-net\\;s=http://{{.HTTPIP}}:{{.HTTPPort}}/ubuntu/<f10><wait>"
  ] : var.boot_command

  ssh_username = var.create_vagrant_box ? "vagrant" : var.ssh_username == "" ? var.user.username : var.ssh_username
  ssh_password = var.create_vagrant_box ? "vagrant" : var.ssh_password == "" ? var.user.password : var.ssh_password

  username = var.create_vagrant_box ? "vagrant" : var.user.username
  //   password              = var.create_vagrant_box ? "vagrant" : var.user.password
  //   force_password_change = var.create_vagrant_box ? false : var.user.force_password_change
  //   encrypted_password    = var.create_vagrant_box ? "$6$parallels$VXyp.NunfN8bTmRtTNYSOrWE7KHIbHrc02A/N1oQ9dpJY4xB9KQjYEp7ZL53hzGne0QpZJK7Iqs99dQ/qeb3R." : var.user.encrypted_password

  output_dir = var.output_directory == "" ? "out" : var.output_directory

  # vagrant_output_dir = var.output_vagrant_directory == "" ? "${path.root}/box/${local.machine_name}.box" : "${var.output_vagrant_directory}/box/${local.machine_name}.box"
  # addons       = join(",", var.addons)
}

source "parallels-iso" "ubuntu-noble" {
  guest_os_type          = "ubuntu"
  parallels_tools_flavor = "lin-arm"
  parallels_tools_mode   = "upload"
  prlctl = [
    ["set", "{{ .Name }}", "--efi-boot", "off"]
  ]
  prlctl_version_file = ".prlctl_version"
  floppy_files        = null

  iso_url      = local.iso_url
  iso_checksum = local.iso_checksum

  vm_name = local.machine_name

  cpus      = var.machine_specs.cpus
  memory    = var.machine_specs.memory
  disk_size = var.machine_specs.disk_size

  boot_wait    = var.boot_wait
  boot_command = local.boot_command

  // http_content = {
  //   "/ubuntu/user-data"          = templatefile("${path.root}/../../http/ubuntu/user-data.pkrtpl.hcl", { username = "${local.username}", hostname = "${local.hostname}", password = "${local.encrypted_password}" })
  //   "/ubuntu/meta-data"          = templatefile("${path.root}/../../http/ubuntu/meta-data.pkrtpl.hcl", { hostname = "${local.hostname}" })
  //   "/ubuntu/preseed-hyperv.cfg" = templatefile("${path.root}/../../http/ubuntu/preseed-hyperv.cfg.pkrtpl.hcl", { username = "${local.username}", password = "${local.password}" })
  //   "/ubuntu/preseed.cfg"        = templatefile("${path.root}/../../http/ubuntu/preseed.cfg.pkrtpl.hcl", { username = "${local.username}", password = "${local.password}" })
  // }

  communicator = "ssh"

  ssh_username = local.ssh_username
  ssh_password = local.ssh_password

  ssh_timeout      = var.ssh_timeout
  ssh_port         = var.ssh_port
  ssh_wait_timeout = var.ssh_wait_timeout

  shutdown_command = "echo '${local.username}' | sudo -S shutdown -P now"

  shutdown_timeout = var.shutdown_timeout

  output_directory = local.output_dir
}