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

.bootTapText {
	width: 200px !important;
	display: inline !important;
}
</style>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3>
			<i class="fa fa-calculator"></i>입고 입력
		</h3>
		<form action="/product/productInput" id="searchFrm" method="get">
			<table>
				<tr>
					<td>later :</td>
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
			<input type="hidden" name="deprostatus" value="2" />
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
							<th>입고번호</th>
							<th>입고일</th>
							<th>창고명</th>
							<th>구분</th>
							<th>품목</th>
							<th>물자대</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${receiveList}" var="vo">
							<tr class="receiveTr" data-rccd="${vo.receiveCode}">
								<td><input type="checkbox" class="check" /><input
									type="hidden" class="valReceive"></td>
								<td><a href="#detailLayer"
									class="bttn-stretch bttn-md bttn-warning receiveDetail">${vo.receiveCode }</a></td>
								<td>${vo.receiveDate}</td>
								<td>${vo.warehousename}</td>
								<td>${vo.sortation}</td>
								<td>g</td>
								<td>${vo.material}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delProdBtn" value="선택 삭제">
				<button type="button"
					class="bttn-jelly bttn-md bttn-warning receiveDetail"
					data-toggle="modal" style="margin-left: 20px"
					data-target="#detailLayer">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
<div class="dialog" onkeydown="return captureReturnKey(event)">
	<span class="dialog__close">&#x2715;</span> <label for="inputName">입고
		상세</label>
	<div class="modal-body">
		<form action="/orders/deleteOrder" method="post" id="dialogFrm">
			<div>
				<table class="table table-hover">
					<tr>
						<th>입고일(*)</th>
						<td><input class="form-control bootTapText dueDatePicker"
							name="receiveDate" type='text' /></td>
						<th>발주번호</th>
						<td><input class="form-control bootTapText" name="orderCode"
							type='text' readonly/>
							<button type="button" class="btn btn-default searchModal"
								value="0">
								<i class="fa fa-search"></i>
							</button></td>
					</tr>
					<tr>
						<th>물자대</th>
						<td><input class="form-control bootTapText" name="material"
							type='text' readonly />
						<th>창고명(*)</th>
						<td><input type="hidden" name="warehouseCode" /> <input
							class="form-control bootTapText" name="warehousename" type='text'
							readonly />
							<button type="button" class="btn btn-default searchModal"
								value="2">
								<i class="fa fa-search"></i>
						</button></td>
					</tr>
				</table>
			</div>
			<div>
				<button type="button" class="btn btn-default" id="addProduct">상품
					주문</button>
			</div>
			<div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="modalCheckAll" /></th>
							<th>번호</th>
							<th>상품명</th>
							<th>규격</th>
							<th>수량</th>
							<th>단가</th>
							<th>공급가액</th>
						</tr>
					</thead>
					<tbody id="dialogReceiveTbody">
					</tbody>
				</table>
			</div>
			<div>
				<button type="button" class="btn btn-default" id="delProductByCheck">선택
					삭제</button>
				<div style='float: right;'>
					<label>공급가액</label> <input class="form-control bootTapText"
						name="orderPrice" type='text' readonly /> <label>부가세</label> <input
						class="form-control bootTapText" name="surtax" type='text'
						readonly /> <label>합계</label> <input
						class="form-control bootTapText" type='text' name="totalPrice"
						readonly />
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

<div class="modal" id="myModal4" data-backdrop="static" tabindex="3"
	aria-hidden="true" style="display: none; z-index: 1080;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="secondModalTitle"></h4>
				<button id="secondAddClose1" type="button" class="close"
					data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<div class="container"></div>
			<div class="modal-body">
				<section>
					<h3>상품 등록</h3>
					<input type="text" class="search-query form-control"
						id="searchProductText" placeholder="Search.." />
					<button type="button" class="btn btn-default" id="searchProductBtn">
						<i class="fa fa-search"></i>
					</button>
				</section>
				<div style="overflow: scroll; width: 450px; height: 200px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>항목코드</th>
								<th>항목명</th>
								<th>규격</th>
								<th>기본 금액</th>
							</tr>
						</thead>
						<tbody id="secondModalTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" data-dismiss="modal" class="btn" id="secondAddClose">Close</a>
			</div>
		</div>
	</div>
</div>

