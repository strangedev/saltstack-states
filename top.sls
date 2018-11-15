base:  # 'base' environment
  '*':
    - ssh
    - editor
    - users

  'k8s-worker':
    - docker
    #- kubernetes-worker

  'k8s-master*':
    - docker
    - kubernetes-master
