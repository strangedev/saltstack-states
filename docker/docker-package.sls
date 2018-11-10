include:
  - docker.docker-service

{% if grains['os'] == 'Ubuntu' %}
docker-ce:
  pkg.latest:
    - refresh: True
    - require_in:
      - service: docker
{% endif %}
