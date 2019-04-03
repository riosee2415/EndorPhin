<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">

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
					</tbody>
					<tfoot>
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

<script>
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
