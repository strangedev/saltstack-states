# `samba` state

## Description

Sets up a samba server and file shares supplied by the `samba` pillar.

## Compatibility

- Ubuntu 18.04

## Pillars

### `samba`

Lists the file shares that will be configured.

## Data

### `/samba/smb.conf`

The samba config file, containing common configuration sections.
This file is intended to contain the `[global]` and `[home]` sections.

### `/samba/<share name>.conf`

A config file containing the configuration for a file share named `share name`.
