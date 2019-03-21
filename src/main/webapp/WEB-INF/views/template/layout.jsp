<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/temporaryFile/ddmenu/ddmenu.css" rel="stylesheet" type="text/css" />
    <script src="/temporaryFile//ddmenu/ddmenu.js" type="text/javascript"></script>
    <style>
        /*The following are for this demo page only (not required for the ddmenu).*/
        #ddmenu { background: #eee url(/temporaryFile/ddmenu/ddmenu-bg.jpg) no-repeat center 0px; padding-top:90px;}
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EndoRPhin</title>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="content"/>
</body>
</html>