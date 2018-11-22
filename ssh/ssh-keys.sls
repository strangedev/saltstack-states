{% for user in pillar['users'] %}
ssh-access-{{ user }}:
  ssh_auth.present:
    - name: {{ user }}.id_rsa.pub
    - user: {{ user }}
    - source: salt://ssh-keys/{{ user }}.id_rsa.pub  
{% endfor %}

{% for user in pillar['alumni'] %}
ssh-access-{{ user }}-removed:
  ssh_auth.absent:
    - name: {{ user }}.id_rsa.pub
    - user: {{ user }}
    - source: salt://ssh-keys/{{ user }}.id_rsa.pub
{% endfor %}
