# `rancher-server` state

## Description

Installs the Rancher server in single node mode.

https://rancher.com/adding-custom-nodes-kubernetes-cluster-rancher-2-0-tech-preview-2/

## Requirements

Requires the `docker` state to be applied to the server first.

## Compatibility

- Ubuntu
- Debian
- Arch

## Pillars

### `rancher`

This pillar is used for configuring the deployment of rancher server and agents.
It has to be customized before running the state, otherwise it will not work. 
