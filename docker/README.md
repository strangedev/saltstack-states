# `docker` state

## Description

A state which ensures docker is installed and running. 

## Compatibility

- Ubuntu >= 14.04
- Debian >= 9

## Pillars

### `docker`

Used to configure the desired docker version and to blacklist
versions to prevent them from being installed.
