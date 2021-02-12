<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="refresh" content="0.6; url=<?php echo "https://" . $_SERVER['HTTP_HOST']; ?>" />
	<title>Autoindex toggle endpoint</title>
</head>
<body>
	<?php
		$h = fopen(".sch", "w");
		fwrite($h, "");
		fclose($h);
		echo "Toggling autoindex...";
	?>
</body>
</html>
