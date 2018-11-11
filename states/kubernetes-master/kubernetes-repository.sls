include:
  - kubernetes-master.kubernetes-packages

{% if grains['os'] == 'Ubuntu' %}
kubernetes-repository:
  pkgrepo.managed:
    - humanname: kubernetes repository
    
    {% if grains['lsb_distrib_release'] == '18.04'%}
    - name: deb http://apt.kubernetes.io/ kubernetes-xenial main
    {% elif grains['lsb_distrib_release'] == '16.04' %}
    - name: deb http://apt.kubernetes.io/ kubernetes-xenial main
    {% elif grains['lsb_distrib_release'] == '14.04' %}
    - name: deb http://apt.kubernetes.io/ kubernetes-trusty main
    {% endif %}
    
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - require_in:
      - kubernetes-packages
{% endif %}
