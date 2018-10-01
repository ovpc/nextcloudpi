#!/bin/bash
##name=fail2ban2ufw-extra.sh
##reads from fail2ban log, take 8th colum write to file
cat /var/log/fail2ban.log | grep Ban | awk '{print $8}' OFS='\t' > /home/ncp/bin/fail2ban2ufw4root.txt
#
sleep 1
##read from file and exec ufw insert 
while read IPADDR
do 
#######	echo "$IPADDR"
	/usr/sbin/ufw insert 1 deny from "$IPADDR"
done < /home/oliver/bin/fail2ban2ufw4root.txt
###add to root crontab 
#30 6,18 * * * /home/ncp/bin/ufw-ipaddrlist4root.sh
