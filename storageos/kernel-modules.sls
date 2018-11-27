{% if grains['os'] == 'Ubuntu' %}
linux-image-extra-virtual:
  pkg.installed:
    - refresh: True
{% endif %}

storageos-kernel-modules-loaded:
  cmd.run:
    - name: sh /usr/local/bin/storageos-load-kernel-modules.sh
    - runas: root
    {% if grains['os'] == 'Ubuntu' %}
    - require:
      - pkg: linux-image-extra-virtual
    {% endif %}
    - onchanges:
      - file: /usr/local/bin/storageos-load-kernel-modules.sh

/usr/local/bin/storageos-load-kernel-modules.sh:
  file.managed:
    - source: salt://sysadmin-scripts/storageos/load-kernel-modules.sh
    - mode: 755
