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
		<h3><i class="fa fa-calculator"></i>발주 입력</h3>
		<form action="/product/productInput" id="searchFrm" method="get">
			<table>
				<tr>
					<td>상품명 검색 :</td>
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
		<form action="/product/deleteProduct" id="deleteFrm" method="post">
			<div class="table-responsive">
				
			</div><table class="table table-hover">
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
				<button type="button" class="bttn-jelly bttn-md bttn-warning orderDialog"
					style="margin-left: 20px">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
	<div class="dialog">
		 <span class="dialog__close">&#x2715;</span> <label for="inputName">발주서 상세</label>
		 <input type="hidden" name="productCode" id="dialog_productCode"/>
		 <div class="modal-body">
			<div role="tabpanel">
                    <!-- Nav tabs -->
                    <div>
	                    <ul class="nav nav-tabs" role="tablist">
	                        <li role="presentation" class="active"><a href="#uploadTab" aria-controls="uploadTab" 
	                        				role="tab" data-toggle="tab" class="tabControl">수입품</a>
	                        </li>
	                        <li role="presentation"><a href="#browseTab" aria-controls="browseTab" role="tab" 
	                        				data-toggle="tab" class="tabControl">내수품</a>
	                        </li>
	                    </ul>
                    </div>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane" id="uploadTab">
                       	</div>
                        <div role="tabpanel" class="tab-pane" id="browseTab">
                        	</div>
                    </div>
                </div>
			<input type="button" id="dialog_updBtn" class="btn btn-default modalUpd" value="수정" />
			<button id="dialog_delBtn" class="btn btn-default dialog__action modalUpd">삭제</button>
			<input type="button" id="dialog_insBtn" class="btn btn-default modalIns" value="등록" />
		</div>
	</div>

<script>
	$(".tabControl").on('click',function(){
		$(".tab-pane").removeClass('show');	
	})
	$(document).ready(function(){
		$("#uploadTab,#browseTab").load("/tab/orderInputTap.html");
		dialog();
	})
	function dialog(){
		$(".orderDialog").click(function(e){
			$(".tabControl").show();
			$(".tab-pane").eq(0).toggleClass("active");
			$("#dialog_productCode").val('');
			$(".dialog").toggleClass('dialog--active');
			if($(this).text()!='신규등록'){
				$(".modalIns").hide();
				$('.modalUpd').show();
				$.ajax({
					method : "post",
					url : "/orders/selectOrder",
					data : "orderCode=" + $(this).html(),
					success : function(data) {
						console.log(data);
						inputData(data);
					}
				});
			}
			else{
				$('input[type=text]').val('');
				$(".modalIns").show();
				$('.modalUpd').hide();
			}
		});
		
		// Close the dialog - click close button
		$('.dialog__close').on('click', function() {
			$(".dialog").removeClass('dialog--active');
			$(".tab-pane").removeClass('active show');
		});

		// Close the dialog - press escape key // key#27
		$(document).keyup(function(e) {
			if (e.keyCode === 27) {
				$(".dialog").removeClass('dialog--active');
				$(".tab-pane").removeClass('active show');
			}
		});
	}
	function inputData(data){
		$(".tabControl").each(function(index,item){
			if($(item).html()!=data.orderVo.sortation)
				$(item).hide();
		});
			$("input[name=dueDate]").val(data.orderVo.dueDate);
			$("input[name=orderList]").val(data.orderVo.orderList);
			$("input[name=deptCode]").val(data.orderVo.deptCode);
			$("input[name=userId]").val(data.orderVo.userId);
			$("input[name=clientname]").val(data.orderVo.clientname);
			$("input[name=paymentDueDate]").val(data.orderVo.paymentDueDate);
			$("input[name=orderPrice]").val(data.orderVo.orderPrice);
	}
	$("input[name=orderPrice]").on('attrchange',function(){
		$("input[name=surtax]").val($("input[name=orderPrice]").val()/10);
	})
</script>


<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">