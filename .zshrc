# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mshahomar/.zshrc'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

autoload bashcompinit && bashcompinit
#autoload -Uz compinit
#compinit
# End of lines added by compinstall
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(zoxide init zsh)"

## Enable VI-mode on ZSH
set -o vi

# Alias
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export PATH=/usr/local/bin/:$PATH
export PATH="$PATH:$HOME/go/bin"

export CURL_CA_BUNDLE=/usr/local/share/ca-certificates/bundled.pem
export AWS_CA_BUNDLE=/usr/local/share/ca-certificates/bundled.pem
export NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/bundled.pem
export SSL_CERT_FILE=/usr/local/share/ca-certificates/bundled.pem
export REQUESTS_CA_BUNDLE=/usr/local/share/ca-certificates/bundled.pem
#export NODE_TLS_REJECT_UNAUTHORIZED=0

## kubectl Krew (to install any kubectl plugin)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

## bun 
# bun completions -- make sure to install bun with curl -fsSL https://bun.sh/install | bash
[ -s "/Users/mshahomar/.bun/_bun" ] && source "/Users/mshahomar/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## AI related environment variables
# export OPENROUTER_API_KEY="my-openrouter-api-key"
# export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
# export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
# export ANTHROPIC_API_KEY="" # Must be explicitly empty to avoid conflicts

## Only on my WSL2
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source <(kubectl completion zsh)
complete -C '/usr/local/bin/aws_completer' aws
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
#To use fzf in Vim, add the following line to your .vimrc:
#  set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^U" backward-kill-line
bindkey "^]" kill-word


