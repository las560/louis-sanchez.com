<pre>
<?php

//Connect To Database
$host 	   = 'loo189test.db.8130043.hostedresource.com';
$username  = 'loo189test';
$password  = 'Heavyarms-23';
$dbname    = 'loo189test';

mysql_connect($host, $username, $password) or die('Unable to connect to database! Please try again later.');
mysql_select_db($dbname);

//print_r($response);

$query = 'select DATABASE(), USER()';
$response = mysql_fetch_array(mysql_query($query));

print_r($response);

?>
</pre>
