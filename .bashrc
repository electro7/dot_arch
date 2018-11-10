#======================================================================#
# .bashrc
# Fichero de opciones del shell bash
#
# Vicente Gimeno Morales - Electro7
# 02 nov 2018
# Versión para archlinux
#======================================================================#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#----------------------------------------------------------------------#
# Prompt
#----------------------------------------------------------------------#

# Colores a utilizar
COLV="\[\033[0;32m\]" # Verde
COLC="\[\033[0;36m\]" # Cyan
COLA="\[\033[0;33m\]" # Amarillo
COLB="\[\033[0;34m\]" # Blue
COLP="\[\033[0;35m\]" # Purple
COLR="\[\033[0;31m\]" # Rojo
COLN="\[\033[0m\]"	  # Reset

# Colores según usuario
COL="$COLC"						# Usuario normal
[[ "$UID" = "0" ]] && COL=$COLR	# Rojo para root

# Añade retorno de carro y el cambio del titulo de la ventana al P1 actual
function __promptadd
{
	XTITLE='\[\e]0;\s (\w)\a\]'
	PS1="$XTITLE$PS1\n$COL \\$ $COLN"
}

# Prompt a traves de promptline.vim
# Es un plugin de VIM para crear un prompt con simbolos powerline.
# Entrar en vim y hacer un :PromptlineSnapShot ~/.shell_prompt.sh
function prompt_line
{
    source ~/.shell_prompt.sh
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

    # Prompt final
	PROMPT_COMMAND=""
	PS1="$COLV--[$COLC\h$COLV]-[$COLA\w$COLV]\$(__git_ps1)\n$COL \\$ $COLN"
}

# Selección de prompt según el tipo de terminal
case "$COLORTERM" in
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
#export QT_STYLE_OVERRIDE=adwaita-dark
export QT_QPA_PLATFORMTHEME=qt5ct

#----------------------------------------------------------------------#
# Alias
#----------------------------------------------------------------------#

# Alias contra borrados accidentales.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Alias de limpieza
alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "¿Desea borrar todos los ficheros temporales (s/N)? ";
	read si;
	if test "$si" = "y" -o "$si" = "s" ; then
	rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	echo "Hecho.";
	else
	echo "Cancelado.";
	fi'

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

# Alias para el su (root)
alias reboot="sudo /sbin/reboot"
alias halt="sudo /sbin/poweroff"
alias poweroff="sudo /sbin/poweroff"
alias xcdroast="sudo /usr/bin/xcdroast"
alias gtkam="sudo /usr/bin/gtkam"
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
# MI LOGO
#----------------------------------------------------------------------#

#case "$TERM" in
#xterm*|rxvt*)
#  if [ -f $HOME/bin/archey ]; then $HOME/bin/archey ; fi
#	;;
#*)
#	;;
#esac

#----------------------------------------------------------------------#
# SSH KEY
#----------------------------------------------------------------------#

# attempt to connect to a running agent, sharing over sessions (putty)
#check-ssh-agent() {
#    [ -S "$SSH_AUTH_SOCK" ] && { ssh-add -l >& /dev/null || [ $? -ne 2 ]; }
#}

#check-ssh-agent || export SSH_AUTH_SOCK=/tmp/ssh-agent.sock_$USER
#check-ssh-agent || eval "$(ssh-agent -s -a /tmp/ssh-agent.sock_$USER)" > /dev/null

#Add identities if not exist
#if [[ -n $(ssh-add -l | grep 'The agent has no identities') ]] ; then
#  ssh-add 2> /dev/null
#fi

