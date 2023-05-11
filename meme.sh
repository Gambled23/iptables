#Limpiar iptables
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F

#Aceptar conexiones existentes
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
#Aceptar localhost
iptables -A INPUT -i lo -j ACCEPT

#HTTP y HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT 
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#ssh
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#DNS
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -p udp --sport 53 -j ACCEPT
#samba no funciona
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp --dport 138 -j ACCEPT
iptables -A INPUT -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
#ftp no funciona
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 20 -j ACCEPT
iptables -A INPUT -p tcp --dport 990 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 989 -j ACCEPT
#Activar ceritificado SSL
iptables -A INPUT -p tcp -m conntrack --ctstate NEW -m tcp -m multiport --dports 21,15000:15050 -j ACCEPT
#cups ipp no funciona
iptables -A INPUT -p tcp --dport 631 -j ACCEPT
iptables -A INPUT -p udp --dport 631 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 631 -j ACCEPT
iptables -A OUTPUT -p udp --sport 631 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 161 -j ACCEPT
iptables -A OUTPUT -p udp --sport 161 -j ACCEPT
#mysql
iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3306 -j ACCEPT

#Restringir input
iptables -P INPUT DROP
#Restringir output
iptables -P OUTPUT DROP