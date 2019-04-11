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
		<h3><i class="fa fa-calculator"></i>발주 현황</h3>
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
				</table>
			</div>

			<div class="btn_btm">
				<input class="bttn-jelly bttn-md bttn-warning" type="button"
					id="delProdBtn" value="선택 삭제">
				<button type="button" class="bttn-jelly bttn-md bttn-warning productDetail"
					data-toggle="modal" style="margin-left: 20px"
					data-target="#detailLayer">신규등록</button>
			</div>
		</form>
	</div>
</div>

<!-- 상세조회 모달창 -->
<form action="/product/deleteProduct" id="dialogFrm" method="post" enctype="multipart/form-data">
	<div class="dialog">
		 <span class="dialog__close">&#x2715;</span> <label for="inputName">상품 정보</label>
		 <input type="hidden" name="productCode" id="dialog_productCode"/>
			<table id="dialogTable">
				<tr>
					<td>
						<label for="InputEmail">상품명(*)</label>
						<input type="text" id="dialog_ProductName" name="productName" class="form-control needs"
							placeholder="공제명을 입력해주세요">
					</td>
					<td>
						<label for="inputPassword">규격명(*)</label>
						<input type="text" class="form-control needs" name="standard"
							id="dialog_standard" /> 
					</td>
					<td><label for="inputPassword">기본 가격(*)</label>
						<input type="text" class="form-control needs" name="basePrice"
							id="dialog_basePrice" /> </td>
					<td rowspan="2">
						<input id="modalFileInput" type="file" class="form-control" name="fileName">
						<img src="" style="width:200px; height: 180px;" id="modalImg">
					</td>
				</tr>
				<tr>
					<td><span><label for="inputPassword">개요</label><br/>
						<input type="text" class="form-control" name="outLine"
							id="dialog_outLine" /></span>
					</td>
					<td><label for="inputPassword">사용여부</label>
						<select name="usestatus" class="form-control" id="dialog_useStatus">
							<option value="1">예</option>
							<option value="2">아니오</option>
						</select>
					</td>
				</tr>
			</table>
		
		<input type="button" id="dialog_updBtn" class="btn btn-default modalUpd" value="수정" />
		<button id="dialog_delBtn" class="btn btn-default dialog__action modalUpd">삭제</button>
		<input type="button" id="dialog_insBtn" class="btn btn-default modalIns" value="등록" />
	</div>
</form>

