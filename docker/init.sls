include:
  - docker.docker-prerequisites
  - docker.docker-repository

{% if grains['os'] == 'Ubuntu' %}
docker-ce:
  pkg.latest:
    - refresh: True
{% endif %}
