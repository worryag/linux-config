# Path для поиска командой cd: то есть вместо cd $HOME/docs/editors/
# можно набирать просто cd editors
#export GNUPGHOME="~/.config/gnupg"
export LANG=ru_RU.utf8
cdpath=(~/documents ~/downloads ~/code ~/music ~/videos)

PATH=/bin:/sbin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/pgsql/bin:/usr/games:/X11R6/bin:/opt/open64-5.0/bin:/opt/intel/vtune_amplifier_xe_2015.3.0.403110/bin64:/opt/intel/inspector_xe_2015.1.2.379161/bin64:/opt/intel/advisor_xe_2015.1.10.380555/bin64:/opt/intel/bin

INFOPATH=/usr/share/info:/usr/local/share/info
autoload -U colors && colors
# Forth path
export IFORTH=~/src/dfwforth
export IFORTHBIN=~/src/dfwforth/iflinux/linux-bin/iforth.img
export IFORTHBIN64=~/src/dfwforth/iflinux/linux-bin64/iforth.img

# export PATH=${PATH}:~/android/platform-tools

setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber hist_ignore_all_dups
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash



# История
setopt APPEND_HISTORY           # Дополнение файла истрии
setopt HIST_IGNORE_SPACE        # Игнopupoвaть лишние пpoбeлы
setopt HIST_REDUCE_BLANKS       # Удалять из файл истории пустые строки
setopt HIST_IGNORE_ALL_DUPS     # Игнopupoвaть вce пoвтopeнuя команд
setopt INC_APPEND_HISTORY       # обеспечивает инкрементное наполнение файла истории
                                # команды помещаются в него по мере их ввода и исполнения, а не по завершении сеанса.

HISTFILE=~/.history
SAVEHIST=500000
HISTSIZE=500000

# Установка атрибутов доступа для
# вновь создаваемых файлов
umask 0077

# автоматическое завершение имен файлов по нажатию клавиши Tab
autoload -U compinit
compinit

autoload -U promptinit
promptinit

# zsh-syntax-highlighting подсветка синтаксиса install pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ALIAS
alias ec='emacsclient -nc -a ""'
alias et='emacsclient -nw -a ""'
alias sudo="nocorrect sudo"
alias yll="sudo yaourt -Syua"
alias df="df -h"
alias du='du -k --total --human-readable'
alias service="sudo systemctl"
alias pi="sudo pacman -S"
alias psyu="sudo pacman -Syu"
alias get="wget -c"
alias getweb="wget -c -r --no-parent -l 10 -k -E -p"
alias less='less -M' # представление вывода less в more-подобном виде (с именем файла и процентом вывода)
alias pgg="ping 8.8.8.8"
alias ls="ls --color"            # always show color

alias -s {avi,mpeg,mpg,mov,m2v}=vlc
alias -s {odt,doc,sxw,rtf}=openoffice.org
alias -s {ogg,mp3,wav,wma,flac}=deadbeef
alias -s {pdf,djvu,ps,ps.gz}=evince
# Пути к манам
manpath=”/usr/man:/usr/share/man:/usr/local/man:/usr/X11R6/man:/opt/qt/doc”
export MANPATH

# Цветной man
export LESS_TERMCAP_mb=$'\E[01;31m'       # начала мигающего '
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # начало жирного текста '
export LESS_TERMCAP_me=$'\E[0m'           # окончание '
export LESS_TERMCAP_so=$'\E[38;5;246m'    # начала текста в инфобоксе '
export LESS_TERMCAP_se=$'\E[0m'           # конец его '
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # начало подчеркнутого
export LESS_TERMCAP_ue=$'\E[0m'           # конец подчеркнутого '

# Editor
 export EDITOR="mcedit"
 export VISUAL="mcedit"

# KEY
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search


if [[ $EUID == 0 ]]
    then
       PROMPT=$'%{\e[1;31m%}%n %{\e[1;34m%}%~ #%{\e[0m%} ' # user dir %
    else
       PROMPT=$'%{\e[1;32m%}%n %{\e[1;34m%}%~ %#%{\e[0m%} ' # root dir #
fi
RPROMPT=$'%{\e[1;34m%}%T%{\e[0m%}' # right prompt with time '


## фУНКЦИИ
kp () ## Завершает программу ( процесс) по его имени
{
	local pid
	pid=$(ps -ax | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "killing $1 (process $pid)..."
	kill -9 $=pid
	echo "slaughtered."
}

repogen ()
{
    rm /etc/pacman.d/mirrorlist
    sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.pacnew
    rankmirrors -n 6 /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.tar.xz)  tar xvfJ $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' Нет возможности распаковать этот файл" ;;
    esac
  else
    echo "'$1' Нет такого файла"
  fi
}
