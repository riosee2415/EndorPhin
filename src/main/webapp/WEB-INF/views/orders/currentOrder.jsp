<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table {
	display: table;
	height: 80px;
	position: relative;
}

.table td {
	display: table-cell;
	vertical-align: middle !important;
}

.nav>li>a:focus, .nav>li>a:hover {
	text-decoration: none;
	background-color: #eee;
}

.nav-tabs>li>a:hover {
	border-color: #eee #eee #ddd;
}

.nav>li>a {
	position: relative;
	display: block;
	padding: 10px 15px;
}

.nav-tabs>li>a {
	margin-right: 2px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 4px 4px 0 0;
}

.tabControl {
	color: #000 !important;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: default;
	background-color: #fff;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}
</style>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3>
			<i class="fa fa-calculator"></i>발주 현황
		</h3>
		<form action="" id="searchFrm" method="get">
			<table>
				<tr>
					<td>아직 안되는 검색 :</td>
					<td><input type="text" class="search-query form-control"
						id="searchPay" name="productName" placeholder="Search" /></td>
					<td>
						<button class="bttn-fill bttn-md bttn-warning" type="button"
							id="searchBtn">
							<span class=" glyphicon glyphicon-search">검색</span>
						</button>
					</td>
				</tr>
			</table>
		</form>
		<form action="" id="deleteFrm" method="post">
			<input type="hidden" name="deprostatus" value="2" />
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
							<th>구분</th>
							<th>발주번호</th>
							<th>발주일</th>
							<th>납기일</th>
							<th>거래처명</th>
							<th>내역</th>
							<th>입고액</th>
							<th>발주금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderList}" var="vo">
							<tr>
								<td><input type="checkbox" class="check"></td>
								<td>${vo.sortation}</td>
								<td><a
									class="bttn-stretch bttn-md bttn-warning orderDialog">${vo.orderCode}</a></td>
								<td>${vo.dueDate}</td>
								<td>${vo.paymentDueDate}</td>
								<td>${vo.clientname}</td>
								<td>${vo.orderList}</td>
								<td>${vo.receivepay}</td>
								<td>${vo.orderPrice}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delProdBtn" value="EXCEL">
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
<div class="dialog">
	<span class="dialog__close">&#x2715;</span> <label for="inputName">발주서
		상세</label>
	<div class="modal-body">
		<form action="/orders/deleteOrder" method="post" id="dialogFrm">
			<div role="tabpanel">
				<!-- Nav tabs -->
				<div>
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#orderDetail"
							aria-controls="uploadTab" role="tab" data-toggle="tab"
							class="tabControl active">발주 상세</a></li>
						<li role="presentation"><a href="#orderslist"
							aria-controls="browseTab" role="tab" data-toggle="tab"
							class="tabControl">발주 품목</a></li>
						<li role="presentation"><a href="#receiveList"
							aria-controls="browseTab" role="tab" data-toggle="tab"
							class="tabControl">입고 현황</a></li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane" id="orderDetail">
						<table class="table table-hover">
							<tr>
								<th>발주일(*)</th>
								<td><input class="form-control bootTapText dueDatePicker"
									name="dueDate" type='text' readonly/></td>
								<th>발주내역(*)</th>
								<td><input class="form-control bootTapText"
									name="orderList" type='text' readonly/></td>
							</tr>
							<tr>
								<th>부서</th>
								<td><input class="form-control bootTapText" name="deptCode"
									type='text' readonly /></td>
								<th>담당자</th>
								<td><input class="form-control bootTapText" name="userId"
									type='text' readonly /></td>
							</tr>
							<tr>
								<th>거래처</th>
								<td><input type="hidden" name="clientCode" /> <input
									class="form-control bootTapText" name="clientname" type='text'
									readonly /></td>
								<th>납기일</th>
								<td><input class="form-control bootTapText dueDatePicker"
									name="paymentDueDate" type='text' readonly/></td>
							</tr>
						</table>
					</div>
					<div role="tabpanel" class="tab-pane" id="orderslist"></div>
					<div role="tabpanel" class="tab-pane" id="receiveList"></div>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
function dialog(){
	$(".orderDialog").click(function(e){
		$(".tabControl").show();
		$(".tab-pane").eq(0).toggleClass("active");
		$(".dialog").toggleClass('dialog--active');
		$.ajax({
			method : "post",
			url : "/orders/selectOrder",
			data :{
				orderCode : $(this).html(),
				check : true
			},
			success : function(data) {
				console.log(data);
				inputData(data);
			}
		});
	});
	
	$('.dialog__close').on('click', function() {
		$(".dialog").removeClass('dialog--active');
		$(".tab-pane").removeClass('active show');
	});

	$(document).keyup(function(e) {
		if (e.keyCode === 27) {
			$(".dialog").removeClass('dialog--active');
			$(".tab-pane").removeClass('active show');
		}
	});
}
function inputData(data){
	$("input[name=dueDate]").val(data.orderVo.dueDate);
	$("input[name=orderList]").val(data.orderVo.orderList);
	$("input[name=deptCode]").val(data.orderVo.deptCode);
	$("input[name=userId]").val(data.orderVo.userId);
	$("input[name=clientname]").val(data.orderVo.clientname);
	$("input[name=paymentDueDate]").val(data.orderVo.paymentDueDate);
	var ordersList = '<table class=\'table table-hover\'>';
	ordersList+='<tr><th>발주번호</th><th>상품명</th><th>규격</th><th>수량</th><th>단가</th><th>공급가액</th></tr>';
	for (var i = 0; i < data.detailList.length; i++) {
		var tempDetail=data.detailList[i];
		ordersList+="<tr>"
		+"<td>"+tempDetail.orderCode+"</td>"
		+"<td>"+tempDetail.productname+"</td>"
		+"<td>"+tempDetail.standard+"</td>"
		+"<td>"+tempDetail.quantity+"</td>"
		+"<td>"+tempDetail.baseprice+"</td>"
		+"<td>"+tempDetail.baseprice*tempDetail.quantity+"</td>"
		+"</tr>";
	}
	ordersList +='</table>';
	$("#orderslist").html(ordersList);
	receiveInput(data);
}
function receiveInput(data){
	var receiveText='<table class=\'table table-hover\'>';
	receiveText +='<tr><th>입고번호</th><th>입고일</th><th>창고명</th><th>품목</th><th>수량</th><th>입고액</th></tr>';
	for (var i = 0; i < data.receiveDetail.allReceive.length; i++) {
		if(data.receiveDetail.allReceive[i].sortation==0){
			for (var j = 0; j < data.receiveDetail.allReceiveDetail[i].length; j++) {
				var ard = data.receiveDetail.allReceiveDetail[i][j];
				receiveText+='<tr>'
				+'<td>'+ard.receiveCode+'</td>'
				+'<td>'+data.receiveDetail.allReceive[i].receiveDate+'</td>'
				+'<td>'+data.receiveDetail.allReceive[i].warehousename+'</td>'
				+'<td>'+ard.productname+'</td>'
				+'<td>'+ard.quantity+'</td>'
				+'<td>'+ard.baseprice*ard.quantity+'</td>'
				+'</tr>';
			}
		}
	}
	receiveText+="</table>";
	$('#receiveList').html(receiveText);
}
$(document).ready(function(){
	dialog();
})
</script>