<script>
//ENTER 안먹게 하는것
	function captureReturnKey(e) {
	    if(e.keyCode==13 && e.srcElement.type != 'textarea')
	    return false;
	}
	$("#searchBtn").on("click", function() {
		if ($("#searchPay").val() != "") {
			$("#searchFrm").submit();
		} else
			alert("문자를 입력하세요!")
	})
	$(document).ready(function() {
		dialog();
		$("#dialog_insBtn,#dialog_updBtn").click(function(){
			var check = true;
			$("#dialogFrm").attr('action','/product/insOrUpdProduct');
			$('.needs').each(function(){
				if($(this).val()==''){
					alert("필수항목을 입력하세요.");
					check=false;
					return false;
				}
			});
			if(check){
				$("#dialogFrm").submit();
			}
		});
		$("#dialog_delBtn").click(function(){$("#dialogFrm").attr('action','/product/deleteProduct');});
	});
	
function dialog() {
		$('#modalImg').attr('src','');
	
		var dialogBox = $('.dialog'), 
		receiveDetail = $('.receiveDetail'), 
		dialogChild = $('.dialog *'), 
		dialogClose = $('.dialog__close');

		// Open the dialog
		receiveDetail.on('click', function(e) {
			dialogBox.toggleClass('dialog--active');
			$("#dialogReceiveTbody").html(' ');
			if($(this).text()!='신규등록'){
				$(".modalIns").hide();
				$('.modalUpd').show();
				$.ajax({
					method : "post",
					url : "/wareHouse/findReceive",
					data : "receiveCode=" + $(this).parents(".receiveTr").data("rccd"),
					success : function(data) {
						inputData(data);
					}
				});
			}
			else{
				$('input[type=text]').val('');
				$(".modalIns").show();
				$('.modalUpd').hide();
			}
			e.stopPropagation()
		});

		// Close the dialog - click close button
		dialogClose.on('click', function() {
			dialogBox.removeClass('dialog--active');
		});

		// Close the dialog - press escape key // key#27
		$(document).keyup(function(e) {
			if (e.keyCode === 27) {
				dialogBox.removeClass('dialog--active');
			}
		});
		numChange();
	};
	
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
	$("#delRecBtn").on(
			"click",
			function() {
				if($("input[class=check]:checked").length==0){
					alert("선택 하지 않으셨습니다.");
					return false;
				}
				
				$("input[class=check]:checked").each(
						function() {
							$(this).siblings(".valReceive").attr("value",
									$(this).parents('.receiveTr').data('rccd'));
							$(this).siblings('.valReceive').attr("name",
									"receiveCode");
						});
				$("#deleteFrm").submit();
	});
	function inputData(data){
		$("input[name=receiveDate]").val(data.receiveVo.receiveDate);
		$("input[name=orderCode]").val(data.receiveVo.orderCode);
		$("input[name=material]").val(data.receiveVo.material);
		$("input[name=warehousename]").val(data.receiveVo.warehousename);
		
		for (var i = 0; i < data.receiveDetailList.length; i++) {
			var temp =data.receiveDetailList[i];
			$("#dialogReceiveTbody").append("<tr>"
			+"<td><input type=\'checkbox\' class=\'detailCheck\'></td>"
			+"<td>"+temp.productCode+"</td>"
			+"<td>"+temp.productname+"</td>"
			+"<td>"+temp.standard+"</td>"
			+"<td><input type=\'text\' name=\'quantity\' value=\'"+temp.quantity
			+"\' class=\'form-control bootTapText quanText\'/></td>"
			+"<td>"+temp.baseprice+"</td>"
			+"<td>"+temp.baseprice*temp.quantity+"</td>"
				+"</tr>");
		}
		numChange();
	}
	function datepicker(){
		$(".dueDatePicker").datepicker({
			dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
		});
		$('.dueDatePicker').datepicker('setDate', 'today');	
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
	};
	
	$("#addProduct").click(function(){
		$("#myModal4").modal('show');
	});
	
	$("#searchProductBtn, #addProduct").click(function(){
		$.ajax({
			method : "post",
			url : "/orders/searchProduct",
			data : {
				productName : $("#searchProductText").val()
			},
			success : function(data) {
				$("#secondModalTbody").html('');
				for (var i = 0; i < data.productList.length; i++) {
					$("#secondModalTbody").append("<tr class=\'productTr\'>"
					+"<td>"+data.productList[i].productCode+"</td>"
					+"<td>"+data.productList[i].productName+"</td>"
					+"<td>"+data.productList[i].standard+"</td>"
					+"<td>"+data.productList[i].basePrice+"</td>"
					+"<tr>");
				}
				productTrInput();
			}
		});
	});
	
	function productTrInput(){
		$(".productTr").off('click');
		$(".productTr").on('click',function(index,item){
			var item=$(this);
			var check=true;
			$(".dialogPdcd").each(function(){
				if($(this).html()==$(item).children('td').eq(0).html()){
					alert('이미 존재하는 상품입니다.');
					check=false;
				}
			});
			if(check){
				
			}
			numChange();
			$("#myModal4").modal('hide');
		});
	}
</script>
