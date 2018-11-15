# `ssh` state

## Description

A state which ensures an ssh server is installed, configured and running.
Configures ssh access to the host for all configured users.

## Compatibility

- Ubuntu 14.04-18.04

## Pillars

### `users`

All users configured in this pillar are granted ssh access to their own accounts.

## Data

### `config/sshd_config`

The managed config file, which is rolled out to all hosts.
