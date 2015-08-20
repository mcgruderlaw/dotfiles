#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


PATH=$PATH:~/.cabal:~/.cabal/bin:~/.vim:~/.w3m:~/bin:~/local:~/local/bin
export PATH
export LANG=en_US.UTF-8
export TERM=xterm-256color
export TERM=xterm-256color

unset PROMPT_COMMAND

# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] # && exec startx
