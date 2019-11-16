base:  # 'base' environment
  '*':
    - ohmyzsh
    - ssh
    - editor
    - users

  'static.213.34.69.159.clients.your-server.de':  # salt master
    - git-remote

  '*34.69.159*':  # test servers
    - docker
