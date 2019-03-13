include:  
  - kubernetes.controlplane
  - kubernetes.kubeconfig

/var/lib/canal-deploy/canal.yaml:
  file.managed:
    - source: salt://canal/deploy.yaml

canal-deploy:
  cmd.run:
    - name: "kubectl appl -f /var/lib/canal-deploy/canal.yaml"
    - watch:
      - kubeadm-init
    - require:
      - kubeconfig-for-root
      - file: /var/lib/canal-deploy/canal.yaml