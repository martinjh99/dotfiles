source ~/.aliases
source ~/.zinit

autoload -Uz compinit
compinit

#Configure path and completions
path+=$HOME/.local/bin
export PATH
fpath=(~/.docker/completions \\$fpath)

#Configure History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
#completions setup
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion:*' rehash true

if command -v starship >/dev/null 2>&1; then
	eval "$(starship init zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
	source <(fzf --zsh)
fi
