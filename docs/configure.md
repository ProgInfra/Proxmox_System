# Proxmox System : Configure

![Icon](../icon.png)

## Table Of Contents

- [Proxmox System : Configure](#proxmox-system--configure)
  - [Table Of Contents](#table-of-contents)
  - [Main Repository](#main-repository)
  - [User](#user)
  - [Network](#network)
    - [How to get Internet Access in your VM](#how-to-get-internet-access-in-your-vm)
    - [How to setup Port Forwarding to your VM](#how-to-setup-port-forwarding-to-your-vm)
  - [Certificates](#certificates)

## Main Repository

At the **start**, if you try to **update** the **list of package available**, you can't because the **Enterprise repository** is **activated**, so if you haven't **buy Proxmox**, you need to **disable it** :

First, you need to launch a **shell** on the **Proxmox Web UI** : (Click on your **main server** and click on **Shell**)

```bash
# Go to the APT Source folder
cd /etc/apt/sources.list.d

# Edit the Proxmox Enterprise Repository
nano pve-entreprise.list

# Place a comment '#' on the line with the enterprise proxmox repository
# CTRL + X and Y and ENTER to quit and save

# Now you can update and upgrade
apt update && apt upgrade -y
```

## User

Now you need to **create** a **new user** to connect to **SSH** to your **server** :

1) Click on **Datacenter** and go to **Permissions/Users**
2) Add a new user with **Linux PAM Realm**.
3) Click on your **new user** and click on **Password** to setup the password.
4) You can click on **TFA** to setup **Double Authentication**.
5) Now to add some **permission**, you can click on **Permissions** and add some **User permission**
6) Add a new User Permission with **Path "/"**, your **user** and **Administrator** as **Role** (you can also configure this in a **group** to give it to **multiple users**)
7) You have a new user with **SSH connect** possibility and you can manage your **Proxmox** cluster with it.
8) Next you need to install **sudo**, you can use this [documentation](https://progdevlab.gitlab.io/dyntools/#/docs/linux/debian?id=sudo-installation)
9) Finally you can **connect** to your **server** in **SSH**.

## Network

The network is an important part, first of all, you need to setup a Bridge for the main IP of your server :

1) Go to **System/Network** (You should have a **Network Device** **enpXsX**)
2) Create a new **Linux Bridge** **"vmbr0"** for the **main access**
   1) **IPv4/CIDR** : 30.45.65.41/24 (what you have, it's a sample)
   2) **Gateway** : 30.45.65.1 (what you have, it's a sample)
   3) **Bridge ports** : enpXsX (what you have, it's a sample)
3) Click on **Create** and you have your **main bridge** to access to your server !
4) Now you need to create another **Linux Bridge** **"vmbr1"** for your **Virtual Machines**
   1) **IPv4/CIDR** : 192.168.1.1/24 (what you want, it's a sample)
5) Click on **Create** and you have your **VM bridge** !

If you need it, install **ifupdown2** :

```bash
apt update && apt install ifupdown2
```

Now you have your **network ready**, you need to setup some **additional configuration** :

### How to get Internet Access in your VM

To grant **Internet Access** to your **VM**, you need to edit some config to the file **/etc/network/interfaces** of your **main Server** :

```conf
iface vmbr1 inet static
  address  192.168.1.1
  netmask  255.255.255.0
  bridge-ports none
  bridge-stp off
  bridge-fd 0

  post-up   echo 1 > /proc/sys/net/ipv4/ip_forward
  post-up   iptables -t nat -A POSTROUTING -s '192.168.1.0/24' -o vmbr0 -j MASQUERADE
  post-down iptables -t nat -D POSTROUTING -s '192.168.1.0/24' -o vmbr0 -j MASQUERADE 

  post-up   iptables -t raw -I PREROUTING -i fwbr+ -j CT --zone 1  
  post-down iptables -t raw -D PREROUTING -i fwbr+ -j CT --zone 1 
```

In your **VM**, you can configure your network like this :

- **IP** : 192.168.1.10
- **Mask** : 255.255.255.0
- **Gateway** : 192.168.1.1
- **DNS Server Name** : 8.8.8.8, 1.1.1.1

### How to setup Port Forwarding to your VM

Now if you want to access some services in your VM with port, you need to map port of your main server public IP to your VM IP, here is an example to setup Port Forwarding for port 80, 443 and 22 to the VM with the IP 192.168.1.10 :

```bash
iptables -t nat -A PREROUTING -p tcp -d 30.45.65.41 --dport 80 -i vmbr0 -j DNAT --to-destination 192.168.1.10:80
iptables -t nat -A PREROUTING -p tcp -d 30.45.65.41 --dport 443 -i vmbr0 -j DNAT --to-destination 192.168.1.10:443
iptables -t nat -A PREROUTING -p tcp -d 30.45.65.41 --dport 2223 -i vmbr0 -j DNAT --to-destination 192.168.1.10:2223

# To Display IPTables Rules
iptables -t nat -L --line-numbers

# If needed to persist config between reboot
apt-get install iptables-persistent

# Save new rules
/sbin/iptables-save > /etc/iptables/rules.v4

# Files which contains the configuration
cat /etc/iptables/rules.v4

# Delete Rules
iptables -t nat -D PREROUTING 2
```

## Certificates

If you want to use a good certificate and a great domain name, you can setup Let's Encrypt if you want :

1) First you need to **login** with the **root** user on your **Proxmox Web UI**.
2) Click on your **main server** and go to **Certificates**
3) In **ACME**, click on Add **ACME Account**.
4) Enter a **account name** and you **Email**.
5) Now you can add a **domain**, in **ACME**, click on **Add**.
6) To add an **DNS Challenge**, you need to install a **plugins** first, it's the best if you **server** isn't accessible by internet (**private network**)
7) If you have access by internet to your **server**, you can use the **HTTP Challenge** and enter your **domain** and click on **Create**.
8) Finally click on **Order Certificate Now** to request and get the **certificate**.
