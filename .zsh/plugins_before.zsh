# External plugins installation (before).
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions", from:github, defer:0
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:0

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
