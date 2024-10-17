<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>WS : Simple Client</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="theme.css">
	<link rel="stylesheet" href="styles.css">
</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header"><span class="navbar-brand">Simple Client</span></div>
			<ul class="nav navbar-nav pull-right"><li><a href="#" id="clearlog">Clear Log</a></li></ul>
		</div>
	</nav>

	<ul id="console" class="list-unstyled"></ul>

	<script src="simple.js"></script>

	<cfwebsocket 	name 		="websocket"
					onMessage 	="parseMessage"
					subscribeTo	="websocket"/>

</body>
</html>