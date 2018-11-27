{% if grains['os'] == 'Ubuntu' %}
linux-image-extra-virtual:
  pkg.installed:
    - refresh: True
{% endif %}