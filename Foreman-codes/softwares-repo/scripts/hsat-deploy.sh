echo "Proceeding with mongodb data folder copy"
mkdir -p /opt/apps/mongodata/hsat
cd /opt/apps/mongodata/hsat
wget http://192.168.133.200/distro-trees/softwares/Mongo_Packages/mongodata.zip
unzip -o mongodata.zip
rm -rf mongodata.zip
echo "Proceeding with nodejs the installation"
#sudo yum install nodejs npm --enablerepo=epel
mkdir -p /home/oracle
cd /home/oracle/
mkdir -p /home/oracle/hsat/hsat-web
cd /home/oracle/hsat/hsat-web
wget http://192.168.133.200/distro-trees/softwares/nodejs_Packages/Hsat-Web`date +%Y%m%d`.zip
unzip Hsat-Web`date +%Y%m%d`.zip
rm -rf Hsat-Web`date +%Y%m%d`.zip
npm install
sleep 20
#nohup npm start &
echo "Proceeding with Jboss the installation"
[[ -e /home/oracle/dumps ]] || mkdir -p /home/oracle/dumps
cd /home/oracle/dumps
wget http://192.168.133.200/distro-trees/softwares/jboss/jboss-as-7.1.1.Final.zip
unzip jboss-as-7.1.1.Final.zip
rm -rf jboss-as-7.1.1.Final.zip
cd /home/oracle/dumps/jboss-as-7.1.1.Final/standalone/deployments
#wget http://192.168.150.122:8081/artifactory/webapp/#/artifacts/browse/tree/General/ext-snapshot-local/com/hitachi/hcat/hcat-services/0.0.1-SNAPSHOT/hcat-services-*.war
wget http://192.168.150.122:8081/artifactory/ext-snapshot-local/com/hitachi/hcat/hcat-services/0.0.1-SNAPSHOT/hcat-services-0.0.1-20161112.192319-1.war
echo Deployed latest hcat-services war
echo "starting the jboss server after deployment.."
echo "Changing the BUILD_ID to some random value so as to fool jenkins into believing that this daemon is not spawned by this particular jenkins build."
#BUILD_ID=dontKillMe nohup sh /home/oracle/dumps/jboss-as-7.1.1.Final/bin/standalone.sh -b 0.0.0.0 > /dev/null 2>&1 &
sleep 20
echo "End of Script."

