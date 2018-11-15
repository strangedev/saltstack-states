include:
  - kubernetes-master.kubernetes-packages

kubernetes-initcluster:
  cmd.run:
    - name: "kubeadm init --pod-network-cidr={{ pillar['kubernetes']['pod-network'] }}"
    - creates:
      - /etc/kubernetes/manifests/kube-controller-manager.yaml
    - runas: root
    - onchanges:
      - kubernetes-packages
    - require:
      - deactivate-swap

deactivate-swap:
  cmd.run:
    - name: 'swapoff -a'
    - runas: root
    - onchanges:
      - kubernetes-packages
