modprobe nf_conntrack_ftp

#Limpiar firewall
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -Z
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# ssh
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# web/s
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 8443 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 8080 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 8443 -j ACCEPT

#samba
iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 139 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 445 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --sport 137 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --sport 138 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 139 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 445 -j ACCEPT
#cups
iptables -A INPUT -p tcp -m tcp --dport 631 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 631 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 631 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --sport 631 -j ACCEPT

# dns
iptables -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --sport 53 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --sport 53 -j ACCEPT

# subversion
iptables -A INPUT -p tcp -m tcp --dport 3690 -j ACCEPT

# ftp + active ftp + pasv ftp
iptables -A INPUT -p tcp --dport 21 -m state --state ESTABLISHED,NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 990 -m state --state ESTABLISHED,NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 989 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 50000:60000 -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT

# mysql
iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT

# ping cliente-servidor
# iptables -A INPUT -p icmp -j ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -j DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

#Restringir input
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
