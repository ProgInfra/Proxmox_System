# Proxmox System : Remove Subscription Notice

![Icon](../icon.png)

## Table Of Contents

- [Proxmox System : Remove Subscription Notice](#proxmox-system--remove-subscription-notice)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Remove Subscription Notice](#remove-subscription-notice)
  - [Revert Changes](#revert-changes)

## Description

Normally you can access to this **documentation** just in file.

If you haven't **paid** for **Proxmox** and it's **normal**, it's a great **free supervisor**, but you have the **subscription notice** at **every connection**.

The best way to **remove** this message is to **buy Proxmox**, but if you haven't money for that, here is a little **tips** :

## Remove Subscription Notice

> Based on this [tutorial](https://johnscs.com/remove-proxmox51-subscription-notice/)

You have the **automatic step** to remove this **subcription notice** with this **command** :

```bash
sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service

sed -i.backup -z "s/res === null || res === undefined || \!res || res\n\t\t\t.data.status.toLowerCase() \!== 'active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```

But **if you want**, you can use **these manual steps** :

```bash
# Change to Proxmox Directory
cd /usr/share/javascript/proxmox-widget-toolkit

# Create a backup
cp proxmoxlib.js proxmoxlib.js.bak

# Edit the file
nano proxmoxlib.js

# Locate with CTRL + W to search "No valid subcription"
Ext.Msg.show({
  title: gettext('No valid subscription'),

# Replace “Ext.Msg.show” with “void”
void({ //Ext.Msg.show({
  title: gettext('No valid subscription'),

# Finally restart the Proxmox Service
systemctl restart pveproxy.service

# Check if the change has been made
grep -n -B 1 'No valid sub' proxmoxlib.js
```

## Revert Changes

If you have decided to **buy Proxmox**, you can revert your change by doing one of these step :

- **Manually edit** (with nano or vim) **proxmoxlib.js** and undo the change.
- **Restore the backup** file by enter this **command** : "mv proxmoxlib.js.bak proxmoxlib.js"
- **Reinstall the Proxmox Toolkit** : "apt-get install --reinstall proxmox-widget-toolkit"
