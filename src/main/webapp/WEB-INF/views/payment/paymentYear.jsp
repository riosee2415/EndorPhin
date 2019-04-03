<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">

<div class="container">
	<div class="row">
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<h2>
					<strong><i class="fa fa-calculator"></i>연도별 급여 조회</strong>
				</h2>
			</div>
			<form action="/paymentYear" method="get">
				<table class="table table-striped">
					<thead class="thead">
						<tr>
						<th>
							<div>
								<label >해당 년도 :</label>
								<select name="paydayYear" style="width: 200px;" >
								</select>
							</div>
						</th>
						<th>
							<div>
								<label >사원명</label>
								<input type="text" name="userid" id="searchUserIdInput" placeholder="사원 선택 " readonly="readonly"/>
								<a href="#" data-toggle="modal" style="color:white" id="myModal3In">
									<i class="fa fa-users" style="font-size:25"></i>
								</a>
							</div>
						</th>
							<th><button style="background-color: #6E6867;" class="btn btn-info" type="submit">검색</button></th>
					</thead>
				</table>
			</form>
		</div>
	</div>


</div>


<div class="container" style="margin-top: 50px">
	<div class="row">
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<table class="table table-striped">
					<thead class="thead">
						<tr>
							<th>년도</th>
							<th>사번</th>
							<th>성명</th>
							<th>부서명</th>
							<th>총급여액</th>
							<th>총공제액</th>
							<th>총지급액</th>
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
						<c:forEach items="${paymentYearList}" var="vo">
							<tr>
								<td>${paydayYear}</td>
								<td><a href="#" class="gotoPaymentYearDetail" data-year="${paydayYear}"
								 style="color:brown;">${vo.userId}</a></td>
								<td>${vo.usernm}</td>
								<td>${vo.deptname}</td>
								<td>${vo.totalSalary}</td>
								<td>${vo.totalWage}</td>
								<td>${vo.totalSalary-vo.totalWage}</td>
							<c:set var="totalSalarySum" value="${totalSalarySum+vo.totalSalary}"/>
							<c:set var="totalSalaryWage" value="${totalSalaryWage+vo.totalWage}"/>
							<c:set var="totalSalaryResult" value="${totalSalaryResult+(vo.totalSalary-vo.totalWage)}"/>
							<tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" align="center">계</td>
							<td>${totalSalarySum}</td>
							<td>${totalSalaryWage}</td>
							<td>${totalSalaryResult}</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>
<%@ include file="employeeSearch.jsp" %>  
<div class="container">
	<div class="row">
		<button style="margin-left: 705px; background-color: #6E6867;"
			class="btn btn-info">신규등록</button>
	</div>
</div>
<form action="/paymentYearDetail" id="gotoDetailFrm">
</form>

<script>
	$(".gotoPaymentYearDetail").click(function(){
		$("#gotoDetailFrm").append("<input name=\'userid\' type=\'hidden\' value=\'"+$(this).html()+"\' />");
		$("#gotoDetailFrm").append("<input name=\'paydayYear\' type=\'hidden\' value=\'"+$(this).data('year')+"\' />");
		$("#gotoDetailFrm").submit();
	});
	$(document).ready(function(){
		for (var i = -5; i < 3; i++) {
			$("select[name=paydayYear]").append("<option value="+(new Date().getFullYear()+i)+">"
					+(new Date().getFullYear()+i)+"년</option>")
		}
		
		$("select[name=paydayYear]").val(${paydayYear});
		modalTrEvent();
	});
	$("#myModal3In").click(function(){
		$("#myModal3").modal("show");
	});
</script>
<script type="text/javascript" src="/js/employeeModalSearch.js"></script>
