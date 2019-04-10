<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>







<div id="container" class="container-fluid">
	<div id="erp_menu_container" class="row row-sys">


		<div class="col-md-2" style="background-color: #734F36;">

			<h4>
				<i class="fa fa-bullhorn"></i> <br> 공지사항
			</h4>
		</div>



		<div class="col-md-2 cell-sys">
			<div class="divname">회계</div>

			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<h3 class="dropdown-header">기초정보</h3>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath }/clientview">거래처등록</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath }/cardsList">신용카드 등록</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath }/establishview">계정과목
					등록</a> <a class="dropdown-item"
					href="${pageContext.request.contextPath }/deptList">부서등록</a>
				<h3 class="dropdown-header">전표관리</h3>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath }/paaprovuar">미승인 전표</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath }/slipview">일반 전표</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath }/taxcalview">매출세금계산서
					입력</a> <a class="dropdown-item"
					href="${pageContext.request.contextPath }/approval">승인전표</a>
				<h3 class="dropdown-header">고정자산</h3>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath }/purchaseAsset">고정자산
					등록</a> <a class="dropdown-item"
					href="${pageContext.request.contextPath }/sellAsset">고정자산 매각</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath }/useAsset">감가상각비</a>
			</div>
		</div>



		<div class="col-md-2 cell-sys">
			<div class="divname">인사</div>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<h3 class="dropdown-header">기초정보</h3>
				<a class="dropdown-item"
					href="${cp }/emplPosition/getAllemplPosition">직급등록</a> <a
					class="dropdown-item" href="">직책등록</a> <a class="dropdown-item"
					href="/addProduct">급여항목 등록</a> <a class="dropdown-item"
					href="/addDeduct">급여공제항목 등록</a>
				<h3 class="dropdown-header">사원정보관리</h3>
				<a class="dropdown-item" href="${cp }/employee/getAllEmployee">사원등록</a>
				<a class="dropdown-item" href="/addPayment">급여등록</a> <a
					class="dropdown-item" href="">퇴직자</a>
				<h3 class="dropdown-header">급여계산관리</h3>
				<a class="dropdown-item" href="/paymentAdjust">급여조정</a> <a
					class="dropdown-item" href="/paymentCal">급여명세서</a> <a class="dropdown-item"
					href="">급여명세서 인쇄/발송</a> <a class="dropdown-item"
					href="/paymentPersonal">개인별 급여 현황</a> <a class="dropdown-item"
					href="/paymentYear">연도별 급여 조회</a>
				<h3 class="dropdown-header">근태관리</h3>
				<a class="dropdown-item" href="${cp }/attitude/getAllAttitude">근태항목등록</a>
				<a class="dropdown-item" href="${cp }/annual/getAllannual">휴가일 수
					등록</a> <a class="dropdown-item"
					href="${cp }/attitudeRecord/getAllattitudeRecord">근태 입력</a>
			</div>
		</div>





		<div class="col-md-2 cell-sys">
			<div class="divname">물류/자재</div>
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
		</div>







		<div class="col-md-2 cell-sys">
			<div class="divname">그룹웨어</div>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item"
					href="${pageContext.request.contextPath }/boardType">게시판 생성</a> <a
					class="dropdown-item"
					href="${pageContext.request.contextPath }postList?boardTypeCode=5&boardTypeName=방명록">방명록</a>
				<a class="dropdown-item"
					href="${pageContext.request.contextPath }/free?boardTypeCode=5&boardTypeName=방명록">테스트</a>
				<c:forEach var="board" items="${boardAllList}">
					<c:if test="${board.useStatus == '1'}">
						<a class="dropdown-item"
							href="<%= request.getContextPath()%>/postList?boardTypeCode=${ board.boardTypeCode }&boardTypeName=${board.boardTypeName }">${board.boardTypeName }</a>
					</c:if>
				</c:forEach>
			</div>
		</div>

 	</div>
</div>