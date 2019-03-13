include:
  - kubernetes-master.kubeconfig
  - kubernetes-master.controlplane

"kubectl taint nodes --all node-role.kubernetes.io/master-":
  cmd.run:
    - watch:
      - kubeadm-init
    - require:
      - kubeconfig-for-root