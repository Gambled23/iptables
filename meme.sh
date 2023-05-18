#Limpiar firewall
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -Z

#Aceptar conexiones existentes
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
#Aceptar localhost
iptables -A INPUT -i lo -j ACCEPT

#DNS
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -p udp --sport 53 -j ACCEPT
# HTTP Y HTTPS no funca al 100
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 8443 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 8080 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 8443 -j ACCEPT
#ftp y ftps no funca al 100 cosa de nftables
iptables -A INPUT -p tcp -m multiport --dport 21,20,990,989 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --dport 21,20,990,989 -j ACCEPT
#nginx
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 8080 -j ACCEPT
#ssh
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#samba
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp --dport 138 -j ACCEPT
iptables -A INPUT -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
iptables -A OUTPUT -p udp --sport 137 -j ACCEPT
iptables -A OUTPUT -p udp --sport 138 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 139 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 445 -j ACCEPT
#cups
iptables -A INPUT -p tcp --dport 631 -j ACCEPT
iptables -A INPUT -p udp --dport 631 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 631 -j ACCEPT
iptables -A OUTPUT -p udp --sport 631 -j ACCEPT
#mysql no funca al 100
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3306 -j ACCEPT
iptables -A INPUT -p udp --dport 3306 -j ACCEPT
iptables -A OUTPUT -p udp --sport 3306 -j ACCEPT
#mariadb
iptables -A INPUT -p tcp --dport 3307 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3307 -j ACCEPT
iptables -A INPUT -p udp --dport 3307 -j ACCEPT
iptables -A OUTPUT -p udp --sport 3307 -j ACCEPT
#iredmail (imap, smtp, pop, ldap, etc etc etc son como 800 puertos)
iptables -A INPUT -p tcp -m multiport --dport 110,995,143,993,25,5280,587,5222,5223,465,389,636 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sport 110,995,143,993,25,5280,587,5222,5223,465,389,636 -j ACCEPT

#Activar ceritificado SSL
iptables -A INPUT -p tcp -m conntrack --ctstate NEW -m tcp -m multiport --dports 21,15000:15050 -j ACCEPT

#Permitir ping
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type 0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#Restringir input
iptables -P INPUT DROP
#Restringir output
iptables -P OUTPUT DROP