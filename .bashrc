# ~/.bashrc: executed by bash(1) for non-login shells.

#!/bin/bash
# Библиотека цветов https://wiki.archlinux.org/index.php/Bash/Prompt_customization_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
# Функции и прочие примеры http://dotshare.it/category/shells/bash/
# Цвета папок dircolors https://github.com/trapd00r/LS_COLORS

alias python='/usr/bin/python3.7'

# Сброс
Color_Off='\e[0m'       # Text Reset

# Обычные цвета
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Жирные
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Подчёркнутые
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Фоновые
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# Высоко Интенсивные
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Жирные Высоко Интенсивные
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# Высоко Интенсивные фоновые
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

### DEFINE THE ACTION FOR THE HOME/END/DELETE/INSERT KEYS
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" overwrite-mode
# type cat in a terminal, then pressing the keys will give you the right number to use

# Задаем параметры истории и отображения
export HISTIGNORE="&:ls:[bf]g:exit:history*"
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
export HISTSIZE=30000
export HISTFILESIZE=30000
export HISTTIMEFORMAT='%d.%m.%Y '
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Автодополнение bash-completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Функция вывода списка всех задач cron у всех пользователей
function allcrontab() {
     for user in $(cut -d':' -f1 /etc/passwd); do
          usercrontab=$(crontab -l -u ${user} 2>/dev/null)
          if [ -n "${usercrontab}" ]; then
               echo -e "${RED}====== Start crontab for user ${NC}${GREEN}${user}${NC} ${RED}======${NC}"
               crontab -l -u ${user} | sed '/ *#/d; /^ *$/d'
               echo -e "${RED}====== End crontab for user ${NC}${GREEN}${user}${NC} ${RED}========${NC}\n"
          fi
     done
}

# Файл с алиасами
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi 

# Задаем приглашение для пользователя и опеределение рута
if [ `id -un` = root ]; then
  PS1="┌ ${Red}\u${Color_Off} [${BPurple}\w${Color_Off}] \n└─ \$ "
 else
  PS1="┌ ${Green}\u${Color_Off} [${BPurple}\w${Color_Off}] \n└─ \$ "
fi

### BASH OPTIONS
  # \$ - specifies whether the user is root (#) or otherwise ($)
  # \d – date (day/month/date)
  # \h – hostname (short)
  # \H – full hostname (domain name)
  # \j – number of jobs being managed by the shell
  # \l – the basename of the shells terminal device
  # \r – carriage return
  # \s – the name of the shell
  # \t – time (hour:minute:second)
  # \A – time, 24-hour, without seconds
  # \u – current username
  # \v – bASH version
  # \V – extra information about the BASH version
  # \w – current working directory ($HOME is represented by ~)
  # \W – the basename of the working directory ($HOME is represented by ~)
  # \[ – start a sequence of non-displayed characters (useful if you want to add a command or instruction set to the prompt)
  # \] – close or end a sequence of non-displayed characters

# Предотвращает случайное удаление файлов.
alias mkdir='mkdir -p'

# Подключаем dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Цвета auto
alias ls='ls -a --color=auto'
alias dmesg='dmesg --color=auto'
alias gcc='gcc -fdiagnostics-color=auto'
alias dir='dir --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Раскрашиваем man
export LESS_TERMCAP_mb=$'\e[0;36m'      # начало мигания (Cyan)
export LESS_TERMCAP_md=$'\e[1;36m'	# начало жирного шрифта (BCyan)
export LESS_TERMCAP_me=$'\e[0m'         # сброс (Color_Off)
export LESS_TERMCAP_se=$'\e[0m'         # сброс выделения (Color_Off)
export LESS_TERMCAP_so=$'\e[0;36m'      # начало выделения - информация (Cyan)
export LESS_TERMCAP_ue=$'\e[0m'         # конец подчеркивания (Color_Off)
export LESS_TERMCAP_us=$'\e[0;93m'      # начало подчеркивания (IYellow)

# Алиасы LS
alias ll='ls -alF'              # показать скрытые файлы с индикатором
alias la='ls -Al'               # показать скрытые файлы
alias lx='ls -lXB'              # сортировка по расширению
alias lk='ls -lSr'              # сортировка по размеру
alias lc='ls -lcr'              # сортировка по времени изменения
alias lu='ls -lur'              # сортировка по времени последнего обращения
alias lr='ls -lR'               # рекурсивный обход подкаталогов
alias lt='ls -ltr'              # сортировка по дате
alias lm='ls -al |more'         # вывод через 'more'

#Gotop. Диспетчер задач Linux
alias gotop='gotop -c monokai'

# Env для Python
export PATH="$PATH:/$USER/.local/bin"

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Функция распаковки extract
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)   tar xvjf ./$1    ;;
                *.tar.gz)    tar xvzf ./$1    ;;
                *.tar.xz)    tar xvJf ./$1    ;;
                *.lzma)      unlzma ./$1      ;;
                *.bz2)       bunzip2 ./$1     ;;
                *.rar)       unrar x -ad ./$1 ;;
                *.gz)        gunzip ./$1      ;;
                *.tar)       tar xvf ./$1     ;;
                *.tbz2)      tar xvjf ./$1    ;;
                *.tgz)       tar xvzf ./$1    ;;
                *.zip)       unzip ./$1       ;;
                *.Z)         uncompress ./$1  ;;
                *.7z)        7z x ./$1        ;;
                *.xz)        unxz ./$1        ;;
                *.exe)       cabextract ./$1  ;;
                *)           echo "extract: '$1' - неизвестный архив" ;;
            esac
        else
            echo "$1 - файл не существует"
        fi
    fi
}
