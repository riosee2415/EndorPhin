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
					<strong><i class="fa fa-calculator"></i> 급여계산</strong>
				</h2>
			</div>
			<form action="/paymentCal" method="get">
				<table class="table table-striped">
					<thead class="thead">
						<tr>
							<th>년도 <select name="paydayYear" style="width: 200px;" >
							</select></th>
							<th>월 <select name="paydayMonth" style="width: 200px;">
									<option value="1">1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
							</select>
	
							</th>
							<th><button type="submit">검색</button></th>
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
							<th>월</th>
							<th>급여구분</th>
							<th>총급여액</th>
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
						<c:forEach items="${paymentList}" var="vo">
							<tr>
								<c:set var="totalSalarySum" value="${totalSalarySum+vo.totalSalary}"/>
								<td><a href="#" class="">${fn:split(vo.payDay,'-')[0]}</a></td>
								<td>${fn:split(vo.payDay,'-')[1]}</td>
								<td>급여</td>
								<td>${vo.totalSalary}</td>
							<tr>
						</c:forEach>
					</tbody>
					<tfoot align="center">
						<tr>
							<td colspan="2">계</td>
							<td colspan="2">${totalSalarySum}</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<button style="margin-left: 705px; background-color: #6E6867;"
			class="btn btn-info">신규등록</button>
	</div>
</div>

<script>
	$(document).ready(function(){
		for (var i = -3; i < 3; i++) {
			$("select[name=paydayYear]").append("<option value="+(new Date().getFullYear()+i)+">"
					+(new Date().getFullYear()+i)+"년</option>")
		}
		$("select[name=paydayYear]").val(new Date().getFullYear());
		$("select[name=paydayMonth]").val(new Date().getMonth());
	});

</script>
