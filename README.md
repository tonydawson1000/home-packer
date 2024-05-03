# home-packer
Hashicorp Packer Base Image Builder

Build 20.04-focal-fossa

    packer build -var-file="podman-ubuntu-20.04-focal-fossa.pkvars.hcl" .

Build 22.04-jammy-jellyfish

    packer build -var-file="podman-ubuntu-22.04-jammy-jellyfish.pkvars.hcl" .

Build 24.04-noble-numbat

    packer build -var-file="podman-ubuntu-24.04-noble-numbat.pkvars.hcl" .



Check which Linux Distro

    cat /etc/os-release