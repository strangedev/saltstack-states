include:
  - docker.docker-package

{% if grains['os'] == 'Ubuntu' or grains['os'] == 'Debian' %}
docker-repository:
  pkgrepo.managed:
    - humanname: Docker-CE Repository
    
    {% if grains['lsb_distrib_release'] == '18.04' %}
    - fromrepo: xenial
    {% endif %}
    
    {% if grains['os'] == 'Ubuntu' %}
    - key_url: https://download.docker.com/linux/ubuntu/gpg

    {% if grains['lsb_distrib_release'] == '18.04'%}
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
    {% elif grains['lsb_distrib_release'] == '16.04' %}
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable
    {% elif grains['lsb_distrib_release'] == '14.04' %}
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable
    {% endif %}

    {% elif grains['os'] == 'Debian' %}
    - key_url: https://download.docker.com/linux/debian/gpg

    {% if grains['lsb_distrib_release'].startswith("9") %}
    - name: deb [arch=amd64] https://download.docker.com/linux/debian stretch stable
    {% endif %}
    
    {% endif %}

    - require_in:
      - docker-package
{% endif %}
