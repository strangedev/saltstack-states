{% if len(pillar['docker']['prerequisites']) > 0 %}

include:
 - docker.docker-repository

docker-prerequisites:
  pkg.installed:
    - pkgs: 
      {% for package_name in pillar['docker']['prerequisites'] %}
      - {{ package_name }}
      {% endfor %}
    - require_in:
      - docker-repository

{% endif %}