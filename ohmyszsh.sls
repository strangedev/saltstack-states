curl:
  pkg.installed
zsh:
  pkg.installed

{% for user in pillar['users'] %}
ohmyzsh-{{user}}:
  cmd.run:
    - name: 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    - creates: '/home/{{user}}/.zshrc'
    - runas: {{user}}
    - require:
      - pkg: curl
      - pkg: zsh
chsh-zsh-{{user}}:
  user.present:
    - name: {{user}}
    - shell: /usr/bin/zsh
{% endfor %}

ohmyzsh-root:
  cmd.run:
    - name: 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    - creates: '/root/.zshrc'
    - runas: root
    - require:
      - pkg: curl
      - pkg: zsh
chsh-zsh-root:
  user.present:
    - name: root
    - shell: /usr/bin/zsh