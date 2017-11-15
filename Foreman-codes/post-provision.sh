
#The script is getting executed as root

echo -e "\n ~~~~ User level Access ~~~~ "

if [ $(id -u) == "0" ]; then echo -e "\nLogged in as root" && echo -e "Access check: $(echo -e "\033[32mPassed*\033[0m")"; else echo -e "\nError: You are not root. You do not have required permissions to proceed"; echo "Access Check: $(echo -e "\033[31mFailed*\033[0m")"; exit; fi

#If host entry exit

echo -e "\n ~~~~ Host file check ~~~~ "

if [ -n "$(grep `hostname -i` /etc/hosts)" ] && [ -n "$(grep `hostname -f` /etc/hosts)" ] && [ -n "$(grep `hostname -s` /etc/hosts)" ]; then echo -e "\nSpacewalk entry exist.. \n$(echo -e "Hosts File Entry Check: \033[32mPassed*\033[0m")"; else
echo -e "\nHosts File Entry Check: \033[31mFailed*\033[0m"
echo "`hostname -i`    `hostname -f`  `hostname -s`" >> /etc/hosts
echo -e "\nUpdating /etc/hosts"
sleep 1
echo -e "Re-Initializing check.. \nHosts File Entry Check: $(echo -e "\033[32mPassed*\033[0m")"
fi



#If Spacewalk server entry exist

echo -e "\n ~~~~ Spacewlk Host file check ~~~~ "

if [ -n "$(grep spacewalkprod /etc/hosts)" ]; then echo -e "\nSpacewalk entry exist.. \n$(echo -e "Hosts File Entry Check: \033[32mPassed*\033[0m")"; else 
echo -e "\nHosts File Entry Check: \033[31mFailed*\033[0m"
echo "192.168.133.123    spacewalkprod.testlab.local  spacewalkprod" >> /etc/hosts
echo -e "\nUpdating /etc/hosts"
sleep 1
echo -e "Re-Initializing check.. \nHosts File Entry Check: $(echo -e "\033[32mPassed*\033[0m")"
fi

#bind utils installation

echo -e "\n ~~~~ Bind utility Package Installation ~~~~ "

if rpm -qa | grep bind-utils > /dev/null; then echo -e "\nBind - Utils already installed, Skipping. \n$(echo -e "Bind package installation check: \033[32mPassed*\033[0m")"; else echo  -e "$(echo -e "\nBind package installation check: \033[31mFailed*\033[0m") \n*Installing the bind-utils package... " && yum -d 0 -e 0 -y install bind-utils; if [[ $? -eq 0 ]]; then echo -e "\n*Successfully Installed bind Utils.." && sleep 1 && echo -e "\nRe-Initializing package test..  \nBind-Utils check: $(echo -e "\033[32mPassed*\033[0m")"; else echo "Something went wrong,Aborting the installation.."; exit 1; fi;fi


#DNS Entry

echo -e "\n ~~~~ Resolv.conf ~~~~ "

if [ -n "$(grep testlab.local /etc/resolv.conf)" ] && [ -n "$(grep 192.168.133.210 /etc/resolv.conf)" ] && [ -n "$(grep 192.168.133.211 /etc/resolv.conf)" ]; then echo -e "\nInitializing resolv.conf entry test..  \nResolv.conf entry check: $(echo -e "\033[32mPassed*\033[0m")"
else
echo -e "\nresolv.conf check: \033[31mFailed*\033[0m"
cat <<EOF> /etc/resolv.conf
search testlab.local
nameserver 192.168.133.210
nameserver 192.168.133.211
EOF
echo -e "\nUpdating resolv.conf.."
sleep 1
echo -e "Re-Initializing check.. \nResolv.conf entry check: $(echo -e "\033[32mPassed*\033[0m")"
fi

#DNS Resolution

echo -e "\n ~~~~ Forward Lookup ~~~~ "

nslookup spacewalkprod > /dev/null;  if [[ $? -ne 0 ]]; then echo -e "\nDNS Resolution: Unable to resolve Forward Lookup, Either the server is down or the entry is missing \nDNS Resolution Check (Forward Lookup): $(echo -e "\033[31mFailed*\033[0m")"; else echo -e "\nDNS Resolved..\nDNS Resolution check (Forward Lookup): $(echo -e "\033[32mPassed*\033[0m")"; fi

echo -e "\n ~~~~ Reverse Lookup ~~~~ "

nslookup 192.168.133.123 > /dev/null;  if [[ $? -ne 0 ]]; then echo -e "\nDNS Resolution: Unable to resolve Reverse Lookup, Either the server is down or the entry is missing \nDNS Resolution Check (Reverse Lookup): $(echo -e "\033[31mFailed*\033[0m")"; else echo -e "\nDNS Resolved..\nDNS Resolution check (Reverse lookup): $(echo -e "\033[32mPassed*\033[0m")"; fi



clear
root_access=`if [ $(id -u) == "0" ]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
host_file_entry=`if [ -n "$(grep $(hostname -i) /etc/hosts)" ] && [ -n "$(grep $(hostname -f) /etc/hosts)" ] && [ -n "$(grep $(hostname -s) /etc/hosts)" ]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
spacewalk_host_entry=`if [ -n "$(grep spacewalkprod /etc/hosts)" ]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
bind_install=`if rpm -qa | grep bind-utils > /dev/null; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
resolv_entry=`if [ -n "$(grep testlab.local /etc/resolv.conf)" ] && [ -n "$(grep 192.168.133.210 /etc/resolv.conf)" ] && [ -n "$(grep 192.168.133.211 /etc/resolv.conf)" ]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
forward_lookup=`nslookup spacewalkprod > /dev/null;  if [[ $? -eq 0 ]]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
host_entry=i`if [ -n "$(grep $(hostname -i) /etc/hosts)" ] && [ -n "$(grep $(hostname -f) /etc/hosts)" ] && [ -n "$(grep $(hostname -s) /etc/hosts)" ]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
reverse_lookup=`nslookup 192.168.133.123 > /dev/null;  if [[ $? -eq 0 ]]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
monitoring_check=`netstat -nlp | grep -i 6556 > /dev/null; if [[ $? -eq 0 ]]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
selfhealing_check=`netstat -nlp | grep -i 2812 > /dev/null; if [[ $? -eq 0 ]]; then echo -e "\033[32mPassed*\033[0m"; else echo -e "\033[31mFailed*\033[0m"; fi`
echo -e "\n\n"
echo -e "\t\t\t ==========================================================================="
echo -e "\t\t\t                        =: Installation Summary :=                          "
echo -e "\t\t\t ==========================================================================="
echo -e "\n\n\t\t\t  1. Sudo Access Checks: $root_access"
sleep 1
echo -e "\n\t\t\t  2. Host File entry checks: $host_file_entry"
sleep 1
echo -e "\n\t\t\t  4. Bind package Dependency Checks: $bind_install"
sleep 1
echo -e "\n\t\t\t  5. DNS Entry Checks: $resolv_entry"
sleep 1
echo -e "\n\t\t\t  6. Spacewalk Checks:"
sleep 1
echo -e "\n\t\t\t   # DNS Resolution:-"
echo -e "\n\t\t\t  -> Forward lookup: $forward_lookup | Reverse Lookup: $reverse_lookup"
sleep 1
echo -e "\n\t\t\t   # Hosts entry:-"
echo -e "\n\t\t\t  -> Hosts Entry Checks: $spacewalk_host_entry"
sleep 1
echo -e "\n\t\t\t  7. Monitoring tool integration checks: $monitoring_check"
sleep 1
echo -e "\n\t\t\t  8. Self Healing tool integration checks: $selfhealing_check"
echo -e "\n"
echo -e "\t\t\t ==========================================================================="
