{% for alumnus in pillar.get('alumni', []) %}
{{ alumnus }}:
  user.absent:
    - purge: true
{% endfor %}
