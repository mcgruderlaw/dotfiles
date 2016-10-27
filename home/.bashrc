#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"

#if [[ \$TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi

export EDITOR="vim"
export MANWIDTH=74
export BROWSER="firefox"
export BROWSERCLI="w3m"
export HISTIGNORE="clear:history"
export HISTCONTROL="ignoredups"
# export PAGER=/usr/local/bin/vimpager
export PAGER="less"
export CDPATH=$CDPATH:~/Downloads:~/Dropbox:~/Documents
export PYTHONPATH=$PYTHONPATH:~/usr/lib/python3.4/site-packages:~/usr/lib/python2.7/site-packages
export GIT_AUTHOR_NAME="David E. McGruder"
export GIT_COMMITTER_NAME="David E. McGruder"
PS1='[\u@\h \W]\$ '
complete -cf sudo
complete -cf man
[ -n "$XTERM_VERSION" ] # && transset-df --id "$WINDOWID" >/dev/null OR transset-df -a >/dev/null

#alsi archey3

# Modified Commands

# alias less=$PAGER
alias ...='../..'
alias 92='transset-df -a .92'
alias Agg='mux Agg'
alias am='alsamixer'
alias backup='sudo rsync -aAXv --progress --delete-before --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/var/lib/mpd/Music/*","/var/lib/transmission/Downloads/*","/home/*"} /* /media/Toshiba2/Backup'
alias Case='mux Case'
alias cases='cd ~/Documents/ofc/Cases'
alias c='clear'
alias cp='rsync --archive --human-readable --progress --verbose --whole-file'
alias clivid='sudo mplayer -vo fbpau -vc ffwmv3fbpau -fs -vf scale=800:-3'
alias drop='dropbox-cli start'
alias f='firefox &'
alias fj='firejail --seccomp firefox'
alias gits='git status'
alias homep2p='ssh mcgruderlaw@192.168.1.82'
alias homevbox='ssh mcgruderlaw@192.168.1.71'
alias lbg='xterm -bg white -fg blue &'
alias light='xrdb $HOME/.xresources/Xresources.light'
alias dark='xrdb $HOME/.xresources/Xresources.dark'
alias l='ls -lh --color=auto'
alias .l='ls -lah --color=auto'
alias ls='ls --color=auto'
# alias man='w3mman'
alias mountcd='sudo mount /dev/cdrom /media/cdrom'
alias mountT2='sudo mount -t ntfs-3g /dev/sdc1 /media/Toshiba2'
alias mountT='sudo mount -t ntfs-3g /dev/sdb1 /media/Toshiba'
alias myreflector='sudo reflector -c US -a 4 -f 5 -p http -p https -p ftp --sort rate --save /etc/pacman.d/mirrorlist'
alias nethome='sudo netctl start home'
alias network='sudo netctl start work'
alias rb='sudo reboot'
alias sb='source ~/.bashrc'
alias sd='sudo shutdown -P -h now'
alias Swedenstop='sudo systemctl stop pia@Sweden.service'
alias Sweden='sudo systemctl start pia@Sweden'
alias td='transmission-daemon'
alias Torontostop='sudo systemctl stop pia@CA_Toronto.service'
alias Toronto='sudo systemctl start pia@CA_Toronto.service'
alias trl='transmission-remote -l'
alias trsi='transmission-remote -si'
alias t='tmux -2'
alias vb='virtualbox &'
alias v='vim --servername VIMSERVER'
alias vs='vim --servername VIMSERVER --remote-silent'
alias wf='sudo wifi-menu'
alias x='startx'
alias xr='xcompmgrrestart.sh'
alias z='z.sh'
alias mountm='sudo sshfs dmc@23.124.50.217:/data/Media/Music /media/Music/ -p 39966'

# If you work with git, you've probably had that nagging sensation of not knowing what branch you are on. Worry no longer!

#export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

#export PS1='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'$base_color' '$stripe_one_col'⮀'$stripe_two_col'⮀'$end_stripe_col'⮀\[[0m\]'

# This will change your prompt to display not only your working directory but also your current git branch, if you have one. Pretty nifty!

# ~/code/web:beta_directory$ git checkout master
# Switched to branch "master"
# ~/code/web:master$ git checkout beta_directory
# Switched to branch "beta_directory"
# ~/code/web:beta_directory$ 

# gitprompt configuration

# Set config variables first
#GIT_PROMPT_ONLY_IN_REPO=1

# as last entry source the gitprompt script
# source ~/bash-git-prompt/gitprompt.sh

# the ultimate git ps1 bash prompt
source /usr/share/git/completion/git-prompt.sh
source ~/.bash_aliases


#Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

source /usr/share/git/completion/git-completion.bash


homeshick --quiet refresh

#powerline-daemon -q

#.  ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

# Set vim modes in bash, bind -P for available bindings
set -o vi

# change directories without cd
shopt -s autocd


# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    # vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    # -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    # -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# Functions 

#Automatically enter ssh passphrase; SSH Keys Arch Wiki
#if ! pgrep -u $USER ssh-agent > /dev/null; then
#    ssh-agent > ~/.ssh-agent-thing
#fi
#if [[ "$SSH_AGENT_PID" == "" ]]; then
#    eval $(<~/.ssh-agent-thing)
#fi
#ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
#
#today1() {
#        echo -n "Today's date is: "
#        date +"%A, %B %-d, %Y"
#}


# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}

# git commit
gitc() {
  git commit -m "$1"
}

recent() {
find $HOME/Documents/ -type f -regex ".*\.\(tex\|md\|txt\)" -mtime -$1 -not -path "*documents*" -exec vim "{}" +
}

gong() {
    at "$1" today << EOF
notify-send --expire-time=300000 "Time to go"
mpc -q toggle
mplayer -loop 10 /usr/lib/libreoffice/share/gallery/sounds/gong.wav
EOF
}

xcompmgr_restart() {
  killall xcompmgr
  sleep 1
  xcompmgr -r7 -o 0.25 -l-10 -t-8 -D7 &
}

w3c() {
		w3m -cookie -num $1
}


tra() {
		transmission-remote -a $1
}


trs() {
		transmission-remote -t$1 -s
}


trS() {
		transmission-remote -t$1 -S
}


ytstream() {
		mplayer -cookies -cookies-file /tmp/cookie.txt $(youtube-dl -f best -g --cookies /tmp/cookie.txt "$1")
}


yt2mp3() {
		youtube-dl -c --restrict-filenames --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $@
}


tara() {
		feh --image-bg black --scale-down ~/Downloads/tara
}

leah() {
		feh --image-bg black --scale-down ~/Downloads/leah
}
