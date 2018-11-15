git-user-present:
	user.present:
    - name: git

{% for user in pillar['git-users'] %}
salt-admin-{{ user }}:
  ssh_auth.present:
    - name: {{ user }}.git.id_rsa.pub
    - user: git
    - source: salt://ssh-keys/{{ user }}.id_rsa.pub
    - require:
      - user: {{ user }}
{% endfor %}
