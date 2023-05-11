#Aceptar conexiones existentes
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#Aceptar localhost
iptables -A INPUT -i lo -j ACCEPT

# Loop device.
iptables -A INPUT -i lo -j ACCEPT

# http/https, smtp/smtps, pop3/pop3s, imap/imaps, ssh
iptables -A INPUT -p tcp -m multiport --dport 80,443,25,465,110,995,143,993,587,465,22 -j ACCEPT

# Allow PING from remote hosts.
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# ejabberd
iptables -A INPUT -p tcp -m multiport --dport 5222,5223,5280 -j ACCEPT

# http/https
iptables -A INPUT -p tcp -m multiport --dport 80,443 -j ACCEPT

# smtp/smtps
iptables -A INPUT -p tcp -m multiport --dport 25,465 -j ACCEPT

# pop3/pop3s
iptables -A INPUT -p tcp -m multiport --dport 110,995 -j ACCEPT

# imap/imaps
iptables -A INPUT -p tcp -m multiport --dport 143,993 -j ACCEPT

# ldap/ldaps
iptables -A INPUT -p tcp -m multiport --dport 389,636 -j ACCEPT

# ftp.
iptables -A INPUT -p tcp -m multiport --dport 21,20 -j ACCEPT

# ssh
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# DNS
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -p udp --sport 53 -j ACCEPT
# mysql
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3306 -j ACCEPT


iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP