# Proxmox System : Virtual Machine

![Icon](../icon.png)

## Table Of Contents

- [Proxmox System : Virtual Machine](#proxmox-system--virtual-machine)
  - [Table Of Contents](#table-of-contents)
  - [Upload some ISO Image](#upload-some-iso-image)
  - [Create New VM](#create-new-vm)
  - [Configure](#configure)
  - [Backup](#backup)

## Upload some ISO Image

Before the creation of any VM, you need to upload some Operating System, some ISO Image to Proxmox :

1) Click on your **server**, **expand** it and click on the **"local"** storage **unit**.
2) Go to **ISO Images**
3) Then you can **upload a ISO Image** (Linux, Windows, ...) or just put an **URL** to let the server **Download** it for you (you can also add a **Hash algorithm** to check if the **Image** is complete, you need to use it, it's the **best** !).

Here an example with **Debian** with **Download URL** :

- **[URL](https://www.debian.org/distrib/netinst)** : https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.4.0-amd64-netinst.iso
- **File Name** : debian-11.4.0-amd64-netinst.iso
- **Hash algorithm** : SHA512
- **Checksum** : eeab770236777e588f6ce0f984a7f3e85d86295625010e78a0fca3e873f78188af7966b53319dde3ddcaaaa5d6b9c803e4d80470755e75796fbf0e96c973507f
- **Verify certificate** : **Checked**

## Create New VM

Now to add some services, you need a Virtual Machine, here is how to create one :

1) Click on the **blue** button **"Create VM"** at the top.
2) **General** : Choose the **Node** for your VM and setup the **Name** (if you want, click on **advanced** to start the VM at boot).
3) **OS** : Choose the **ISO Image**, the **Type** and the **Version** if necessary.
4) **System** : You can let all to **default** if you want (Windows can need **TPM** !).
5) **Disk** : You can add all **disk** you want and create new **disk** if you want.
6) **CPU** : You can choose the number of **Sockets** (number of **processor** used) and the number of **Cores** per **processor**.
7) **Memory** : You can choose the **amount** of **RAM** for your VM.
8) **Network** : You have to choose a **Bridge** created before **("vmbr1")** (activate the **Firewall**, but you need to configure it after).
9) Click on **Finish** after check everything in **Confirm** !

## Configure

TODO Firewall

## Backup

TODO
