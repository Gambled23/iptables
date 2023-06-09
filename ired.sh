#---------------------------------------------------------------------
# This file is part of iRedMail, which is an open source mail server
# solution for Red Hat(R) Enterprise Linux, CentOS, Debian and Ubuntu.
#
# iRedMail is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# iRedMail is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with iRedMail.  If not, see <http://www.gnu.org/licenses/>.
#---------------------------------------------------------------------

#
# Sample iptables rules. It should be localted at:
#   /etc/sysconfig/iptables
#
# Shipped within iRedMail project:
#   * http://iRedMail.googlecode.com/
#

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

# Keep state.
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Loop device.
-A INPUT -i lo -j ACCEPT

# http/https, smtp/smtps, pop3/pop3s, imap/imaps, ssh
-A INPUT -p tcp -m multiport --dport 80,443,25,465,110,995,143,993,587,465,22 -j ACCEPT

# Allow PING from remote hosts.
-A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# ejabberd
-A INPUT -p tcp -m multiport --dport 5222,5223,5280 -j ACCEPT

# http/https
#-A INPUT -p tcp -m multiport --dport 80,443 -j ACCEPT

# smtp/smtps
#-A INPUT -p tcp -m multiport --dport 25,465 -j ACCEPT

# pop3/pop3s
#-A INPUT -p tcp -m multiport --dport 110,995 -j ACCEPT

# imap/imaps
#-A INPUT -p tcp -m multiport --dport 143,993 -j ACCEPT

# ldap/ldaps
-A INPUT -p tcp -m multiport --dport 389,636 -j ACCEPT

# ftp.
-A INPUT -p tcp -m multiport --dport 21,20 -j ACCEPT

# ssh
-A INPUT -p tcp --dport 22 -j ACCEPT

COMMIT