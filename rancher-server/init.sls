# https://rancher.com/docs/rancher/v2.x/en/installation/single-node/

# converting YAML bool to bash bool
{% if pillar['rancher']['use-letsencrypt'] %}
  {% set use_letsencrypt = 'true' %}
{% else %}
  {% set use_letsencrypt = 'false' %}
{% endif %}

# needed for require
include:
  - docker.docker-service

# since the docker run command used to install the server needs custom
# command line arguments and the docker_container state does not support
# this, a shell script is used to bootstrap the server.
rancher-server-started:
  cmd.script:
    - name: salt://sysadmin-scripts/rancher/start-server.sh
    - env:
      - HTTP_PORT: {{ pillar['rancher']['ports']['http'] }}
      - HTTPS_PORT: {{ pillar['rancher']['ports']['https'] }}
      - VOLUME_NAME: {{ pillar['rancher']['volume-name'] }}
      - VERSION: {{ pillar['rancher']['version'] }}
      - USE_LETSENCRYPT: {{ use_letsencrypt }}
      - ACME_DOMAIN: {{ pillar['rancher']['domain-name'] }}
    - creates:  # if the bootstrap succeeds, a PID file is created.
      - /var/lib/rancher/server_container_id
    - requires:
      - {{ pillar['rancher']['volume-name'] }}
      - service: docker  # fail, if docker is not installed & running

# this state will not initially launch the rancher server, since it
# requires rancher-server-started. The rancher-server-started state
# has no way to tell if the rancher server is actually running, thus
# this state is used to monitor the containers state.
# As no further command line arguments are needed to restart the server
# once the bootstrap has completed, this state is sufficient to 
# restart the server, should it be down for some reason.
rancher-server-running:
  docker_container.running:
    - image: rancher/rancher:{{ pillar['rancher']['version'] }}
    - port_bindings:
      - {{ pillar['rancher']['ports']['http'] }}:80
      - {{ pillar['rancher']['ports']['https'] }}:443
    - binds: rancher-server-volume:/var/lib/rancher
    - detach: True
    - restart_policy: unless-stopped
    - requires:
      - rancher-server-started
      - service: docker

# create a persistent volume for the rancher server
{{ pillar['rancher']['volume-name'] }}:
  docker_volume.present
