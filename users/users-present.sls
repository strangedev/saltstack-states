{% for user, c in pillar.get('users', {}).items() %}
{{ user }}:
  user.present:
    - shell: {{ pillar.get('shell', '/bin/bash') }}
{% endfor %}
