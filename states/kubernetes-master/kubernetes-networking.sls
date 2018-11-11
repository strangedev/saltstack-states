include:
  - kubernetes-master.kubernetes-usersetup

flannel-networking:
  cmd.run:
    - name: 'kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml'
    - runas: {{ pillar['groups']['kubernetes'][0] }}  # TODO
    - onchanges:
      - kubernetes-usersetup
