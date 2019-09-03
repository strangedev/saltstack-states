/var/lib/kubernetes-master/nginx.yaml:
  file.managed:
    - source: salt://nginx-ingress/deploy.yaml

nginx-deploy:
  cmd.run:
    - name: "kubectl apply -f /var/lib/kubernetes-master/nginx.yaml"
    - require:
      - kubernetes-master
      - file: /var/lib/kubernetes-master/nginx.yaml

