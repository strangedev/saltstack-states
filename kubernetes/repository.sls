{% if pillar['kubernetes']['repository'] %}
include:
  - kubernetes.packages

kubernetes-repository:
  pkgrepo.managed:
    - humanname: Kubernetes Repository
    - name: {{ pillar["kubernetes"]["repository"]["name"] }}
    - key_url: {{ pillar["kubernetes"]["repository"]["key_url"] }}
    - require_in:
      - kubernetes-packages
{% endif %}