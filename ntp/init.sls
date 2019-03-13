/etc/ntp.conf:
  file.managed:
    - source: salt://ntp/ntp.conf
    - require_in:
      - service: ntp

ntp:
  pkg.installed:
    - refresh: True
  servive.running:
    - enabled: True
    - require:
      - pkg: ntp

"hwclock --systohc":
  cmd.run:
    - require:
      - servive: ntp
    - watch:
      - service: ntp