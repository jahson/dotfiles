# Completion
autoload -U compinit
compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "{$HOME}/.zsh_cache"
zmodload zsh/complist
zstyle ':completion:*' menu yes select

# case insensitive completion for cd
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

