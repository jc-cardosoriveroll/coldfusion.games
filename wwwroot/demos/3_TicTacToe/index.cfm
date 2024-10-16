<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>WS : Simple Client</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<h1>Look at log</h1>

	<script src="simple.js"></script>
	<cfwebsocket 	name 		="ws"
					onMessage 	="parseMessage"
					subscribeTo	="game"/>

</body>
</html>