# Foreman Code repository Log History

> 1) **Code to dynamically install application as a part of post provisioning process**


#### appdeploy

:heavy_exclamation_mark: Note: Works when called from webserver..

`Frontend code calls PHP Script `[Hitachi GDC Site](http://192.168.133.177/page2/search_engine/index3.php#)

`Bundeled Deployment Code call PHP Code`

```
http://192.168.133.177/shellform/shellform2.php

[root@webprd ~]# cat foremancli
#!/bin/bash
ssh 192.168.133.210 "hammer -u admin -p redhat  host create --name $1  --compute-resource-id=1 --hostgroup-id=$2"
ssh 192.168.133.210 "hammer -u admin -p redhat  host start --name $1.testlab.local"

[root@webprd ~]# cat foremancli2
#!/bin/bash
ssh 192.168.133.210 "hammer -u admin -p redhat  host create --name $1  --compute-resource-id=1 --hostgroup-id=$3"
ssh 192.168.133.210 "hammer -u admin -p redhat  host start --name $1.testlab.local"
ssh 192.168.133.210 "/opt/scripts/appdeploy $1 $2 $3 $4"

```
`PHP Code calls foremancli`

`Foreman CLI calls appdeploy`

====

> 2) **Slack codes to authenticate user using MFA**

#### slack-notify.sh

#### slack-email.sh

`Install Google Authenticator`

`Edit pam modules`
```
#%PAM-1.0
auth       required     pam_sepermit.so
auth       optional     pam_google_authenticator.so
auth       substack     password-auth
auth       include      postlogin
-
-session   optional     pam_reauthorize.so prepare
session   optional      pam_exec.so /opt/scripts/slack-notify.sh
session   optional      pam_exec.so /opt/scripts/slack-email.sh

```
====

> 3) **Foreman CLI to do foreman administration from backend either locally or remotely**

#### Foremancli

```
--sippet--

#!/bin/bash
#     name: Foreman CLI
#   author: bijith.nair@hitachiconsulting.com
#     date: 2017-06-16
#      ver: 1.0.0
#  purpose: To Administer foreman using CLI
# chkconfig: - 85 15
# description: Init script for foreman
# Copyrights : Hitachi Consulting Cooperation

# Source function library.
. /etc/rc.d/init.d/functions

createvm() {
echo -ne "\nEnter the hostname: "
read hostname
USER="admin"
PASS="redhat"
echo ""
hammer -u admin -p redhat hostgroup list
echo -ne "\nPlease enter the host id: "
read hostid
hammer -u $USER -p $PASS  host create --name $hostname  --compute-resource-id=1 --hostgroup-id=$hostid
hammer -u $USER -p $PASS host start --name $hostname.testlab.local

```
====

> 4) **Build scripts to perform provisioning through devops way (IAAC)**

#### build.sh

#### push_build.sh

`Push build script calls the build script which commits the code to git, Once the code is committed Jenkins sense the changes in code repo and calls the foreman to initiate provisioning`

====

> 5) **Foreman Provisioning Codes**

#### foreman-provisioning-Amazon
#### foreman-provisioning-Centos
#### foreman-provisioning-Epel
#### foreman-provisioning-Fstab
#### foreman-provisioning-Monit
#### foreman-provisioning-Network-hosts
#### foreman-provisioning-Oracle_Linux
#### foreman-provisioning-Remote-Execution-ssh
#### foreman-provisioning-Vmware

====

> 6) **Software repository**

`Software repository contains all kinds of codes and packages which are being used during the process of vm provisioning`


## awsdeploy : Still in Progress