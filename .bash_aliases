alias Update="apt update && apt list --upgradable"
alias Install="sudo apt-get install"
alias Upgrade="sudo apt-get upgrade"
alias UpdateList="sudo apt list --upgradable"
alias List="apt list --installed"
alias Search="apt-cache search"
alias Show="apt show"
alias Autoremove="sudo apt-get autoremove"
alias Autoclean="sudo apt-get autoclean"
alias Purge="sudo apt-get --purge remove"

#Управление iptables
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# Выключение
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Directory
alias diskusage="df -h"
alias folderusage="du -ch"
alias totalfolderusage="du -sh"

# Архивы
alias tarc="tar czvf"            # Создать архив
alias tarx="tar xzvf"            # Извлечь архив
alias tart="tar tzvf"            # Показать содержимое архива

# Network
alias ping="ping -c4"
alias Ports="netstat -tulanp" # Показать открытые порты
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host" # Показать свой IP и Hostname

# Nginx 
alias ng.status='systemctl status nginx'
alias ng.reload='systemctl reload nginx'
alias ng.restart='systemctl restart nginx'
alias ng.test='/usr/sbin/nginx -t -c /etc/nginx/nginx.conf'
alias ng.dump='/usr/sbin/nginx -T -c /etc/nginx/nginx.conf'

# Systemctl
alias sc="systemctl"
alias Status="clear && systemctl status"         # (scsts nginx)
alias Start="systemctl start"
alias Reload="systemctl daemon-reload"
alias Restart="systemctl restart"
alias Stop="systemctl stop"
alias Enable="systemctl enable"
alias scisen="systemctl is-enabled"
alias Disable="systemctl disable"
alias sclist="systemctl list-unit-files | less" # Список служб
