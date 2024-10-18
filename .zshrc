source ~/dotfiles/submodule/grml-etc-core/etc/zsh/zshrc

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=8192
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# grml prompt off
prompt off

PROMPT='%F{black}%K{white}%m:%~ %#%f%k '

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

source ~/dotfiles/submodule/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/submodule/zsh-completions/zsh-completions.plugin.zsh
source ~/dotfiles/submodule/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/dotfiles/submodule/zsh-kubectl-prompt/kubectl.zsh
source ~/dotfiles/submodule/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
RPROMPT='%F{blue}($ZSH_KUBECTL_PROMPT)%f'$RPROMPT

# grml prompt override
PS1=$PROMPT
RPS1=$RPROMPT

stty -ixon
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Environment variables
export EDITOR=vim

export DENO_INSTALL="$PWD/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
