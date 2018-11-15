include:
  - kubernetes-master.kubernetes-initcluster

{% for user in pillar.get('groups', {'kubernetes': []}).get('kubernetes', []) %}
kubernetes-usersetup-{{ user }}:
  cmd.run:
    - name: sh /usr/local/bin/kubernetes-usersetup.sh
    - runas: root
    - creates:
      - /home/{{ user }}/.kube
    - env:
      - KUBERNETES_USERSETUP_USER: {{ user }}
    - require:
      - file: /usr/local/bin/kubernetes-usersetup.sh
{% endfor %}

/usr/local/bin/kubernetes-usersetup.sh:
  file.managed:
    - source: salt://scripts/kubernetes/usersetup.sh
    - mode: 755
