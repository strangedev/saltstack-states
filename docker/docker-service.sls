include:
  - docker.docker-package

docker:
  service.running:
    - enable: True
    - watch:
      - docker-package
