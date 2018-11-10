docker-prerequisites:
  pkg.installed:
    - pkgs: {% if grains['os'] != 'Ubuntu' %} [] {% else %}
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common
      {% endif %}
