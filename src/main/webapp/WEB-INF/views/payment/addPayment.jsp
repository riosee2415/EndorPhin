<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>급여 등록</h2>
<form action="/addPayment" id="searchFrm">
	<input type="hidden" name="deprostatus" value="1" />
	<table>
		<tr>
			<td>사원명 검색 :</td>
			<td><input type="text" class="search-query form-control"
				id="searchPay" name="searchPaymentName" placeholder="Search" /></td>
			<td>
				<button class="btn btn-primary" type="button" id="searchBtn">
					<span class=" glyphicon glyphicon-search">검색</span>
				</button>
			</td>
		</tr>
	</table>
</form>

<table class="table table-striped">
	<thead>
		<tr>
			<th>사원번호</th>
			<th>직급명</th>
			<th>사원명</th>
			<th>부서명</th>
			<th>총급여액</th>
			<th>총공제액</th>
			<th>입사일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${paymentList}" var="vo">
			<tr class="payTr" data-decd="${vo.userId }">
				<td><a href="#detailLayer" class="deductDetail">${vo.userId }</a></td>
				<td>${vo.positionname}</td>
				<td>${vo.usernm}</td>
				<td>${vo.deptname}</td>
				<td>${vo.totalWage}</td>
				<td>${vo.totalSalary}</td>
				<td>${vo.joincompany}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>
	$("#searchBtn").on("click", function() {
		if ($("#searchPay").val() != "") {
			$("#searchFrm").submit();
		} else
			alert("문자를 입력하세요!")
	})
</script>