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
					<strong><i class="fa fa-calculator"></i>개인별 급여 현황</strong>
				</h2>
			</div>
			<form action="/paymentCal" method="get">
				<table class="table table-striped">
					<thead class="thead">
						<tr>
						<th>
							<input type="text" id="datepickerTo" name='paydayTo'>
							&nbsp;-&nbsp;	
							<input type="text" id="datepickerFrom" name='paydayFrom'>
						</th>
						<th>
							<div>
								<label >사원명</label>
								<input type="text" id="searchUserIdInput" readonly="readonly"/>
								<a href="#myModal3" data-toggle="modal" style="color:white">
									<i class="fa fa-users" onclick="searchUser()" style="font-size:25"></i>
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
							<th>사번</th>
							<th>성명</th>
							<th>지급일자</th>
							<th>부서명</th>
							<th>총급여액</th>
							<th>총공제액</th>
							<th>총지급액</th>
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
					</tbody>
					<tfoot align="center">
						<tr>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
<!-- 		<button style="margin-left: 705px; background-color: #6E6867;" -->
<!-- 			class="btn btn-info">신규등록</button> -->
	</div>
</div>
<div class="modal fade" id="myModal3">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div style="margin-left: 75px;">
					<input type="text" id="modalSearchUserId" />
					<button style="background-color: #6E6867;" class="btn btn-info"
						type="submit">검색</button>
				</div>
			</div>
			<div class="modal-body">
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table style="border-spacing: 6px; border-collapse: separate;">
						<thead>
							<tr>
								<th>사원번호</th>
								<th>사원명</th>
							</tr>
						</thead>
						<tbody id="modalUserTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
<!-- 				<a href="#" class="btn">신규 등록</a>  -->
				<a href="#" data-dismiss="modal" class="btn" id="searchModalClose">Close</a>
			</div>
		</div>
	</div>
</div>
  
<script>
	$(document).ready(function(){
		$("#datepickerFrom,#datepickerTo").datepicker({
			 dateFormat: 'yy-mm-dd' //Input Display Format 변경
	             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	             ,changeYear: true //콤보박스에서 년 선택 가능
	             ,changeMonth: true //콤보박스에서 월 선택 가능                
	             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	             ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	             ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	             ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,minDate: "-3Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	            ,maxDate: "+2Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)        
		});
		$("#datepickerTo").datepicker('setDate','today-1M');
		$("#datepickerFrom").datepicker('setDate','today');
	});

</script>

<script type="text/javascript" src="/js/datepicker.js"></script>