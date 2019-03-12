include:
  - docker.docker-service

docker-package:
  pkg.installed:
    - name: {{ pillar['docker']['package_name'] }}
    - refresh: True
    - hold: True
    - version: {{ pillar['docker']['version'] }}
    - require_in:
      - service: docker
