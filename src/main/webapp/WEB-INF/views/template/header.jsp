<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<style>

    
    
    <ul class="navbar-nav ml-auto ml-md-10" style="font-size: 1.3em">
    
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>테스트</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h3 class="dropdown-header">테스트</h3>
          <a class="dropdown-item" href="${cp }/employee/test">테스트</a>
        </div>
      </li>
    
      
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>회계</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h3 class="dropdown-header">기초정보</h3>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/clientview">거래처등록</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/cardsList">신용카드 등록</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/establishview">계정과목 등록</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/deptList">부서등록</a>
           <h3 class="dropdown-header">전표관리</h3>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/paaprovuar">미승인 전표</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/slipview">일반 전표</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/taxcalview">매출세금계산서 입력</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath }/approval">승인전표</a>
            <h3 class="dropdown-header">고정자산</h3>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/purchaseAsset">고정자산 등록</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/sellAsset">고정자산 매각</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/useAsset">감가상각비</a>
        </div>
      </li>
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>인사</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h3 class="dropdown-header">기초정보</h3>
          <a class="dropdown-item" href="${cp }/emplPosition/getAllemplPosition">직급등록</a>
          <a class="dropdown-item" href="">직책등록</a>
          <a class="dropdown-item" href="/addProduct">급여항목 등록</a>
          <a class="dropdown-item" href="/addDeduct">급여공제항목 등록</a>
           <h3 class="dropdown-header">사원정보관리</h3>
          <a class="dropdown-item" href="${cp }/employee/getAllEmployee">사원등록</a>
          <a class="dropdown-item" href="/addPayment">급여등록</a>
          <a class="dropdown-item" href="">퇴직자</a>
           <h3 class="dropdown-header">급여계산관리</h3>
          <a class="dropdown-item" href="/paymentAdjust">급여조정</a>
          <a class="dropdown-item" href="/paymentCal">급여명세서</a>
          <a class="dropdown-item" href="">급여명세서 인쇄/발송</a>
          <a class="dropdown-item" href="/paymentPersonal">개인별 급여 현황</a>
          <a class="dropdown-item" href="/paymentYear">연도별 급여 조회</a>
            <h3 class="dropdown-header">근태관리</h3>
          <a class="dropdown-item" href="${cp }/attitude/getAllAttitude">근태항목등록</a>
         <a class="dropdown-item" href="${cp }/annual/getAllannual">휴가일 수 등록</a>
          <a class="dropdown-item" href="${cp }/attitudeRecord/getAllattitudeRecord">근태 입력</a>
        </div>
      </li>
      
      
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>물류/자재</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h3 class="dropdown-header">구매관리</h3>
          <a class="dropdown-item" href="">발주 입력</a>
           <h3 class="dropdown-header">조회</h3>
          <a class="dropdown-item" href="">발주현황</a>
           <h3 class="dropdown-header">기초정보</h3>
          <a class="dropdown-item" href="">상품 등록</a>
            <h3 class="dropdown-header">자재관리</h3>
          <a class="dropdown-item" href="">입고 입력</a>
        </div>
      </li>
      
      
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>그룹웨어</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
           <a class="dropdown-item" href="${pageContext.request.contextPath }/boardList?boardTypeCode=5">자유게시판</a>
        </div>
      </li>
    </ul>
    
    
    
    
 a {color: #fff; text-decoration: none; outline: none}


#sidebarCollapse{

color: #fff; text-decoration: none; outline: none

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



.headermenu > div{
display:block;
}

.header {
cursor: pointer;
	font-size: 2em;
	color: #ddd;
	font-family: "Arvo";
}
#groupmenu, #erpmenu {
	border-top:5px solid transparent;
}


#erpmenu.active {
	background: rgba(158, 103, 66, 0.5);
	border-top: 5px solid #9e6742;
	color:#997149 !important;
}

#erpmenu:hover a{
	color:#fff;
}


#groupmenu.active{
	background: rgba(68, 104, 221, 0.5);
	border-top: 5px solid #4468dd;
}

#groupmenu:hover a{
	color:#fff;
}




</style>

<div class="container-fluid"
	style="background-color: black; text-align: center;">
	<div class="row headermenu">
                      

		<div class="col-md-2 headFont">
			<a class="header" href="${cp }/helloTiles"> <img alt=""
				src="${cp }/upload/erpblack.jpg" style="width: 235px; height: 70px;" /></a>
		</div>
                                               

		<div id="erpmenu" class="col-md-2">
			<a class="header" href="${cp }/helloTiles">E R P</a>
		</div>
                         

		<div id="groupmenu" class="col-md-2">
			<a class="header" href="${cp }/groupwareTiles">그룹웨어</a>
		</div>

		<div class="col-md-2"></div>
		
		
		
		
		<div class="col-md-2">
		
		
		
		
		</div>
		
		<div class="col-md-2">
		<a class="header" href="${cp }/helloTiles">	<i class="fa fa-plug "></i> Logout</a>
		</div>

                                                 

	</div>
</div>



                                

