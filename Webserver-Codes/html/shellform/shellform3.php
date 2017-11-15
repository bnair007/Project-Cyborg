<?php
$output = shell_exec("sudo /root/foremancli '$hostname' '$app'");
echo "<pre>$output</pre>";
?>
