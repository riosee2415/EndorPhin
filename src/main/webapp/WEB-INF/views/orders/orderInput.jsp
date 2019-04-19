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
</style>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3>
			<i class="fa fa-calculator"></i>발주 입력
		</h3>
		<form action="/product/productInput" id="searchFrm" method="get">
			<table>
				<tr>
					<td>추후 개발 할 검색 :</td>
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
		<form action="/orders/deleteOrder" id="deleteFrm" method="post">
			<div class="table-responsive"></div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkAll"></th>
						<th>발주번호</th>
						<th>구분</th>
						<th>발주일</th>
						<th>거래처</th>
						<th>내역</th>
						<th>발주금액</th>
						<th>입고여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="vo">
						<tr>
							<td><input type="checkbox" class="check"></td>
							<td><a class="bttn-stretch bttn-md bttn-warning orderDialog">${vo.orderCode}</a></td>
							<td>${vo.sortation}</td>
							<td>${vo.dueDate}</td>
							<td>${vo.clientname}</td>
							<td>${vo.orderList}</td>
							<td>${vo.orderPrice}</td>
							<td>${vo.status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delProdBtn" value="선택 삭제">
				<button type="button"
					class="bttn-jelly bttn-md bttn-warning orderDialog"
					style="margin-left: 20px">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
<div class="dialog" onkeydown="return captureReturnKey(event)">
	<span class="dialog__close">&#x2715;</span> <label for="inputName">발주서
		상세</label>
	<div class="modal-body">
		<form action="/orders/deleteOrder" method="post" id="dialogFrm">
			<div role="tabpanel">
				<!-- Nav tabs -->
				<div>
					<input type="hidden" name="sortation" />
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#tabContent"
							aria-controls="uploadTab" role="tab" data-toggle="tab"
							class="tabControl active">수입품</a></li>
						<li role="presentation"><a href="#tabContent"
							aria-controls="browseTab" role="tab" data-toggle="tab"
							class="tabControl">내수품</a></li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane" id="tabContent"></div>
				</div>
			</div>
			<div>
				<input type="hidden" name="orderCode" />
				<button type="button" id="dialog_updBtn"
					class="btn btn-default modalUpd">수정</button>
				<button type="button" id="dialog_delBtn"
					class="btn btn-default dialog__action modalUpd">삭제</button>
				<button type="button" id="dialog_insBtn"
					class="btn btn-default modalIns">등록</button>
			</div>
		</form>
	</div>
</div>

<script>
	//ENTER 안먹게 하는것
	function captureReturnKey(e) {
	    if(e.keyCode==13 && e.srcElement.type != 'textarea')
	    return false;
	}
	$("#delProdBtn").click(function(){
		var item = $(this);
		$("input[class=check]:checked").each(function(){
			item.append("<input type=\'hidden\' value="+$(this)+"/>");
		})
	});

	
	
	// 삭제 버튼
	$("#dialog_delBtn").click(function(){
		$("#dialogFrm").attr("action","/orders/deleteOrder");
		$("#dialogFrm").submit();
	});
	
	// 등록/수정 버튼
	$("#dialog_insBtn,#dialog_updBtn").click(function(){
		$("#dialogFrm").attr("action","/orders/insertOrder");
		$(".tabControl").each(function(){
			if($(this).hasClass('active')){
				$("input[name=sortation]").val($(this).html());
			}
		})
		if ($(".dialogPdcd").length==0) {
			alert("상품이 없습니다.");
			return;
		}
		$("#dialogFrm").submit();
	});
	
	$("#checkAll").on("click", function() {
		if (this.checked == false) {
			$("input[class=check]").each(function() {
				this.checked = false;
			});
		} else {
			$("input[class=check]").each(function() {
				this.checked = true;
			});
		}
	});
	
	var deptList = new Map();
	var employeeList = new Map();
	var clientList = new Map();
	
	$(".tabControl").on('click',function(){
		$(".tab-pane").removeClass('show');	
	})
	$(document).ready(function(){
		
		
		//모달 불러오기
		$("#tabContent").load("/tab/orderInputTap.jsp");
		dialog();
		$("input[name=sortation]").val();
	})
	function dialog(){
		$(".orderDialog").click(function(e){
			$(".tabControl").show();
			$(".tab-pane").eq(0).toggleClass("active");
			$(".dialog").toggleClass('dialog--active');
			$('input[type=text]').val('');
			$('#dialogProductTbody').html('');
			if($(this).text()!='신규등록'){
				$("input[name=orderCode]").val($(this).html());
				$(".modalIns").hide();
				$('.modalUpd').show();
				$.ajax({
					method : "post",
					url : "/orders/selectOrder",
					data : "orderCode=" + $(this).html(),
					success : function(data) {
						inputData(data);
					}
				});
			}
			else{
				$("input[name=orderCode]").val('');
				$(".modalIns").show();
				$('.modalUpd').hide();
			}
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
		$(".tabControl").each(function(index,item){
			if($(item).html()==data.orderVo.sortation){
				$(item).click();
				$(".tabControl").parents('li').removeClass('active');
				$(item).parents('li').toggleClass('active');
			}
			else
				$(item).attr('style','display:none !important');
		});
		$("input[name=dueDate]").val(data.orderVo.dueDate);
		$("input[name=orderList]").val(data.orderVo.orderList);
		$("input[name=deptCode]").val(data.orderVo.deptCode);
		$("input[name=userId]").val(data.orderVo.userId);
		$("input[name=clientname]").val(data.orderVo.clientname);
		$("input[name=paymentDueDate]").val(data.orderVo.paymentDueDate);
		$("input[name=orderPrice]").val(data.orderVo.orderPrice).change();
		
		for (var i = 0; i < data.detailList.length; i++) {
			$("#dialogProductTbody").append("<tr>"
			+"<td><input type=\'checkbox\' class=\'detailCheck\'></td>"
			+"<td class=\'dialogPdcd\'>"+
				"<input type=\'hidden\' name=\'productCode\' value="+
				data.detailList[i].productCode+" />"+data.detailList[i].productCode+"</td>"
			+"<td>"+data.detailList[i].productname+"</td>"
			+"<td>"+data.detailList[i].standard+"</td>"
			+"<td>"+"<input type=\'text\' name=\'quantity\' value="
				+data.detailList[i].quantity+" class=\'form-control quanText\' />"+"</td>"
			+"<td class=\'baseprice\'>"+data.detailList[i].baseprice+"</td>"
			+"<td class=\'totalPrice\'>"+data.detailList[0].quantity*data.detailList[0].baseprice+"</td>");
			$("#dialogProductTbody").append("</tr>");
		}
		numChange();
	}
		
		function modalCheckEvent() {
			if (this.checked == false) {
				$("input[class=detailCheck]").each(function() {
					this.checked = false;
				});
			} else {
				$("input[class=detailCheck]").each(function() {
					this.checked = true;
				});
			}
		}
	function numChange(){
		$("#modalCheckAll").off("click");
		$("#modalCheckAll").on("click", modalCheckEvent);
		$(".quanText, .totalPrice").off('change');
		$(".quanText").on('change',function(){
			$(this).parents('td').
						next().next().html(parseInt($(this).val())*parseInt($(this).
												parents('td').next().html())).change();
		});
		$(".totalPrice").on('change',function(){
			var totalPrice=0;
			$(".totalPrice").each(function(){
				totalPrice+=parseInt($(this).html());
			})
			$("input[name=orderPrice]").val(totalPrice).change();
		})
	}
</script>


<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">