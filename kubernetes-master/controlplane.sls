include:  
  - kubernetes.packages

/var/lib/kubernetes-master/:
  file.directory:
    - user: root
    - group: root
    - require_in:
      - file: /var/lib/kubernetes-master/init.yaml
      - file: /var/lib/kubernetes-master/canal.yaml

/var/lib/kubernetes-master/init.yaml:
  file.managed:
    - source: salt://kubeadm/init.yaml

"swapoff -a":
  cmd.run:
    - unless: "[[ -z $(swapoff -s) ]]"
    - require_in:
      - kubeadm-init

kubeadm-init:
  cmd.run:
    - name: "kubeadm init --config /var/lib/kubernetes-master/init.yaml"
    - creates: /var/lib/kubelet/config.yaml
    - require:
      - file: /var/lib/kubernetes-master/init.yaml
      - kubernetes-packages