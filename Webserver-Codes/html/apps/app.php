<?php

$apps = $_POST['formDoor'];
  
  if(empty($apps)) 
  {
    echo("You didn't select any applications.");
  } 
  else 
  {
    $N = count($apps);

    echo("You selected $N app(s): ");
    for($i=0; $i < $N; $i++)
    {
	echo($apps[$i]. "  ");
	#$output = shell_exec("/root/apps/nodejs");	
	#echo "<pre>$output</pre>;
    }
  }
?>
