kubernetes-repository:
  pkgrepo.managed:
    - humanname: Kubernetes Repository
    - name: deb https://apt.kubernetes.io/ kubernetes-xenial main
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - require_in:
      - kubernetes-packages

kubernetes-packages:
  pkg.installed:
    - pkgs:
      - kubeadm
      - kubelet
      - kubectl
    - refresh: True
    - hold: True
    - require:
      - docker.docker-service
    #- version:
