<cffile action="read" file="#expandpath('data.json')#" variable="data">
<cfset items = deserializeJSON(data)>

<!DOCTYPE HTML>
<html lang="en-US">

<cfinclude template="_boiler/_head.cfm">

<body>
    <cfinclude template="_boiler/_loader.cfm">
    <!---
    <cfinclude template="_boiler/_header.cfm">
    <cfinclude template="_boiler/_bread.cfm">
    --->
    <cfinclude template="_boiler/_courses.cfm">
    <cfinclude template="_boiler/_brands.cfm">
    <!---
    <cfinclude template="_boiler/_sidebar.cfm">
    <cfinclude template="_boiler/_footer.cfm">
    --->
    <cfinclude template="_boiler/_scripts.cfm">
</body>

</html>