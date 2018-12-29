samba:
  pkg.installed:
    - refresh: True

smb.conf-present:
  file.managed:
    - name: /etc/samba/smb.conf
    - source: salt://samba/smb.conf
    - require:
      - pkg: samba

shares-configured:
  file.append:
    - name: /etc/samba/smb.conf
    - sources:
      {% for share in pillar['samba-shares'] %}
      - salt://samba/{{ share }}.conf
      {% endfor %}
    - require:
      - smb.conf-present

/srv/samba:
  file.directory:
    - user: nobody
    - group: nogroup
    - dir_mode: 644
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

smbd:
  service.running:
    - enable: True
    - watch:
      - file: /etc/samba/smb.conf
    - require:
      - file: /srv/samba