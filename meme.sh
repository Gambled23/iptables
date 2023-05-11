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

#Restringir input

iptables -A INPUT -j DROP
#Restringir output

iptables -A OUTPUT -j DROP