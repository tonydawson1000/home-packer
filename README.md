# home-packer
Hashicorp Packer Base Image Builder

### Packer has lots of 'Integrations'

- [Packer Integrations](https://developer.hashicorp.com/packer/integrations)



### Packer uses HCL now by default (json usage has been deprecated)

- Packer Template files must now use have `.pkr.hcl` file extention

## Builders - WIP

- [packer-builders](https://developer.hashicorp.com/packer/docs/community-tools#community-builders)

## Useful Packer Commands

Run these packer commands from the cli on the folder containing the packer build template (.pkr.hcl file) - indicated by the `.` means current directory.

| Command               | Description                   |
|-----------------------|-------------------------------|
| `packer validate .`   | High Level Validation         |
| `packer fmt .`        | Format code to HCL 2 Standard |
| `node-0`  | Kubernetes worker node |
| `node-1`  | Kubernetes worker node |

## packer-template-general

## packer-template-podman

## podman-ubuntu

Build 20.04-focal-fossa

    packer build -var-file="podman-ubuntu-20.04-focal-fossa.pkvars.hcl" .

Build 22.04-jammy-jellyfish

    packer build -var-file="podman-ubuntu-22.04-jammy-jellyfish.pkvars.hcl" .

Build 24.04-noble-numbat

    packer build -var-file="podman-ubuntu-24.04-noble-numbat.pkvars.hcl" .



Check which Linux Distro

    cat /etc/os-release