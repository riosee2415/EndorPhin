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

  <title>EndoRPhin</title>
  
  
  <!-- Acoount Part Basic Style -->
  <link type="text/css" href="${pageContext.request.contextPath }/css/accountBasic.css" rel="stylesheet" >
  
  <!-- dialog style -->
  <link href="${pageContext.request.contextPath}/css/dialog.css" rel="stylesheet">

   <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	

<style>
	
	
	.cont{
	background-color:#ffffff;
	
	}
	
	</style>



</head>
	
	
<body id="page-top">
	

	<tiles:insertAttribute name="header"/>
	<div id="wrapper">
	
		<tiles:insertAttribute name="left"/>
	
	
	    <div id="content-wrapper" class="cont">
			<div class="container-fluid" >

			<!-- Contents Source -->
			<tiles:insertAttribute  name="content"/>

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
	  <script src="/resources/vendor/datatables/jquery.dataTables.js"></script>
	  <script src="/resources/vendor/datatables/dataTables.bootstrap4.js"></script>
	  <!-- Custom scripts for all pages-->
	  <script src="/resources/js/sb-admin.min.js"></script>
	  
	  
	  <!-- Demo scripts for this page-->
 	  <script src="/resources/js/demo/datatables-demo.js"></script> 
	 
	 

	 <!-- DATE API -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	 <!-- Dialog Box -->

	 <!-- 충돌방지 -->	
	<script type="text/javascript">
		//jQuery.noConflict();
		//var j$ = jQuery;
	</script>
		
		
		
		


</body>
</html>