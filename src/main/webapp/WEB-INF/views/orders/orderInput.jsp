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
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" /></th>
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
								<td><input type="checkbox" class="check"/></td>
								<td><a  
									class="bttn-stretch bttn-md bttn-warning">${vo.orderCode}</a></td>
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
			</div>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delProdBtn" value="선택 삭제">
				<button type="button" class="bttn-jelly bttn-md bttn-warning orderDialog"
					data-toggle="modal" style="margin-left: 20px"
					data-target="#detailLayer">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
<form action="/product/deleteProduct" id="dialogFrm" method="post" enctype="multipart/form-data">
	<div class="dialog">
		 <span class="dialog__close">&#x2715;</span> <label for="inputName">발주서 상세</label>
		 <input type="hidden" name="productCode" id="dialog_productCode"/>
		 <div class="modal-body">
			<div role="tabpanel">
                    <!-- Nav tabs -->
                    <div>
	                    <ul class="nav nav-tabs" role="tablist">
	                        <li role="presentation" class="active"><a href="#uploadTab" aria-controls="uploadTab" role="tab" data-toggle="tab">Upload</a>
	                        </li>
	                        <li role="presentation"><a href="#browseTab" aria-controls="browseTab" role="tab" data-toggle="tab">Browse</a>
	
	                        </li>
	                    </ul>
                    </div>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane" id="uploadTab">
                        	<div>
		                        <table class="table table-hover">
										<tr>
											<th>발주일(*)</th>
											<td><input type='text'/></td>
											<th>발주내역(*)</th>
											<td><input type='text'/></td>
										</tr>
										<tr>
											<th>부서</th>
											<td><input type='text'/></td>
											<th>담당자</th>
											<td><input type='text'/></td>
										</tr>
										<tr>
											<th>담당자</th>
											<td><input type='text'/></td>
											<th>납기일</th>
											<td><input type='text'/></td>
										</tr>
								</table>
							</div>
							<div>
								<button class="btn btn-default">상품 주문</button>
							</div>
                        	<div>
		                        <table class="table table-hover">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkAll" /></th>
												<th>발주번호</th>
												<th>상품명</th>
												<th>규격</th>
												<th>수량</th>
												<th>단가</th>
												<th>공급가액</th>
											</tr>
										</thead>
										<tbody id="dialogProductTbody">
										</tbody>
								</table>
							</div>
							<div>
								<button class="btn btn-default">선택 삭제</button>
								<div style='float: right;'>
									<label>공급가액</label>
									<input type='text'/>
									<label>부가세</label>
									<input type='text'/>
									<label>합계</label>
									<input type='text'/>
								</div>								
							</div>
                       	</div>
                        <div role="tabpanel" class="tab-pane" id="browseTab">
                        	browseTab</div>
                    </div>
                </div>
             </div>
         <div>
			<input type="button" id="dialog_updBtn" class="btn btn-default modalUpd" value="수정" />
			<button id="dialog_delBtn" class="btn btn-default dialog__action modalUpd">삭제</button>
			<input type="button" id="dialog_insBtn" class="btn btn-default modalIns" value="등록" />
		</div>
	</div>
</form>

<script>
	$(".orderDialog").click(function(){
		$(".tab-pane").eq(0).toggleClass("active");
		dialog();
	});
	function dialog(){
		$(".dialog").toggleClass('dialog--active');
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
</script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">