# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shahomar/.zshrc'

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

# Alias
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

export PATH=/usr/local/bin/:$PATH
#export PATH=$PATH:/usr/local/go/bin
export CURL_CA_BUNDLE=/usr/local/share/ca-certificates/bundled.pem
export AWS_CA_BUNDLE=/usr/local/share/ca-certificates/bundled.pem
export NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/bundled.pem
export SSL_CERT_FILE=/usr/local/share/ca-certificates/bundled.pem
export REQUESTS_CA_BUNDLE=/usr/local/share/ca-certificates/bundled.pem
#export NODE_TLS_REJECT_UNAUTHORIZED=0

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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
