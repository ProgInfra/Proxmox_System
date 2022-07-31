#!/bin/bash


# Git Setup Multiple Repository
git remote add gitlab git@gitlab.com:proginfra/proxmox_system.git
git remote set-url --add --push origin git@gitlab.com:proginfra/proxmox_system.git

git remote add github git@github.com:ProgInfra/Proxmox_System.git
git remote set-url --add --push origin git@github.com:ProgInfra/Proxmox_System.git


# Display Config
git remote show origin

git config --list
