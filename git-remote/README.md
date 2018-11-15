# `git-remote` state

## Description

A state which ensures a user called `git` exists and users have ssh
access to it.

## Compatibility

- Linux

## Pillars

### `git-remote`

Used to configure which users have ssh access to the `git` user account.

## Data

### `ssh-keys`

Requires ssh keys to be present for all users configured in the pillar.
See `saltstack-data-examples`.
