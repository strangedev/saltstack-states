include:
  - docker.docker-service

{% if grains['os'] == 'Ubuntu' %}
docker-package:
  pkg.installed:
    - name: docker-ce={{ pillar['docker']['version'] }}
    - refresh: True
    - require_in:
      - service: docker
{% endif %}
