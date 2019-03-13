include:  
  - kubernetes.packages

/var/lib/kubeadm-init/config.yaml:
  file.managed:
    - source: salt://kubeadm/init.yaml

"swapoff -a":
  cmd.run:
    - unless: "[[ -z $(swapoff -s) ]]"
    - require_in:
      - kubeadm-init

kubeadm-init:
  cmd.run:
    - name: "kubeadm init --config /var/lib/kubeadm-init/config.yaml"
    - creates: /var/lib/kubelet/config.yaml
    - require:
      - file: /var/lib/kubeadm-init/config.yaml
      - kubernetes-packages