include:
  - docker.docker-service

{% if grains['os'] == 'Ubuntu' %}

{% for version in pillar['docker']['blacklist-versions'] %}
no-docker-{{ version }}:
  pkg.removed:
    - name: docker-ce
    - version: {{ version }}
    - require_in:
      - docker-package
{% endfor %}

docker-package:
  pkg.installed:
    - name: docker-ce={{ pillar['docker']['version'] }}
    - refresh: True
    - require_in:
      - service: docker

{% endif %}
