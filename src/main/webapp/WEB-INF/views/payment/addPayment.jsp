<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>급여 등록</h2>
<form action="/addPayment" id="searchFrm">
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
			<tr class="payTr" data-userid="${vo.userId }">
				<td><a href="#detailLayer" data-toggle="modal"
			data-target="#my80sizeModal" class="paymentDetail">${vo.userId }</a></td>
				<td>${vo.positionname}</td>
				<td>${vo.usernm}</td>
				<td>${vo.deptname}</td>
				<td>${vo.totalSalary}</td>
				<td>${vo.totalWage}</td>
				<td>${vo.joincompany}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 80% size Modal  등록 모달 창-->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog"
	aria-labelledby="my80sizeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content modal-lg">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">급여 등록</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<table>
						<tr>
							<th><label>사번</label></th>
							<td><input class="modalUserInfo" readonly="readonly" size="12"/></td>
							<th><label>직급</label ></th>
							<td><input class="modalUserInfo" readonly="readonly" size="12"/></td>
							<th><label>이름</label></th>
							<td><input class="modalUserInfo" readonly="readonly" size="12"/></td>
							<th><label>부서</label></th>
							<td><input class="modalUserInfo" readonly="readonly" size="12"/></td>
						</tr>
					</table>
				</div>
				
				<div class="form-group">
					<label for="InputEmail">급여내역</label>
					<div style="overflow:scroll; width:600px; height:200px;">
						<table>
							<thead>
								<tr id="firModalProductThead">
								</tr>
							</thead>
							<tbody id="firModalProductTbody">
								
							</tbody>
						</table>
					</div>					
						<a data-toggle="modal" href="#myModal4" class="btn btn-primary" id="modalAddProduct">급여 등록</a>
				</div>
				
				<div class="form-group">
					<label for="InputEmail">공제내역</label>
					<div style="overflow:scroll; width:600px; height:200px;">
						<table>
							<thead>
								<tr id="firModalDeductThead">
									<th>공제일</th>
								</tr>
							</thead>
							<tbody id="firModalDeductTbody">
								
							</tbody>
						</table>
					</div>
						<a data-toggle="modal" href="#myModal4" class="btn btn-primary" id="modalAddDeduct">공제 등록</a>
				</div>
			</div>
				
		</div>
	</div>
</div>

 <!-- second modal -->
    <div class="modal" id="myModal4" data-backdrop="static" aria-hidden="true" style="display: none; z-index: 1080;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="secondModalTitle"></h4>
              <button id="secondClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div><div class="container"></div>
            <div class="modal-body">
            	<h3>작성일</h3><input type="text" id="datepicker">
            	<div style="overflow:scroll; width:450px; height:200px;">
	            	<table>
	            		<thead>
	            			<tr>
	            				<th>항목코드</th>
	            				<th>항목명</th>
	            				<th>금액</th>
	            			</tr>
	            		</thead>
	            		<tbody id="secondModalTbody">
	            		</tbody>
	            	</table>
            	</div>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn" id="secondClose">Close</a>
              <a href="#" class="btn" id="secondModalSave">Save changes</a>
            </div>
          </div>
        </div>
    </div>
    
    

