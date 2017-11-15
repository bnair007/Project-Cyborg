<?php
$hostname = $_POST['hostname'];
$os = $_POST['os'];
$InstanceType = $_POST['InstanceType'];
$Network = $_POST['Network'];
$Volumesize = $_POST['Volumesize'];


if(empty($hostname ) || empty($InstanceType )) {
echo "<h2>You must fill in all fields</h2>\n" ;
die ("Click Back to start again.");
}
echo "<h2>You Entered the following information:</h2>";
echo "<b>Hostname:</b><br><br>";
echo $hostname;
echo "<br><br><b> Operating System:</b><br><br>";
echo $os;
echo "<br><br><b> Instance Type:</b><br><br>";
echo $InstanceType;
echo "<br><br><b>Network:</b><br><br>";
echo $Network;
echo "<br><br><b>Size of the Volume:</b><br><br>";
echo $Volumesize;

echo "<br><br><b>Analyzing the build requirement..</b><br><br>";
echo "<br><br><b>Calling the Host Build API's:</b><br><br>";

?>

<?php
#exec ( "/root/foremancli $hostname $shell" );
#exec('sudo /root/foremancli $hostname $shell 2>&1', $output);
#print_r($output);  // to see the response to your command
$output = shell_exec("sudo /root/awscli '$hostname' '$os' '$InstanceType' '$Network' '$Volumesize'");
echo "<br><br><b>~~ Log Summary ~~</b><br><br>";
echo "<pre>$output</pre>";
?>
