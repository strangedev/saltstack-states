docker-prerequisites:
  pkg.installed:
    - pkgs: 
      {% if grains['os'] == 'Ubuntu' %}
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common
      {% elif grains['os'] == 'Debian' %}
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common
      - gnupg2
      {% else %}