


## Folder Structure

## Packer Integrations / Plugins

### QEMU
The Qemu Packer Plugin comes with a single builder able to create [KVM](https://linux-kvm.org/page/Main_Page) virtual machine images.
- [QEMU Docs](https://developer.hashicorp.com/packer/integrations/hashicorp/qemu)
- [QEMU GitHub](https://github.com/hashicorp/packer-plugin-qemu)

### Hyper-V
The HyperV Packer Plugin is able to create [Hyper-V](https://www.microsoft.com/en-us/server-cloud/solutions/virtualization.aspx) virtual machines and export them.
- [Hyper-V Docs](https://developer.hashicorp.com/packer/integrations/hashicorp/hyperv)
- [Hyper-V GitHub](https://github.com/hashicorp/packer-plugin-hyperv)

### VirtualBox
The VirtualBox plugin is able to create [VirtualBox](https://www.virtualbox.org/) virtual machines and export them in the OVA or OVF format.
- [VirtualBox Docs](https://developer.hashicorp.com/packer/integrations/hashicorp/virtualbox)
- [VirtualBox GitHub](https://github.com/hashicorp/packer-plugin-virtualbox)

### Parallels

- [Parallels Docs](https://developer.hashicorp.com/packer/integrations/Parallels/parallels)
- [Parallels GitHub](https://github.com/Parallels/packer-plugin-parallels)

### Podman
As Podman is a Drop in replacement for Docker - this Podman Packer Plugin has been remixed from the Docker Plugin...
Packer only builds images. It does not attempt to manage (tag/push/start/etc) them in any way. After they're built, it is up to you to launch or destroy them as you see fit.
- [Podman GitHub](https://github.com/Polpetta/packer-plugin-podman)

- [Docker Docs](https://developer.hashicorp.com/packer/integrations/hashicorp/docker)
- [Docker GitHub](https://github.com/hashicorp/packer-plugin-docker)

### Vagrant
The [Vagrant](https://www.vagrantup.com/) multi-component plugin can be used with HashiCorp [Packer](https://www.packer.io/) to create custom images.
The Vagrant plugin integrates Packer with HashiCorp Vagrant, allowing you to use Packer to create development boxes.
- [Vagrant Docs](https://developer.hashicorp.com/packer/integrations/hashicorp/vagrant)
- [Vagrant GitHub](https://github.com/hashicorp/packer-plugin-vagrant)
