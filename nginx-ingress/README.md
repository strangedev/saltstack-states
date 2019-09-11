# nginx-ingress

A state that deploy the nginx controller for kubernetes.

The manifest is mostly taken from the [installation guide](https://kubernetes.github.io/ingress-nginx/deploy/). The nginx workload was modified to be a DaemonSet and to use the host network.

