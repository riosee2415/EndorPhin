<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>


<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">

</head>
	
	
<body id="page-top">
	

	<tiles:insertAttribute name="header"/>
	<div id="wrapper">
	
		<tiles:insertAttribute name="left"/>
	
	
	    <div id="content-wrapper">
			<div class="container-fluid">

			<tiles:insertAttribute name="content"/>

			</div>
			<!-- /.container-fluid -->
		
		
			<tiles:insertAttribute name="footer"/>
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->
	
	
	 
	  <!-- Bootstrap core JavaScript-->
	  <script src="/resources/vendor/jquery/jquery.min.js"></script>
	  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	  <!-- Core plugin JavaScript-->
	  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	  <!-- Page level plugin JavaScript-->
	  <script src="/resources/vendor/chart.js/Chart.min.js"></script>
	  <script src="/resources/vendor/datatables/jquery.dataTables.js"></script>
	  <script src="/resources/vendor/datatables/dataTables.bootstrap4.js"></script>
	  <!-- Custom scripts for all pages-->
	  <script src="/resources/js/sb-admin.min.js"></script>
	  <!-- Demo scripts for this page-->
	  <script src="/resources/demo/datatables-demo.js"></script>
	  <script src="/resources/demo/chart-area-demo.js"></script>


</body>
</html>
