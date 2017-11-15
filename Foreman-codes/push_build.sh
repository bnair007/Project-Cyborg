echo -ne "Please enter the hostname: "
read hostname
echo -ne "\nCommiting the changes to git database.."
sleep 2
echo -ne "\nPlease enter the comments to push the code to upstream github: "
read github
echo "sh /root/build.sh $hostname" > /root/auto_build.sh
git status
sleep 2
git add auto_build.sh
git commit -m "`echo "$github`"
git push -u origin master

