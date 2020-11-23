alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias pip_upgrade_packages="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
