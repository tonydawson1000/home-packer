build {

  sources = [
    "source.parallels-iso.image"
  ]

  //   provisioner "shell" {
  //     environment_vars = [
  //       "HOME_DIR=/home/${local.username}",
  //       "USERNAME=${local.username}",
  //     ]
  //     scripts = [
  //       "${path.root}/../scripts/ubuntu/base/update.sh",
  //       "${path.root}/../scripts/ubuntu/base/sshd.sh",
  //       "${path.root}/../scripts/ubuntu/base/networking.sh",
  //       "${path.root}/../scripts/ubuntu/base/sudoers.sh",
  //       "${path.root}/../scripts/ubuntu/base/systemd.sh",
  //       "${path.root}/../scripts/ubuntu/base/parallels.sh",
  //       "${path.root}/../scripts/ubuntu/base/parallels_folders.sh",
  //     ]

  //     execute_command   = "echo '${local.username}' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
  //     expect_disconnect = true
  //   }

  //   provisioner "shell" {
  //     environment_vars = [
  //       "HOME_DIR=/home/${local.username}",
  //       "USERNAME=${local.username}",
  //     ]

  //     scripts = [
  //       "${path.root}/../scripts/ubuntu/base/vagrant.sh",
  //     ]

  //     execute_command   = "echo '${local.username}' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
  //     expect_disconnect = true
  //     except            = !var.create_vagrant_box ? ["parallels-iso.image"] : []
  //   }

  //   provisioner "file" {
  //     source      = "${path.root}/../scripts/ubuntu/addons"
  //     destination = "/parallels-tools"
  //     direction   = "upload"
  //     except      = length(var.addons) > 0 ? [] : ["parallels-iso.image"]
  //   }

  //   provisioner "shell" {
  //     environment_vars = [
  //       "HOME_DIR=/home/${local.username}",
  //       "USERNAME=${local.username}",
  //       "ADDONS=${local.addons}",
  //       "ADDONS_DIR=/parallels-tools/addons"
  //     ]

  //     scripts = [
  //       "${path.root}/../scripts/ubuntu/addons/install.sh",
  //     ]

  //     execute_command   = "echo '${local.username}' | {{ .Vars }} sudo -S -E bash -eux '{{ .Path }}'"
  //     expect_disconnect = true
  //     timeout           = "3h"
  //     except            = length(var.addons) > 0 ? [] : ["parallels-iso.image"]
  //   }

  //   provisioner "shell" {
  //     environment_vars = [
  //       "HOME_DIR=/home/${local.username}",
  //       "USERNAME=${local.username}",
  //     ]
  //     scripts = [
  //       "${path.root}/../scripts/ubuntu/base/password_change.sh",
  //     ]

  //     execute_command   = "echo '${local.username}' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
  //     except            = !local.force_password_change ? ["parallels-iso.image"] : []
  //     expect_disconnect = true
  //   }

  //   provisioner "shell" {
  //     environment_vars = [
  //       "HOME_DIR=/home/${local.username}",
  //       "USERNAME=${local.username}",
  //     ]
  //     scripts = [
  //       "${path.root}/../scripts/ubuntu/base/clean_user_snap_folder.sh",
  //     ]

  //     execute_command   = "echo '${local.username}' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
  //     expect_disconnect = true
  //   }


  //   post-processor "vagrant" {
  //     compression_level    = 9
  //     keep_input_artifact  = false
  //     output               = local.vagrant_output_dir
  //     vagrantfile_template = null
  //     except               = !var.create_vagrant_box ? ["parallels-iso.image"] : []
  //   }
}