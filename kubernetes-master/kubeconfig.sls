include:
  - kubernetes-master.controlplane

/root/.kube:
  file.directory:
    - user: root
    - group: root
    - watch:
      - kubeadm-init
    - require:
      - kubeadm-init

kubeconfig-copied:
  cmd.run:
    - name: "cp /etc/kubernetes/admin.conf /root/.kube/config"
    - creates: /root/.kube/config
    - require:
      - file: /root/.kube

kubeconfig-for-root:
  cmd.run:
    - name: "chown root:root /root/.kube/config"
    - watch:
      - kubeconfig-copied
    - require:
      - kubeconfig-copied