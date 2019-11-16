curl:
  pkg.installed

'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"':
  cmd.run:
    - creates: '/home/{{user}}/.zshrc'
    - runas: {{user}}
     