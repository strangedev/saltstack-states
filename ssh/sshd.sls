openssh-server:
  pkg.installed: []

sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://config/sshd_config

sshd:
  service.running:
    - require:
      - pkg: openssh-server
    - watch:
      - sshd_config
    - enable: True
