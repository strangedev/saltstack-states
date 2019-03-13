# `kubernetes-master` state

## Description

A state which installs bootstraps a Kubernetes master node, including
_Canal_ as a software defined network. It also removes all taints from
the master node, so that Pods can be scheduled on the master node itself,
as this enables a single-node cluster.

_Caution:_ This state disables swap, as Kubernetes is incompatible
with swap.

## Compatibility

- Linux (where `swapoff` is installed)

## Data

### `kubeadm/init.yaml`

Configuration file for `kubeadm init --config`.

See https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-config/ 
for more information.

_Important:_ The config key `networking.podSubnet` should be set to 
10.244.0.0/16. When using a different Pod CIDR, the config key 
`data.net-conf.json.Network` in `canal/deploy.yaml` has to be updated
accordingly. 

### `canal/deploy.yaml`

Deployment manifest for Canal.

See https://docs.projectcalico.org/v3.6/getting-started/kubernetes/installation/flannel for more information.