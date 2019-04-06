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
					<strong><i class="fa fa-calculator"></i> 급여명세서</strong>
				</h2>
			</div>
			<form action="/paymentCal" method="get">
				<table class="table table-striped">
					<thead class="thead">
						<tr>
							<th>년도 <select name="paydayYear" style="width: 200px;" >
							</select></th>
							<th>월 <select name="paydayMonth" style="width: 200px;">
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
							<th>총급여액</th>
							<th>총공제액</th>
							<th>총지급액</th>
							<th>장부반영</th> <!-- 테이블 확인 필요 -->
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
						<c:forEach items="${paymentList}" var="vo">
							<tr>
								<c:set var="totalSalarySum" value="${totalSalarySum+vo.totalSalary}"/>
								<c:set var="totalWageSum" value="${totalWageSum+vo.totalWage}"/>
								<c:set var="totalResult" value="${totalResult+vo.totalSalary-vo.totalWage}"/>
								<td><a href="#" class="gotoDetail" data-year="${fn:split(vo.payDay,'-')[0]}${fn:split(vo.payDay,'-')[1]}">
								${fn:split(vo.payDay,'-')[0]}</a></td>
								<td>${fn:split(vo.payDay,'-')[1]}</td>
								<td>${vo.totalSalary}</td>
								<td>${vo.totalWage}</td>
								<td>${vo.totalSalary-vo.totalWage}</td>
								<td>아니오</td>
							<tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" align="center">계</td>
							<td>${totalSalarySum}</td>
							<td>${totalWageSum}</td>
							<td colspan="2">${totalResult}</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>
<form action="/paymentYearDetail" id="gotoDetailFrm">
</form>

<div class="container">
	<div class="row" style="margin-left: 705px;">
		<select>
			<option selected="selected">회사 전체</option>
			<option>부서별</option>
		</select>
		<button style="background-color: #6E6867;" data-toggle="modal"
			class="btn btn-info" id="cogInputBtn">장부반영</button>
	</div>
</div>

<div class="modal" id="myModal" data-backdrop="static" aria-hidden="true" style="display: none; z-index: 1080;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="secondModalTitle"></h4>
              <button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3>전표 등록 기준</h3>
            	<div style="overflow:scroll; width:450px; height:200px;">
	            	<table>
	            		<thead>
	            			<tr>
	            				<th>부서코드</th>
	            				<th>부서명</th>
	            				<th>총급여액</th>
	            				<th>계정과목명</th>
	            			</tr>
	            		</thead>
	            		<tbody id="secondModalTbody">
	            		</tbody>
	            	</table>
            	</div>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn" id="secondAddClose">Close</a>
              <a href="#" class="btn" id="secondModalAddSave">등록</a>
            </div>
          </div>
        </div>
    </div>

<script>
	$(".gotoDetail").click(function(){
		$("#gotoDetailFrm").append("<input name=\'paydayYear\' type=\'hidden\' value=\'"+$(this).data('year')+"\' />");
		$("#gotoDetailFrm").submit();
	});
	$("#cogInputBtn").on('click',function(){
		var paydayMonth =$("select[name=paydayYear]").val()+$("select[name=paydayMonth]").val();
		$.ajax({
			method : "post",
			url : "/getPaymentForSlip",
			data : {
				paydayMonth : paydayMonth
			},
			success : function(data) {
				dataInput(data);
			}
		});
		$("#myModal").modal('show');
		
	});
	$(document).ready(function(){
		for (var i = -3; i < 3; i++) {
			$("select[name=paydayYear]").append("<option value="+(new Date().getFullYear()+i)+">"
					+(new Date().getFullYear()+i)+"년</option>");
		}
		for (var i = 1; i <= 12; i++) {
			if(i<10){
				$("select[name=paydayMonth]").append("<option value="+'0'+i+">"
						+i+"월</option>");
			}else
				$("select[name=paydayMonth]").append("<option value="+i+">"
						+i+"월</option>");
		}
		$("select[name=paydayYear]").val(new Date().getFullYear());
		if(new Date().getMonth()+1<10){
			$("select[name=paydayMonth]").val('0'+(new Date().getMonth()+1));
		}else
			$("select[name=paydayMonth]").val(new Date().getMonth()+1);
			
	});

</script>
