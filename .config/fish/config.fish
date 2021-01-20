export BROWSER=brave
alias " q" exit
alias ":q" exit
alias python bpython
alias n nvim
alias p "picom -b"
abbr pms "sudo pacman -S"
abbr pmr "sudo pacman -R"

set PATH $PATH /home/tarun/.local/bin /var/lib/snapd/snap/bin
starship init fish | source
