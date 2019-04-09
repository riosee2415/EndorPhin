<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>


#left {


}


</style>







<!-- Sidebar -->
<div  class="col-md-2">

<ul id="left" class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>
    </ul>
     
 
</div>







































































<!-- <ul class="sidebar navbar-nav">
	<li id="account">
		<h3>회계</h3>
		<ul>
			<li>
				<span>기초정보</span>
				<ul  style="display:none">
					<li><a href="">거래처 등록</a></li>
					<li><a href="">신용카드 등록</a></li>
					<li><a href="">계정과목 등록</a></li>
					<li><a href="">부서 등록</a></li>
				</ul>
			</li>
		</ul>
	</li>
	<li id="humanResource">
		<h3>인사</h3>
		<ul>
			<li>
				<span>기초정보</span>
				<ul  style="display:none">
					<li><a href="">거래처 등록</a></li>
					<li><a href="">신용카드 등록</a></li>
					<li><a href="">계정과목 등록</a></li>
					<li><a href="">부서 등록</a></li>
				</ul>
			</li>
		</ul>
	</li>
	<li id="distribution">
		<h3>물류/자재</h3>
		<ul>
			<li>
				<span>기초정보</span>
				<ul  style="display:none">
					<li><a href="">거래처 등록</a></li>
					<li><a href="">신용카드 등록</a></li>
					<li><a href="">계정과목 등록</a></li>
					<li><a href="">부서 등록</a></li>
				</ul>
			</li>
		</ul>
	</li>
</ul> -->








<!-- <script>
	var li_check=false;
	$("#account").on("click",function(){
		console.log("haha");
		if(li_check==true){
			$("#account").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","none");
			$("#account").children("ul").children("li").children("ul").css("display","block");
		}
		else{
			$("#account").children("ul").children("li").children("ul").css("display","block");
			li_check=true;
		}
	})
	$("#humanResource").on("click",function(){
		console.log("haha");
		if(li_check==true){
			$("#account").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","block");
		}
		else{
			$("#humanResource").children("ul").children("li").children("ul").css("display","block");
			li_check=true;
		}
	})
	$("#distribution").on("click",function(){
		console.log("haha");
		if(li_check==true){
			$("#account").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","block");
		}
		else{
			$("#distribution").children("ul").children("li").children("ul").css("display","block");
			li_check=true;
		}
	})
</script> -->

