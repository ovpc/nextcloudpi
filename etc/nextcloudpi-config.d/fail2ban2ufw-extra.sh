#!/bin/bash
##name=fail2ban2ufw-extra.sh
#Copyleft 2018 by Oliver van Praag <oliver _at_ ovpso _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage:
# 
#   ./fail2ban2ufw-extra.sh needs to be executed by root with crontab
#
# ###add to root's crontab 
#30 6,18 * * * /home/ncp/bin/ufw-ipaddrlist4root.sh
# 
#

##reads banned IP's from fail2ban log, take 8th colum write to file
cat /var/log/fail2ban.log | grep Ban | awk '{print $8}' OFS='\t' > /home/ncp/bin/fail2ban2ufw4root.txt
#
sleep 1
##read from file and exec ufw insert 
while read IPADDR
do 
#######	echo "$IPADDR" ###This was for initial testing first part of script###
	/usr/sbin/ufw insert 1 deny from "$IPADDR"
done < /home/ncp/bin/fail2ban2ufw4root.txt


# License
#
# This script is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this script; if not, write to the
# Free Software Foundation, Inc., 59 Temple Place, Suite 330,
# Boston, MA  02111-1307  USA
