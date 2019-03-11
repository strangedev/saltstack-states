include:
  - docker.docker-service

{% if grains['os'] == 'Ubuntu' or grains['os'] == 'Debian' %}

docker-package:
  pkg.installed:
    - name: docker-ce
    - refresh: True
    - hold: True
    - version: {{ pillar['docker']['version'] }}
    - require_in:
      - service: docker

{% endif %}
