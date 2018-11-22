{% for user in pillar['users'] %}
ssh-access-{{ user }}:
  ssh_auth.present:
    - name: {{ user }}.id_rsa.pub
    - user: {{ user }}
    - source: salt://ssh-keys/{{ user }}.id_rsa.pub  
{% endfor %}
