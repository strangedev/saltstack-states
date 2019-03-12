{% if pillar['docker']['repository'] %}
include:
  - docker.docker-package

docker-repository:
  pkgrepo.managed:
    - humanname: Docker-CE Repository
    - key_url: {{ pillar['docker']['repository']['key_url'] }}
    - name: {{ pillar['docker']['repository']['name'] }}
    - require_in:
      - docker-package
{% endif %}
