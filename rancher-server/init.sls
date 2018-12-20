# https://rancher.com/docs/rancher/v2.x/en/installation/single-node/

# install pip
{{ pillar['packagenames']['pip'].get(grains['os'], 'pip') }}:
  pkg.installed

docker-python-tools:
  pip.installed:
    - name: docker
    - requires:
      - pkg: {{ pillar['packagenames']['pip'].get(grains['os'], 'pip') }}
    - reload_modules: True

rancher-server-container:
  docker_container.running:
    - image: rancher/rancher:{{ pillar['rancher']['version'] }}
    - port_bindings:
      - {{ pillar['rancher']['ports']['http'] }}:80
      - {{ pillar['rancher']['ports']['https'] }}:443
    - binds: {{ pillar['rancher']['volume-name'] }}:/var/lib/rancher
    - detach: True
    {% if pillar['rancher']['use-letsencrypt'] %}
    - command: --acme-domain={{ pillar['rancher']['domain-name'] }}
    {% endif %}
    - restart_policy: unless-stopped
    - requires:
      - {{ pillar['rancher']['volume-name'] }}
      - docker-python-tools

# create a persistent volume for the rancher server
{{ pillar['rancher']['volume-name'] }}:
  docker_volume.present
