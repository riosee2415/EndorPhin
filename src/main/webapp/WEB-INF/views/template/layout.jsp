<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<style>
#content-wrapper {
	animation: fadein 1.5s;
	-webkit-animation: fadein 1.5s;
}

@
keyframes fadein {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;
	
}

to {
	opacity: 1;
}
}
</style>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>EndoRPhin</title>

<!-- 버튼 css 삽입 -->
<link type="text/css"
	href="${pageContext.request.contextPath }/css/bttn.css"
	rel="stylesheet">

<!-- 차트 js 삽입 -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/Chart.LlineBar.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/Chart.min.js"    ></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/Chart.StackedBar.js" type="text/javascript"></script> --%>
<!-- 차트 js 종료 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- 달력API 시작 -->

<link href='/resources/packages/core/main.css' rel='stylesheet' />
<link href='/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='/resources/packages/timegrid/main.css' rel='stylesheet' />
<link href='/resources/packages/list/main.css' rel='stylesheet' />


<script src='/resources/packages/core/main.js'></script>
<script src='/resources/packages/interaction/main.js'></script>
<script src='/resources/packages/daygrid/main.js'></script>
<script src='/resources/packages/timegrid/main.js'></script>
<script src='/resources/packages/list/main.js'></script>

<!-- 달력API 종료 -->

<!-- 지도 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d1997a6f668b23970f9ffd21d6ec929&libraries=services"></script>

<link href="${pageContext.request.contextPath}/css/dashboard.css"
	rel="stylesheet">
		<!-- 다음 주소찾기 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- Acoount Part Basic Style -->
<link type="text/css"
	href="${pageContext.request.contextPath }/css/accountBasic.css"
	rel="stylesheet">

<!-- dialog style -->
<link href="${pageContext.request.contextPath}/css/dialog.css"
	rel="stylesheet">
	
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin.css"
	rel="stylesheet">

<!-- font-awesome CSS -->
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">



<!-- menu CSS -->
<link rel="stylesheet" type="text/css" href="/css/menu.css">
<script type="text/javascript" src="/js/function.js"></script>

<!-- left CSS -->
<link rel="stylesheet" type="text/css" href="/css/left.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" />



<!--달력css  -->
<!--  <link id="attitude" href="/css/bootstrap2.css" rel="stylesheet">  -->
<!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
<script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

<!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

<!-- Inline CSS based on choices in "Settings" tab -->
<style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>


<!-- Extra JavaScript/CSS added manually in "Settings" tab -->
<!-- Include jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>




<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />

<!-- jQuery -->
<!-- <script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


<script src="/SE2/js/HuskyEZCreator.js"></script>


<style>
.cont {
	background-color: #F5F4F0;
}
</style>

</head>


<body id="page-top">
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="menu" />
	<div id="wrapper">
		<tiles:insertAttribute name="left" />

		<div id="content-wrapper" class="cont" style="height: 100%">
			<!-- <div class="container-fluid" > -->

			<!-- Contents Source -->
			<tiles:insertAttribute name="content" />

		</div>
		<!-- /.container-fluid -->

		<tiles:insertAttribute name="footer" />
	</div>
	<!-- /.content-wrapper -->
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


	<!-- javascript -->
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
		<!-- 다음 주소찾기 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	
	
</body>
<!-- ERP/그룹웨어 나누기 -->
<script>  
   
 if($('#erp_menu_container').length > 0){
   $('#groupmenu').removeClass('active');
   $('#erpmenu').removeClass('active');
   $('#erpmenu').addClass('active');
}else if($('#group_menu_container').length > 0){
   $('#erpmenu').removeClass('active');
   $('#groupmenu').removeClass('active');
   $('#groupmenu').addClass('active'); 
}
 
                                              
                          
 $(document).ready(function () {
     $('#sidebarCollapse').on('click', function () {
           $('#sidebar').toggleClass('active');
       });
 });
</script>
</html>