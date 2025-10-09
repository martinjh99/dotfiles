path+=$HOME/.local/bin
export PATH
fpath=(~/.docker/completions \\$fpath)
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion:*' rehash true


alias ls='ls --color=auto'
alias lsl='ls -ahl'
alias df='df -h'
alias du="du -h --max-depth=1 ."
alias ip="ip -br -c a"
alias dc="docker compose"
alias dls="docker ps"
alias di="docker images"

export EDITOR=nvim




### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit load 'zsh-users/zsh-history-substring-search'
zinit ice wait atload'_history_substring_search_config'

### Use history substring search
source ~/.local/share/zinit/plugins/zsh-users---zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### oh my posh install and setup
### Install oh-my-posh if cache directory not found
if [[ ! -d /home/martin/.cache/oh-my-posh ]]; then
    curl -s https://ohmyposh.dev/install.sh | bash -s
fi

eval "$(oh-my-posh init zsh --config ~/.martin.omp.yaml)"
#eval "$(oh-my-posh init zsh --config sonicboom_dark)"
