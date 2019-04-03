<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="${cp }/helloTiles">ERP메인화면</a>

    
    
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
          <a class="dropdown-item" href="${pageContext.request.contextPath }/taxcallview">매출세금계산서 입력</a>
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
          <a class="dropdown-item" href="/paymentCal">급여계산</a>
          <a class="dropdown-item" href="">급여명세서</a>
          <a class="dropdown-item" href="">급여명세서 인쇄/발송</a>
          <a class="dropdown-item" href="/paymentPersonal">개인별 급여 현황</a>
          <a class="dropdown-item" href="/paymentYear">연도별 급여 조회</a>
            <h3 class="dropdown-header">근태관리</h3>
          <a class="dropdown-item" href="${cp }/attitude/getAllAttitude">근태항목등록</a>
          <a class="dropdown-item" href="">휴가일 수 등록</a>
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
        	<a class="dropdown-item" href="${pageContext.request.contextPath }/boardType">게시판 생성</a>
        	<a class="dropdown-item" href="postList?boardTypeCode=5&boardTypeName=방명록">자유게시판</a>
        	<a class="dropdown-item" href="free?boardTypeCode=5&boardTypeName=방명록">테스트</a>
        	<c:forEach var="board" items="${boardAllList}">
        		<c:if test="${board.useStatus == '1'}">
        			<a class="dropdown-item" href="<%= request.getContextPath()%>/postList?boardTypeCode=${ board.boardTypeCode }&boardTypeName=${board.boardTypeName }">${board.boardTypeName }</a>
        		</c:if>
        	</c:forEach>
        </div>
      </li>
      
      
    
    
    </ul>
    
    
    
    

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>
    
   
    

  </nav>
  
  