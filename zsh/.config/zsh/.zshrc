autoload -U colors && colors
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

source "$ZDOTDIR/zsh-functions"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

zsh_add_file "zsh-vim-mode"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

setopt autocd

source $XDG_CONFIG_HOME/zsh/aliasrc
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zshnameddirrc"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# PS1=" %B%{$fg[red]%}%{$fg[yellow]%}%n%{$fg[green]%} %{$fg[magenta]%}%~%{$fg[red]%} "
PS1=" %B%{$fg[red]%}%{$fg[yellow]%}%n%{$fg[green]%} %{$fg[magenta]%}%~%{$reset_color%}%b "

# fm6000 -r --not_de --de=dwm --color=bright_cyan
# pfetch

source /usr/share/nvm/init-nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tarun/.local/share/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tarun/.local/share/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/tarun/.local/share/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/tarun/.local/share/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
