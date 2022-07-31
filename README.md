# Proxmox System

![Icon](./icon.png)

[Servers icons created by Maxim Basinski Premium - Flaticon](https://www.flaticon.com/free-icons/servers)

## Table Of Contents

- [Proxmox System](#proxmox-system)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Access](#access)
  - [Getting Started](#getting-started)
    - [Server Access](#server-access)
  - [Documentations](#documentations)
  - [Development](#development)
    - [Requirements](#requirements)
    - [Docsify](#docsify)
  - [Contributing](#contributing)
  - [Licence](#licence)

## Description

Proxmox Installation and Configuration.

TODO

## Access

- **Development (Local)** :
  - [Proxmox System Docs Development](http://localhost:6007)
- **Production (Local)** :
  - [Proxmox System Docs Production](http://localhost:6007)
- **Production** :
  - [Proxmox System Docs Production](https://proginfra.gitlab.io/proxmox_system)

## Getting Started

1) First of all you need a **machine** to build this **server**, choose and build your server with this project : [Server Build](https://proginfra.gitlab.io/server_build/#/)
2) With your machine, you can now install the **operating system** : **[Proxmox](https://www.proxmox.com/en/downloads/category/proxmox-virtual-environment)**. You need to install the system with a **USB Boot Key**, download the iso on the official website and see this [documentations](https://progdevlab.gitlab.io/dyntools/#/docs/global/boot) to create this Key.
3) TODO

### Server Access

- TODO

## Documentations

- [Ideas](./docs/ideas.md)
- TODO

## Development

If you want you can **develop** this repository :

1) You need to install the [Requirements](#requirements)
2) You can develop on [Docsify](#docsify)

### Requirements

We use **Docker** :

- Docker
- Docker Compose

### Docsify

```bash
cd docsify

# Development
docker-compose -f docker-compose.dev.yml up

# Production
docker-compose up --build
```

## Contributing

See [CONTRIBUTING](./CONTRIBUTING.md) for more information.

## Licence

This project is licensed under the terms of the MIT license.

See [LICENSE](./LICENCE.md) for more information.
