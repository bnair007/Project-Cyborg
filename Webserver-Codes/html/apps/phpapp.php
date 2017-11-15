<?php

$hostname = $_POST['hostname'];

echo("Installing applications on : $hostname <br> <br>");

$apps = $_POST['formDoor'];
  
	#echo("$apps[0] $apps[1] $apps[2] $apps[3] $apps[4] ");  

	if(empty($apps)) 
  	{
    		echo("You didn't select any applications.");
  		echo("Please click here to go back!");
	}	 
  	
	else 
  	{
    		$N = count($apps);

    		echo("You have selected $N app(s): <br><br> ");
    
		for($i=0; $i < $N; $i++)
    		{
			echo($apps[$i]. "<br>");
	
			echo ("<br><br>");
	

			$var = $apps[$i];

			#echo ("$var");

			$output = shell_exec("sudo /var/www/html/apps/$var $hostname");

        		echo "<pre>$output</pre>";

    		}		
  	}
?>
