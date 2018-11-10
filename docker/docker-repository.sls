{% if grains['os'] == 'Ubuntu' %}
docker-repository:
  pkgrepo.managed:
    - humanname: Docker-CE Repository
    
    {% if grains['lsb_distrib_release'] == '18.04'%}
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
    {% elif grains['lsb_distrib_release'] == '16.04' %}
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
    {% elif grains['lsb_distrib_release'] == '14.04' %}
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable
    {% endif %}
    
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - require_in:
      - pkg: docker-ce
{% endif %}
