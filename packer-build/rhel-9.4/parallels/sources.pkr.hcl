locals {
  timestamp = regex_replace(timestamp(), "[ TZ:]", "")

  version = replace(var.version, ".", "_")

  # Locally Hosted ISO and Checksum
  iso_url      = var.iso_url == "" ? "../../iso/rhel-${var.version}/rhel-${var.version}-${var.arch}-boot.iso" : var.iso_url
  iso_checksum = var.iso_checksum == "" ? "file:./../../iso/rhel-${var.version}/SHA256SUMS" : var.iso_checksum

  machine_name = var.machine_name == "" ? "rhel-${local.version}-base-${local.timestamp}" : var.machine_name
  # hostname = var.hostname == "" ? "rhel_${local.version}-base" : var.hostname

  boot_command = length(var.boot_command) == 0 ? [
    "<wait><up>e<wait> this is where we enter autoinstall ..."
    //     "<wait>",
    //     "<up>e<wait>",
    //     // "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
    //     "<down><down><end> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/rhel-${local.version}/ks.cfg<F10><wait>"
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

source "parallels-iso" "rhel-9" {
  guest_os_type          = "rhel"
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
  //     "/rhel/ks.cfg" = templatefile("${path.root}/../http/redhat/ks.cfg.pkrtpl.hcl", { username = "${local.username}", password = "${local.password}", hostname = "${local.hostname}", package = "${var.install_desktop ? "@^graphical-server-environment" : "@^server-product-environment"}" })

  communicator = "ssh"

  ssh_username = local.ssh_username
  ssh_password = local.ssh_password

  ssh_timeout      = var.ssh_timeout
  ssh_port         = var.ssh_port
  ssh_wait_timeout = var.ssh_wait_timeout

  shutdown_command = "echo '${local.username}' | sudo -S /sbin/halt -h -p"

  shutdown_timeout = var.shutdown_timeout

  output_directory = local.output_dir
}