base:  # 'base' environment
  '*':
    - ohmyzsh
    - ssh
    - editor
    - users

  '*swarm*':
    - docker