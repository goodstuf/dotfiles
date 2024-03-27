export BASHDIR=$HOME/.config/bash
source $BASHDIR/bashrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$ZDOTDIR/cache/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$ZDOTDIR/cache/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$XDG_CACHE_HOME/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e

autoload -Uz compinit promptinit
compinit
promptinit

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
# This will set the default prompt to the walters theme
prompt redhat

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char

# For enabling autocompletion of privileged environments in privileged commands 
# (e.g. if you complete a command starting with sudo, completion scripts will 
# also try to determine your completions with sudo)
zstyle ':completion::complete:*' gain-privileges 1

zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

CASE_SENSITIVE="false"
COMPLETION_WAITING_DOTS=true
COMPLETION_WAITING_DOTS="%F{red}Executing...%f"


# ZSH plugins
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/gradle-zsh-completion/gradle-completion.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/p10k.zsh ]] || source $ZDOTDIR/p10k.zsh

