<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="${cp}/css/dashboard.css"
	rel="stylesheet">
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<%-- 순서 중요 --%>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<div class="col-sm-3 col-md-2 sidebar">
		<tiles:insertAttribute name="left"/>
	</div>
	<div class="col-sm-9 col-md-10 main">
	<tiles:insertAttribute name="content"/>
	</div>
</body>
</html>