# ~/.bashrc

[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

#xhost +local:root > /dev/null 2>&1

#complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
#shopt -s checkwinsize

#shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Custom prompt
PS1="\[\033[32m\][\w] \[\033[31m\]\$\[\033[00m\] "

# Vim mode
set -o vi

# Aliases

# Package managers
alias p="pacman"
alias sp="sudo pacman"
# Edit
alias e="$EDITOR"
alias se="sudo $EDITOR"
alias ee="$EDITOR ~/.config/nvim/init.vim"
alias eb="$EDITOR ~/.bashrc"
# git
alias g="git"
alias gr='cd $(git rev-parse --show-toplevel || echo ".")'
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
# Arduino
alias ard="arduino-cli"
# ls
alias ls="ls -hN --color=auto --group-directories-first"
alias la="ls -AhN --color=auto --group-directories-first"
alias ll="ls -lhN --color=auto --group-directories-first"
alias lla="ls -AlhN --color=auto --group-directories-first"
# grep
alias grep="grep --color=auto"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"
# Other conveniences
alias cp="cp -i"
alias df="df -h"
alias free="free -m"
alias ..="cd .."
alias i="setsid sxiv -ab"
alias m="setsid mpv --no-terminal"
alias z="setsid zathura"
alias f="$FILE_CLI"
alias c="xclip -selection clipboard"
## Internet
alias yt="youtube-dl --add-metadata -c" # Download videos
alias yta="youtube-dl --add-metadata -cx" # Download audio

# Disables Ctrl-S which freezes the terminal
bind -r '\C-s'
stty -ixon

# Use git tab completion
. /usr/share/bash-completion/completions/git
