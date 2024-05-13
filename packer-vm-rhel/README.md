# Packer Build Definition for RHEL

### Prerequisites

Install the required Software

- Hashicorp Packer

Install the required Packer Plugins

- List Installed
    `packer plugins installed`

    -- [Hyper-V Builder](https://developer.hashicorp.com/packer/integrations/hashicorp/hyperv)

    -- [QEMU Builder](https://developer.hashicorp.com/packer/integrations/hashicorp/qemu/latest/components/builder/qemu)

    -- [Paralells Builder](https://developer.hashicorp.com/packer/integrations/Parallels/parallels)


https://github.com/Parallels/packer-examples/blob/main/redhat/build.pkr.hcl
https://developer.hashicorp.com/packer/integrations/Parallels/parallels/latest/components/builder/iso


## RHEL ISO Downloads

Red Hat Enterprise Linux 8.9 Boot ISO
Last modified: 2023-11-01 SHA-256 Checksum: db5ed2e398d2c5b40636e0744c7c692bb0a0f1f7d83072086f2e8f709a17301a

- [https://access.redhat.com/downloads/content/419/ver=/rhel---8/8.9/aarch64/product-software](https://access.redhat.com/downloads/content/419/ver=/rhel---8/8.9/aarch64/product-software)

Red Hat Enterprise Linux 9.4 Boot ISO
Last modified: 2024-04-22 SHA-256 Checksum: 7de492ee2cda87a1f88ca36920f7676c62a7a70920f3305bda90c39359a86017

- [https://access.redhat.com/downloads/content/419/ver=/rhel---9/9.4/aarch64/product-software](https://access.redhat.com/downloads/content/419/ver=/rhel---9/9.4/aarch64/product-software)