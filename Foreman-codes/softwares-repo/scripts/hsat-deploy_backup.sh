#!/bin/sh
echo "Proceeding with the installation"
[[ -e /home/oracle/dumps ]] || mkdir -p /home/oracle/dumps
cd /home/oracle/dumps; wget http://192.168.133.200/distro-trees/softwares/jboss/jboss-as-7.1.1.Final.zip
unzip jboss-as-7.1.1.Final.zip
rm -rf jboss-as-7.1.1.Final.zip

jbossProcessId=`ps -ef|grep 'jboss'|grep 'server'|grep -v 'grep'|tr -s " "|cut -f2 -d' '`
if [ -z $jbossProcessId ]
then
    echo "jboss server is not running.Proceeding to cleanup of temp folder task."
else
    echo Jboss is running with processId $jbossProcessId.Proceeding to kill the process..
    kill -9 $jbossProcessId
        jbossProcessId=`ps -ef|grep 'jboss'|grep 'server'|grep -v 'grep'|tr -s " "|cut -f2 -d' '`
        if [ -z $jbossProcessId ]
        then
    echo server killed successfully.
        else
    echo server is still running even after an attempt to kill it.Please investigate further.
    exit 2
        fi
fi
echo "Clearing temp folder contents.."
rm -rf /home/oracle/dumps/jboss-as-7.1.1.Final/standalone/tmp
echo "Deploying latest hcat-services war.."
rm -rf /home/oracle/dumps/jboss-as-7.1.1.Final/standalone/deployments/hcat-services.war
cd ${WORKSPACE}/HSAT/target
#scp -f *.war root@192.168.150.90:/home/oracle/dumps/jboss-as-7.1.1.Final/standalone/deployments
#rsync -rav 192.168.150.122:/var/lib/jenkins/jobs/HSAT-SERVICES-BUILD/workspace/hcat-services/target/hcat-services.war /var/distro-trees/softwares/jboss/hsat-war/
cd /home/oracle/dumps/jboss-as-7.1.1.Final/standalone/deployments
wget http://192.168.150.122:8081/artifactory/ext-snapshot-local/com/hitachi/hcat/hcat-services/0.0.1-SNAPSHOT/hcat-services-0.0.1-20161112.192319-1.war
echo Deployed latest hcat-services war
echo "starting the jboss server after deployment.."
echo "Changing the BUILD_ID to some random value so as to fool jenkins into believing that this daemon is not spawned by this particular jenkins build."
BUILD_ID=dontKillMe nohup sh /home/oracle/dumps/jboss-as-7.1.1.Final/bin/standalone.sh -b 0.0.0.0 > /dev/null 2>&1 &
sleep 20
echo "End of Script."

