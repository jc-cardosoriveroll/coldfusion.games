<script type="text/javascript"> 
	function mymessagehandler(aevent, atoken) 
	{ 
	var message = ColdFusion.JSON.encode(atoken); 
	var txt=document.getElementById("myDiv"); 
	txt.innerHTML +=message +"<br>"; 
	} 
	</script> 
	<cfwebsocket name="mycfwebsocketobject" onmessage="mymessagehandler" subscribeto="stocks" > 
	<cfdiv id="myDiv"></cfdiv>