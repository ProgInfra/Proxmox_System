# Proxmox System : Configure

![Icon](../icon.png)

## Table Of Contents

- [Proxmox System : Configure](#proxmox-system--configure)
  - [Table Of Contents](#table-of-contents)
  - [Main Repository](#main-repository)
  - [User](#user)
  - [Network](#network)
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

TODO

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
