{% for group, users in pillar.get('groups', {}).items() %}
group-{{ group }}-exists:
  group.present:
    - name: {{ pillar.get('groupnames', {grains['os']: group}).get(grains['os'], group) }}
    - members:
    {% for user in users %}
      - {{ user }}
    {% endfor %}
    - require:
      {% for user in users %}
      - user: {{ user }}
      {% endfor %}
{% endfor %}
