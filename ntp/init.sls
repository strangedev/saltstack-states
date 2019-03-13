/etc/ntp.conf:
  file.managed:
    - source: salt://ntp/ntp.conf
    - require_in:
      - service: ntp

ntp:
  pkg.installed:
    - refresh: True
  service.running:
    - enable: True
    - require:
      - pkg: ntp

"hwclock --systohc":
  cmd.run:
    - require:
      - service: ntp
    - watch:
      - service: ntp