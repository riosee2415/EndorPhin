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
		<h3><i class="fa fa-calculator"></i>상품 등록</h3>
		<form action="/product/searchProd" id="searchFrm">
			<input type="hidden" name="deprostatus" value="2" />
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
		<form action="/delDeproduct" id="deleteFrm">
			<input type="hidden" name="deprostatus" value="2" />
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>규격</th>
							<th>개요</th>
							<th>사용구분</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allProductList}" var="vo">
							<tr class="productTr" data-pdcd="${vo.productCode }">
								<td><input type="checkbox" class="check" /><input
									type="hidden" class="valProd"></td>
								<td><a href="#detailLayer"
									class="bttn-stretch bttn-md bttn-warning productDetail">${vo.productCode }</a></td>
								<td>${vo.productName}</td>
								<td>${vo.standard}</td>
								<td>${vo.outLine}</td>
								<td>${vo.usestatus}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delPayBtn" value="선택 삭제">
				<button type="button" class="bttn-jelly bttn-md bttn-warning"
					data-toggle="modal" style="margin-left: 20px"
					data-target="#my80sizeModal">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->

<form action="/delDeproduct" id="dialogFrm">
	<div class="dialog">
		 <span class="dialog__close">&#x2715;</span> <label for="inputName">상품 정보</label>
		<input type="hidden" name="deductCode" id="dialog_productCode" /> 
		<label for="inputName" class="dialog_ProductCode"></label><br /> 
		<label for="InputEmail">상품명</label> 
		<input type="text" id="dialog_ProductName" name="productName" class="form-control"
			placeholder="공제명을 입력해주세요"><br /> 
		<label for="inputPassword">규격명</label><br />
		<input type="text" class="form-control" name="standard"
			id="dialog_standard" /> 
		<label for="inputPassword">기본 가격</label><br />
		<input type="text" class="form-control" name="basePrice"
			id="dialog_basePrice" /> 
		<label for="inputPassword">사용여부</label>
		<select name="useStatus" class="form-control" id="dialog_useStatus">
			<option value="1">예</option>
			<option value="2">아니오</option>
		</select>
		<button id="updDeduct" class="btn btn-default dialog__action">수정</button>
		<button id="dialog_delBtn" class="btn btn-default dialog__action">삭제</button>
	</div>
</form>

<script>
	$(document).ready(function() {
		dialog();
	});
	
function dialog() {
		
		var dialogBox = $('.dialog'), 
		productDetail = $('.productDetail'), 
		dialogClose = $('.dialog__close'), 
		dialog_productCode = $('.productCode'), 
		dialog_productName = $('#dialog_ProductName'), 
		dialog_basePrice = $('#dialog_basePrice'), 
		dialog_standard = $('#dialog_standard'), 
		dialogSearchBtn = $('#dialogSearchBtn'), 
		dialog_useStatus = $('#dialog_useStatus');

		// Open the dialog
		productDetail.on('click', function(e) {
			dialogBox.toggleClass('dialog--active');

			$.ajax({
				method : "post",
				url : "/product/findProductCode",
				data : "productCode=" + $(this).parents(".productTr").data("pdcd"),
				success : function(data) {
// 					basePrice: "500"
// 						outLine: null
					$("#dialog_productCode").val(data.productCode);
					$(".dialog_productCode").html(data.deductCode);
					$("#dialog_ProductName").val(data.productName);
					$("#dialog_basePrice").val(data.basePrice);
					$("#dialog_standard").val(data.standard);
					$("#dialog_useStatus").val(data.usestatus);
				}
			});
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

		// Close dialog - click outside
		$(document).on(
				"click",
				function(e) {
					if ($(e.target).is(dialogBox) === false
							&& $(e.target).is(dialog_productCode) === false
							&& $(e.target).is(dialog_ProductName) === false
							&& $(e.target).is(dialog_basePrice) === false
							&& $(e.target).is(dialog_standard) === false
							&& $(e.target).is(dialog_useStatus) === false) {
						dialogBox.removeClass("dialog--active");
					}
				});

	};
</script>
