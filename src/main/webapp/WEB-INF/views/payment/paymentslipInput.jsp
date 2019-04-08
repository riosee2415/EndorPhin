<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">

<div class="container">
	<div class="row">
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<h2>
					<strong><i class="fa fa-calculator"></i>급여 전표 입력</strong>
				</h2>
			</div>
		</div>
	</div>

</div>

<div class="container" style="margin-top: 20px">
	<div class="row">
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<div style="overflow: scroll; width: 1000px; height: 600px;">
					<form id="insertSlipFrm" action="/writeSlipPayment" method="post">
						<input type="hidden" name="paydayMonth" value="${paydayMonth}">
						<table class="table table-striped">
							<thead class="thead">
								<tr>
									<th>계정과목</th>
									<th>거래처</th>
									<th>부서</th>
									<th>적요</th>
									<th>차변</th>
									<th>대변</th>
								</tr>
							</thead>
							<tbody id="mainPaymentListTbody">
								<c:forEach var="i" begin="0" end="${fn:length(deptList)-1}">
									<tr>
										<td><input name="establishCode" value="${establish[i].establishCode}" 
												type="hidden" />${establish[i].establishNameKor}</td>
										<td><input name="clientCard" value="기타" 
												type="hidden" />기타</td>
										<td>${deptList[i]}</td>
										<td>급여</td>
										<td><input class="debitText" name='price' type="text" value="${totalSalary[i]}" /></td>
										<c:set var="allSalary" value="${allSalary+totalSalary[i]}" />
										<td><input name="status" value="0" type="hidden" />0</td>
									</tr>
								</c:forEach>
	
								<c:forEach var="i" begin="0"
									end="${fn:length(divList)*fn:length(deptList)-1}">
									<tr>
										<td><input name="establishCode" value="254" 
												type="hidden" />예수금</td>
										<td><input name="clientCard" value="기타" 
												type="hidden" />기타</td>
										<td>${detail4Slip[i].deptname}</td>
										<c:forEach items="${divList}" var="vo">
											<c:if test="${vo.deductCode==detail4Slip[i].deductCode}">
												<td>${vo.deductName}</td>
											</c:if>
										</c:forEach>
										<td><input name="status" value="1" type="hidden" />0</td>
										<td><input class="creditText" name='price' 
											type="text" value="${detail4Slip[i].deductPay}" /></td>
										<c:set var="allWage"
											value="${allWage+detail4Slip[i].deductPay}" />
									</tr>
								</c:forEach>
								<tr>
									<td><input name="establishCode" value="103" 
												type="hidden" />보통예금</td>
									<td><input name="clientCard" value="은행" 
												type="hidden" />신한은행</td>
									<td>전체</td>
									<td>실지급액</td>
									<td><input name="status" value="1" type="hidden" />0</td>
									<td><input type="text" name='price' class="creditText" value="${allSalary-allWage}"/></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4"></td>
									<td><input name="total" id="allDebit" type="text" readonly="readonly" value="${allSalary}"/></td>
									<td><input id="allCredit" type="text" readonly="readonly" value="${allSalary}"/></td>
								</tr>
							</tfoot>
						</table>
						<input style="margin-left: 750px; background-color: #6E6867;"
		 			class="btn btn-info" id="submitBtn" value="전표 등록" />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<!-- 		<form action="/paymentPersonalExceldown" id="personalFrm"> -->
		<!-- 		<button style="margin-left: 705px; background-color: #6E6867;" -->
		<!-- 			class="btn btn-info">Excel</button> -->
		<!-- 		</form> -->
	</div>
</div>

<%@ include file="employeeSearch.jsp"%>
<div class="modal fade" id="myModal4" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<table>
						<tr>
							<th><label>사번</label></th>
							<td><input style="width: 50px" class="modalUserInfo"
								disabled="disabled" size="12" /></td>
							<th><label>이름</label></th>
							<td><input style="width: 100px" class="modalUserInfo"
								disabled="disabled" size="12" /></td>
							<th><label>지급일자</label></th>
							<td><input style="width: 160px" class="modalUserInfo"
								disabled="disabled" size="12" /></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-body">
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table style="border-spacing: 6px; border-collapse: separate;">
						<thead>
							<tr>
								<th>항목명</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody id="modalPaymentTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<!-- 				<a href="#" class="btn">신규 등록</a>  -->
				<a href="" data-dismiss="modal" class="btn" aria-hidden="true">Close</a>
			</div>
		</div>
	</div>
</div>

<script>
	var allDebit,allCredit;
	$(document).ready(function(){
		allDebit=$("#allDebit").val();
		allCredit=$("#allCredit").val();
		$(".debitText").on("change",function(){
			allDebit=0;
			$('.debitText').each(function(){
				allDebit+=parseInt($(this).val());
			});
			$("#allDebit").val(allDebit);
		});
		$(".creditText").on("change",function(){
			allCredit=0;
			$('.creditText').each(function(){
				allCredit+=parseInt($(this).val());
			});
			$("#allCredit").val(allCredit);
		});
	});
	$("#submitBtn").click(function(){
		if(allDebit!=allCredit){
			alert("차변과 대변이 일치하지 않습니다.");
			return false;
		}else if(!confirm("전표를 등록하시겠습니까?"))
			return false;	
		$("#insertSlipFrm").submit();
	})
</script>

<script type="text/javascript" src="/js/datepicker.js"></script>