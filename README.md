# Arch Linux configuration for Guided Installer

Basic configuration file for [Guided Installer](https://archinstall.archlinux.page/installing/guided.html) on [Arch Linux](https://archlinux.org/) targeting Arch Linux as a server

## Content

Config file [server.json](./server.json)

- German keyboard layout
- German locale with UTF-8
- `Europe/Berlin` timeone
- Arch Linux mirrors from Germany, Poland and the Netherlands
- Swap disabled
- Additional `linux-lts` kernel
- Copy the network configuration from the ISO image
- NTP enabled
- Default `Grub` bootloader
- Default `archlinux` hostname

## Usage

Use with

`archinstall --config-url https://giftkugel.github.io/archlinux-config/server.json`

## Additional bootstrapping

Script file [bootstrap.sh](./bootstrap.sh)

- Create `bootstrap` user which can use `sudo`
- Install packages necessary for Ansible
  - `python3`
  - `python-pip`
  - `python-netaddr`
- Install and start SSH

Use with

`curl -fsSL https://giftkugel.github.io/archlinux-config/bootstrap.sh | sh`


## Disclaimer

Use as it is at own risk