<script>
	var deproductList;
	
	$("#searchBtn").on("click", function() {
		if ($("#searchPay").val() != "") {
			$("#searchFrm").submit();
		} else
			alert("문자를 입력하세요!")
	})
	
	$("#modalAddProduct").click(function(){
		$("#secondModalTitle").html("급여");
		secondModalDataInput(deproductList,1);
	})
	$("#modalAddDeduct").click(function(){
		$("#secondModalTitle").html("공제");
		secondModalDataInput(deproductList,2);
	})
	
	$("#secondModalSave").click(function(){
		secondModalEvent();
		$("#secondClose").click();
		$("#secondClose1").click();
	})
	
	function secondModalEvent(){
		var check = confirm('등록하시겠습니까?');
		if(check & parseInt($("#totalMoney").val())>0){
			var dateSplit = $("#datepicker").val().split('-');
			var tempList = new Array();
			var paydate = dateSplit[0]+dateSplit[1]+dateSplit[2];
			var userId = $(".modalUserInfo").val();
			tempList.push(userId);
			tempList.push(paydate);
			var decdList = new Array();
			var decdPayList = new Array();
			$(".secondMoney").each(function(){
				if(parseInt($(this).val())>0){
					decdList.push($(this).data('decd'));
					decdPayList.push($(this).val());
				}
			});
			
			$.ajax({
				method : "post",
				url : "/insertAndUpdatePayment",
				contentType: "application/json; charset=UTF-8",	
				data : JSON.stringify({
					userid : userId,
					payday : paydate,
					decdMap : decdList,
					decdPayList : decdPayList
				}),
				success : function(data) {
// 					dataInput(data);
				}
			})
			
		}
		else{
			alert("값이 입력되지않아 취소되었습니다.");
		}
	}
	$(".paymentDetail").click(function(){
		$(".modalUserInfo").eq(0).val($(this).html());
		for(var i=1;i<4;i++){
			$(".modalUserInfo").eq(i).val($(this).closest(".payTr").children("td").eq(i).html());
		}
		$.ajax({
			method : "get",
			url : "/getPaymentList",
			data : "userid=" + $(this).html(),
			success : function(data) {
				dataInput(data);
				deproductList=data.divList;
			}
		});
	})
	$(document).ready(function(){
	});
	
	
	function secondModalDataInput(deproductList,deprostatus){
		$("#secondModalTbody").html("");
		for (var i = 0; i < deproductList.length; i++) {
			if(deproductList[i].deprostatus==1){
				$("#secondModalTbody").append("<tr class=\'secondProductAdd\'>");
			}
			else if(deproductList[i].deprostatus==2){
				$("#secondModalTbody").append("<tr class=\'secondDeductAdd\'>");
			}
			if(deproductList[i].deprostatus==deprostatus){
				$("#secondModalTbody").append("<td>"+deproductList[i].deductCode+"</td>");
				$("#secondModalTbody").append("<td>"+deproductList[i].deductName+"</td>");
				$("#secondModalTbody").append("<td>"+"<input data-decd=\'"+deproductList[i].deductCode+"\' value=0 type=\'text\' class=\'secondMoney\'/>"
												+"</td>");
			}
				$("#secondModalTbody").append("</tr>");
		}	
		$("#secondModalTbody").append("<tr><td></td><td>총금액</td><td>"+
				"<input type=\'text\' value=0 readonly=\'readonly\' id='totalMoney'/></td></tr>");
		
		$(".secondMoney").on("change",function(){
			$('#totalMoney').val(parseInt(0));
			$(".secondMoney").each(function(){
				$('#totalMoney').val(parseInt($('#totalMoney').val())+parseInt($(this).val()));
			})
		})
	}
	
	function dataInput(data){
		var deductName = new Map();
		
		$("#firModalProductThead").html("");
		$("#firModalProductTbody").html("");
		$("#firModalDeductThead").html("");
		$("#firModalDeductTbody").html("");
		$("#firModalProductThead").append("<th>급여일</th>");
		$("#firModalDeductThead").append("<th>공제일</th>");
		for(var i=0;i<data.divList.length;i++){
			if(data.divList[i].deprostatus==1){
				$("#firModalProductThead").append("<th>"+data.divList[i].deductName+"</th>");
			}
			else{
				$("#firModalDeductThead").append("<th>"+data.divList[i].deductName+"</th>");
			}
				deductName.set(data.divList[i].deductCode,0);
		}
		$("#firModalProductThead").append("<th>총급여액</th>");
		$("#firModalDeductThead").append("<th>총공제액</th>");
		
		if(data.hasOwnProperty('paymentList')){
			
			for (var i = 0; i < data.paymentList.length; i++) {
				var deductNameTemp = deductName;
				$("#firModalDeductTbody").append("<tr>");
				$("#firModalProductTbody").append("<tr>");
				$("#firModalDeductTbody").append("<td><a href='#'>"+data.paymentList[i].payDay+"</a></td>");
				$("#firModalProductTbody").append("<td><a href='#'>"+data.paymentList[i].payDay+"</a></td>");
				for (var a = 0; a < data.paymentList.length; a++) {
					if(data.paymentDetailList[a]!=null&&
							data.paymentDetailList[a][0].payCode==data.paymentList[i].payCode){
						deductNameTemp=setDNT(data,deductNameTemp,a);
					}
				}	
				
				
				for (var j = 0; j < data.divList.length; j++) {
					if(data.divList[j].deprostatus==1){
						$("#firModalProductTbody").append("<td>"+deductNameTemp.get(data.divList[j].deductCode)+"</td>");
					}
					else{
						$("#firModalDeductTbody").append("<td>"+deductNameTemp.get(data.divList[j].deductCode)+"</td>");
					}
				}
				$("#firModalDeductTbody").append("</tr>");
				$("#firModalProductTbody").append("</tr>");
			}
		}
		
	}
	function setDNT(data,deductNameTemp,a){
		
		for (var i = 0; i < data.paymentDetailList[a].length; i++) {
			deductNameTemp.set(data.paymentDetailList[a][i].deductCode,data.paymentDetailList[a][i].deductPay);
		}
		return deductNameTemp;
	}
</script>
<script type="text/javascript" src="/js/datepicker.js"></script>