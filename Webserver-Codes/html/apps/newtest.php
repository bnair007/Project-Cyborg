<?php


#$cmd = "sudo /var/www/html/apps/abc");

#echo shell_exec("whoami");

$output = shell_exec("sudo /var/www/html/apps/abc");

echo "<pre>$output</pre>";

?>
