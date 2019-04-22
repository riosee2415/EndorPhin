<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Poor+Story" rel="stylesheet">


<style>

#userName{
color : white;
font-family: 'Black Han Sans', sans-serif;
font-family: 'Poor Story', cursive;
font-size: 2em;

}


#logo {
color : white;
font-weight :1500;
 font-family: 'Black Han Sans', sans-serif;
	-webkit-animation: tracking-in-contract 0.8s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
	        animation: tracking-in-contract 0.8s cubic-bezier(0.215, 0.610, 0.355, 1.000) both;
}

@-webkit-keyframes tracking-in-contract {
  0% {
    letter-spacing: 1em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    letter-spacing: normal;
    opacity: 1;
  }
}
@keyframes tracking-in-contract {
  0% {
    letter-spacing: 1em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    letter-spacing: normal;
    opacity: 1;
  }
}




a {
	color: #fff;
	text-decoration: none;
	outline: none
}

#sidebarCollapse {
	color: #fff;
	text-decoration: none;
	outline: none
}



#container div .col-md-2:hover {
	background: #4D341B;
	color: #fff !important;
	width: 70%;
}

.col-md-2:hover .dropdown-menu {
	display: block !important;
	margin-top: 0 !important;
	background-color: #CFCABA !important;
}

#container {
	color: white !important;
	font-size: 2em !important;
	background-color: #997149 !important;
	text-align: center !important;
}

#container .col-md-2 {
	cursor: pointer;
}

.dropdown-menu {
	width: 100%;
}

.cell-sys {
	display: table;
	height: 60px;
}

.divname {
	display: table-cell;
	vertical-align: middle;
	height: 100%;
}

.headermenu>div {
	display: block;
}

.header {
	cursor: pointer;
	font-size: 2em;
	color: #ddd;
	font-family: "Arvo";
}

#groupmenu, #erpmenu {
	border-top: 5px solid transparent;
}

#erpmenu.active {
	background: rgba(158, 103, 66, 0.5);
	border-top: 5px solid #9e6742;
	color: #997149 !important;
}

#erpmenu:hover a {
	color: #fff;
}

#groupmenu.active {
	background: rgba(68, 104, 221, 0.5);
	border-top: 5px solid #4468dd;
}

#groupmenu:hover a {
	color: #fff;
}
</style>

<div class="container-fluid"
	style="background-color: black; text-align: center;">
	<div class="row headermenu">



		<div class="col-md-2" style="margin-top: auto;">
			 <a class="header" href="${cp }/helloTiles">
			 <span id="logo">EnDorPhin</span>
			 <!-- <img src="${cp }/upload/erpblack.jpg" style="width: 235px; height: 70px;" /> --></a>
		</div>

		<div id="erpmenu" class="col-md-2">
			<a class="header" href="${cp }/helloTiles">E R P</a>
		</div>


		<div id="groupmenu" class="col-md-2">
			<a class="header" href="${cp }/groupwareTiles">그룹웨어</a>
		</div>

		<div class="col-md-2"></div>


		 <div class="col-md-2" style="margin-top: auto; margin-bottom: auto;">
		<span id="userName"> ${employeeVo.deptname}팀 ${employeeVo.userNm}님   접속중입니다</span>
		</div> 

		<div class="col-md-2">
			<a  class="header" href="${cp }/login"> <i
				class="fa fa-plug "></i> Logout
			</a>
		</div>

	</div>
</div>