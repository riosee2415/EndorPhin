<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div id="container" class="container-fluid">
	<div id="erp_menu_container" class="row row-sys">


		<div class="col-md-2" style="background-color: #734F36;">

			<div style="float: center;">
				<button type="button" id="sidebarCollapse"
					class="btn btn-link">
					<h4>
						<i class="fas fa-list">&nbsp;Menu</i>
					</h4>
				</button>
			</div>
		</div>
		<ul id="main-menu" style="font-weight: bold;">
			<li class="parent"><a href="#">회계</a>
				<ul class="sub-menu">
					<li><a class="parent" href="#">기초정보</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/clientview">거래처
									등록</a></li>
							<li><a href="${pageContext.request.contextPath }/cardsList">신용카드
									등록</a></li>
							<li><a
								href="${pageContext.request.contextPath }/establishview">계정과목
									등록</a></li>
							<li><a href="${pageContext.request.contextPath }/deptList">부서
									등록</a></li>
						</ul></li>
					<li><a class="parent" href="#">전표 관리</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/clientview">미승인
									전표</a></li>
							<li><a href="${pageContext.request.contextPath }/slipview">일반
									전표</a></li>
							<li><a href="${pageContext.request.contextPath }/taxcalview">매출세금계산서
									입력</a></li>
							<li><a href="${pageContext.request.contextPath }/approval">승인
									전표</a></li>
						</ul></li>
					<li><a class="parent" href="#">고정자산</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/purchaseAsset">고정자산등록</a></li>
							<li><a href="${pageContext.request.contextPath }/assetSell">고정자산매각</a></li>
							<li><a href="${pageContext.request.contextPath }/assetUsed">감가상각비</a></li>
						</ul></li>
					<li><a class="parent" href="#">회계관리</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/psList">매입매출장</a></li>
							<li><a
								href="${pageContext.request.contextPath }/sumChance">합계잔액시산표</a></li>
							<li><a
								href="${pageContext.request.contextPath }/purchaseAsset">재무상태표</a></li>
							<li><a
								href="${pageContext.request.contextPath }/purchaseAsset">손익계산서</a></li>
						</ul></li>
					<li><a
						href="${pageContext.request.contextPath }/tax_report">부가세신고서</a>
					</li>
				</ul></li>
			<li class="parent"><a href="#">인사</a>
				<ul class="sub-menu">
					<li><a class="parent" href="#">기초정보</a>
						<ul class="sub-menu">
							<li><a
								href="${pageContext.request.contextPath }/emplPosition/getAllemplPosition">직급/직책
									등록</a></li>
							<li><a href="/addProduct">급여항목 등록</a></li>
							<li><a
								href="${pageContext.request.contextPath }/establishview">계정과목
									등록</a></li>
							<li><a href="/addDeduct">급여공제항목 등록</a></li>
						</ul></li>
					<li><a class="parent" href="#">사원정보 관리</a>
						<ul class="sub-menu">
							<li><a href="${cp }/employee/getAllEmployee">사원등록</a></li>
							<li><a href="/addPayment">급여등록</a></li>
							<li><a href="">퇴직자</a></li>
						</ul></li>
					<li><a class="parent" href="#">급여계산관리</a>
						<ul class="sub-menu">
							<li><a href="/paymentAdjust">급여조정</a></li>
							<li><a href="/paymentCal">급여명세서</a></li>
							<li><a href="">급여명세서 인쇄/발송</a></li>
							<li><a href="/paymentPersonal">개인별 급여 현황</a></li>
							<li><a href="/paymentYear">연도별 급여 조회</a></li>
						</ul></li>
					<li><a class="parent" href="#">근태관리</a>
						<ul class="sub-menu">
							<li><a href="${cp }/attitude/getAllAttitude">근태항목등록</a></li>
							<li><a href="${cp }/annual/getAllannual">휴가일 수 등록</a></li>
							<li><a href="${cp }/attitudeRecord/getAllattitudeRecord">근태
									입력</a></li>
						</ul></li>
				</ul></li>
			<li class="parent"><a href="#">물류/자재</a>
				<ul class="sub-menu">
					<li><a class="parent" href="#"><i class="icon-file-alt"></i>
							구매 관리</a>
						<ul class="sub-menu">
							<li><a href="/orders/orderInput">발주 입력</a></li>
						</ul></li>
					<li><a class="parent" href="#"><i class="icon-file-alt"></i>
							조회</a>
						<ul class="sub-menu">
							<li><a href="/orders/currentOrder">발주현황</a></li>
						</ul></li>
					<li><a class="parent" href="#"><i class="icon-file-alt"></i>
							기초정보</a>
						<ul class="sub-menu">
							<li><a href="/product/productInput">상품 등록</a></li>
						</ul></li>
					<li><a class="parent" href="#"><i class="icon-file-alt"></i>
							자재관리</a>
						<ul class="sub-menu">
							<li><a href="">입고 입력</a></li>
						</ul></li>
				</ul></li>
		</ul>
	</div>
</div>