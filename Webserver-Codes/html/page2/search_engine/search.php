<?php 
//load database connection
    $host = "localhost";
    $user = "root";
    $password = "redhat";
    $database_name = "search_engine";
    $pdo = new PDO("mysql:host=$host;dbname=$database_name", $user,$password, array(
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ));
// Search from MySQL database table
$search=$_POST['search'];
$query = $pdo->prepare("select * from inventory where Hostname LIKE '%$search%' OR os LIKE '%$search%' OR ipaddr LIKE '%$search%' OR vcpu LIKE '%$search%' OR ram LIKE '%$search%' OR storage LIKE '%$search%' OR hosting LIKE '%$search%'  LIMIT 0 , 10");
$query->bindValue(1, "%$search%", PDO::PARAM_STR);
$query->execute();
// Display search result
         if (!$query->rowCount() == 0) {
		 		echo "Search found :<br/><br/>";
				echo "<table style=\"font-family:arial;color:#333333;\">";	
                echo "<tr><td style=\"border-style:solid;border-width:3px;border-color:#98bf21;background:#98bf21;\">Hostname</td><td style=\"border-style:solid;border-width:3px;border-color:#98bf21;background:#98bf21; \">Operating System   </td><td style=\"border-style:solid;border-width:3px;border-color:#98bf21;background:#98bf21; \">IP Address</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;background:#98bf21; ;\">VCPU's</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;background:#98bf21; \">RAM (GB)</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;background:#98bf21; \">Storage (GB)</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;background:#98bf21;\">Hosting Environment</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;background:#98bf21; \"</td></tr>";	
            while ($results = $query->fetch()) {
				echo "<tr><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";			
                echo $results['Hostname'];
				echo "</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";
                echo $results['os'];
                                echo "</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";
                echo $results['ipaddr'];
				echo "</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";
                echo $results['vcpu'];
                                echo "</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";
                echo $results['ram'];
                                echo "</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";
                echo $results['storage'];
                                echo "</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";
                echo $results['hosting'];
                                echo "</td><td style=\"border-style:solid;border-width:1px;border-color:#98bf21;\">";

            }
				echo "</table>";		
        } else {
            echo 'Nothing found';
        }
?>
