#======================================================================#
# .bashrc
# Fichero de opciones del shell bash
#
# Electro7
# 31 ago. 2019
# Versión para archlinux
#======================================================================#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#----------------------------------------------------------------------#
# Prompt
#----------------------------------------------------------------------#

# Colores a utilizar
COLR="\[\033[0;31m\]" # Rojo
COLV="\[\033[0;32m\]" # Verde
COLA="\[\033[0;33m\]" # Amarillo
COLB="\[\033[0;34m\]" # Blue
COLP="\[\033[0;35m\]" # Purple
COLC="\[\033[0;36m\]" # Cyan
COLG="\[\033[0;37m\]" # Gray
COLN="\[\033[0m\]"    # Reset
COL="$COLC"           # Usuario normal

[[ "$UID" = "0" ]] && COL=$COLR # Rojo para root

# Título para las ventanas de consola en la X
XTITLE='\[\e]0;\h : \s (\w)\a\]'

# Añade retorno de carro y el cambio del titulo de la ventana al P1 actual
function __promptadd
{
  PS1="$XTITLE$PS1\n$COL \\$ $COLN"
}

# Prompt a traves de promptline.vim
# Es un plugin de VIM para crear un prompt con simbolos powerline.
# Entrar en vim y hacer un :PromptlineSnapShot ~/.shell_prompt.sh
function prompt_line
{
  source ~/bin/shell_prompt.sh
   PROMPT_COMMAND="$PROMPT_COMMAND; __promptadd;"
}

# Prompt "normal" sin carácteres raros
function prompt_term
{
  # Opciones para el git
  source /usr/share/git/completion/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWCOLORHINTS=1

  # Prompt final
  if [ -n "$SSH_CONNECTION" ]; then
    PS="$COLG┌[$COLB\h$COLG]─[$COLC\w$COLG]"
  else
    PS="$COLG┌[$COLC\w$COLG]"
  fi
  PSE="$COLG\n└ $COL\\$ $COLN"
  PROMPT_COMMAND='__git_ps1 "$XTITLE$PS" "$PSE" "─[$COLV"%s"$COLG]" '

  #PS1="$COLV--[$COLC\h$COLV]-[$COLA\w$COLV]$COLP\$(__git_ps1 ["%s"])\n$COL \\$ $COLN"
}

# Selección de prompt según el tipo de terminal
case "$TERM" in
  rxvt*)
    prompt_line
    ;;
  *)
    prompt_term
    ;;
esac

#----------------------------------------------------------------------#
# Colores
#----------------------------------------------------------------------#

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export LS_OPTIONS='--color=auto'
  alias l='ls $LS_OPTIONS'
  alias ll='ls $LS_OPTIONS -l -N -F'
  alias ls='ls $LS_OPTIONS -A -N -hF'
fi

alias lsmp3='ls -1 --indicator-style=none *.mp3'
alias lsepub='ls -1 -R --indicator-style=none | grep epub'
export GREP_COLOR="1;31"
alias grep='grep --color=auto'
export LESS="-R"

#----------------------------------------------------------------------#
# PATH
#----------------------------------------------------------------------#
export PATH="$PATH:$HOME/bin"

#----------------------------------------------------------------------#
# Variables variadas
#----------------------------------------------------------------------#

# Por defecto.
export EDITOR="vim"
export BROWSER="firefox"
#export QT_STYLE_OVERRIDE=GTK
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0

#----------------------------------------------------------------------#
# Alias
#----------------------------------------------------------------------#

#Alias WSL
alias start="/mnt/c/Windows/System32/cmd.exe /c "start""
alias s="start"
alias gv="start gvim.exe"

# Alias contra borrados accidentales.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Alias del shell
alias h='history'
alias v='vim'
alias vi='vim'
alias gv='gvim'
alias j="jobs -l"
alias psl='ps -aux | less'
alias ..='cd ..'
alias 'cd..'='cd ..'
alias df="df -h"
alias more='less'
alias du='du -h'

# Alias para el su (root)
alias reboot="sudo /sbin/reboot"
alias halt="sudo /sbin/poweroff"
alias poweroff="sudo /sbin/poweroff"
alias pacman="sudo pacman"

# Alias para las X
alias xvi="terminal vim"
alias xslrn="terminal slrn"
alias xmutt="terminal mutt"
alias xnetstat="terminal netstat"
alias xnetmasq="terminal netmasq"
alias xiptraf="terminal iptraf"
alias xbithcx="terminal bithcx"
alias xt="terminal"

# Alias del git
alias gia="git add"
alias gcm="git commit -a -m"
alias gp="git push"
alias gs="git status"

# Mis chuletas
alias chuleta="vim ~/.vim/doc/chuletario.txt"

# Cambio colores de terminal
alias col_dark="sh ~/.config/termcolours/dark.sh"
alias col_light="sh ~/.config/termcolours/light.sh"
alias col_default="sh ~/.config/termcolours/default.sh"

# Wifi on/off
alias wifi_on="sudo netctl start"
alias wifi_off="sudo netctl stop"
alias wifi_status="iw dev wlan0 info"
alias wifi_menu="wifi-menu"

# App varias
alias mldonkey="mldonkey -stdout -verbosity verb"
alias netload="speedometer -r eth0 -t eth0"
alias paclean="sudo pacman -S --clean --clean"

#----------------------------------------------------------------------#
# OTROS
#----------------------------------------------------------------------#

# Auto-completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Man coloreador - hay que instalar less
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Extraer comprimidos
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjvf $1    ;;
        *.tar.gz)    tar xzvf $1    ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xjvf $1    ;;
        *.tgz)       tar xzvf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Para que a los VT100 no se les fastidie el terminal con los colores
if [ $TERM = vt100 ]; then
  alias ls='ls -F --color=never';
fi

#----------------------------------------------------------------------#
# Jarvis
#----------------------------------------------------------------------#

export SYS="Debian"

#----------------------------------------------------------------------#
# SSH KEY
#----------------------------------------------------------------------#

# Borra temporal si existe
if [ `ps -ef | grep ssh-agent | grep -v grep | wc -l` -eq 0 ]; then
  rm -f /tmp/ssh-agent*
fi

# attempt to connect to a running agent, sharing over sessions (putty)
check-ssh-agent() {
  [ -S "$SSH_AUTH_SOCK" ] && { ssh-add -l >& /dev/null || [ $? -ne 2 ]; }
}

check-ssh-agent || export SSH_AUTH_SOCK=/tmp/ssh-agent.sock_$USER
check-ssh-agent || eval "$(ssh-agent -s -a /tmp/ssh-agent.sock_$USER)" > /dev/null

#Add identities if not exist
if [[ -n $(ssh-add -l | grep 'The agent has no identities') ]] ; then
  ssh-add 2> /dev/null
fi




# vim: ts=2:sw=2:
