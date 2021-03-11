alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias pip_upgrade_packages="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

if command -v bat &>/dev/null; then
    bat_command=bat
elif command -v batcat &>/dev/null; then # for Debian
    bat_command=batcat
fi

if [ -n "$bat_command" ]; then
    alias less=$bat_command
    alias cat=$bat_command
fi
