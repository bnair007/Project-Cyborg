<?php
$hostname = $_POST['hostname'];
$app = $_POST['app'];
$app01 = $_POST['app01'];
$app02 = $_POST['app02'];


if(empty($hostname ) || empty($app )) {
echo "<h2>You must fill in all fields</h2>\n" ;
die ("Click Back to start again.");
}
echo "<h2>You Entered the following information:</h2>";
echo "<b>Hostname:</b><br><br>";
echo $hostname;
echo "<br><br><b> System ID:</b><br><br>";
echo $app;
echo "<br><br><b>Hosting ID:</b><br><br>";
echo $app02;
echo "<br><br><b>Analyzing the build requirement..</b><br><br>";
echo "<br><br><b>Calling the Host Build API's:</b><br><br>";

?>

<?php
#exec ( "/root/foremancli $hostname $shell" );
#exec('sudo /root/foremancli $hostname $shell 2>&1', $output);
#print_r($output);  // to see the response to your command
$output = shell_exec("sudo /root/foremancli '$hostname' '$app'");
echo "<pre>$output</pre>";
$output2 = shell_exec("sudo /root/foremancli2 '$hostname' '$app02' '$app' '$app01'");
echo "<br><br><b>~~ Log Summary ~~</b><br><br>";
echo "<pre>$output2</pre>";
?>
