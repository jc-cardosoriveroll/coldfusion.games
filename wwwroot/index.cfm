<cffile action="read" file="#expandpath('data.json')#" variable="data">
<cfset items = deserializeJSON(data)>

<!DOCTYPE HTML>
<html lang="en-US">

<cfinclude template="_head.cfm">

<body>
    <cfinclude template="_loader.cfm">
    <!---
    <cfinclude template="_header.cfm">
    <cfinclude template="_bread.cfm">
    --->
    <cfinclude template="_courses.cfm">
    <cfinclude template="_brands.cfm">
    <!---
    <cfinclude template="_sidebar.cfm">
    <cfinclude template="_footer.cfm">
    --->
    <cfinclude template="_scripts.cfm">
</body>

</html>