include:
  - docker

kubernetes-packages:
  pkg.installed:
    - pkgs:
      - kubeadm: {{ pillar['kubernetes']['version'] }}
      - kubelet: {{ pillar['kubernetes']['version'] }}
      - kubectl: {{ pillar['kubernetes']['version'] }}
    - refresh: True
    - hold: True
    - require:
      - service: docker