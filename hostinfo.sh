#!/bin/bash

# Color variables
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'

# Clear the color
clear='\033[0m'


# Get public ip
PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`

echo -e "Public Ip:  ${green}$PUBLIC_IP${clear}"
dnsips=$(sed -e '/^$/d' /etc/resolv.conf | awk '{if (tolower($1)=="nameserver") print $2}')
echo -e "Hostname : ${green}$(hostname -s)${clear}"
echo -e "DNS domain : ${green}$(hostname -d)${clear}"
echo -e "Fully qualified domain name : ${green}$(hostname -f)${clear}"
echo -e "Network address (IP) : ${blue}$(hostname -i)${clear}"
echo -e "DNS name servers (DNS IP) : ${blue}${dnsips}${clear}"
