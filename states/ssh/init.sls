openssh-server:
  pkg.installed: []

sshd:
  service.running:
    - require:
      - pkg: openssh-server
