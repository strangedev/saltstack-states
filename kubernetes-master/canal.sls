include:  
  - kubernetes-master.controlplane
  - kubernetes-master.kubeconfig

/var/lib/kubernetes-master/canal.yaml:
  file.managed:
    - source: salt://canal/deploy.yaml

canal-deploy:
  cmd.run:
    - name: "kubectl appl -f /var/lib/kubernetes-master/canal.yaml"
    - watch:
      - kubeadm-init
    - require:
      - kubeconfig-for-root
      - file: /var/lib/kubernetes-master/canal.yaml