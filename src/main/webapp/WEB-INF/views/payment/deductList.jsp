<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h3>공제항목 등록</h3>
<form action="/addDeduct" id="searchFrm">
	<input type="hidden" name="deprostatus" value="2"/>
	<table>
		<tr>
			<td>공제명 검색 :</td>
			<td><input type="text" class="search-query form-control"
				id="searchPay" name="searchDeductName" placeholder="Search" /></td>
			<td>
				<button class="btn btn-primary" type="button" id="searchBtn">
					<span class=" glyphicon glyphicon-search">검색</span>
				</button>
			</td>
		</tr>
	</table>
</form>
<form action="/delDeproduct" id="deleteFrm">
	<input type="hidden" name="deprostatus" value="2"/>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" /></th>
					<th>공제코드</th>
					<th>항목명</th>
					<th>계정과목명</th>
					<th>사용구분</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allDe_product_div}" var="vo">
					<tr class="payTr" data-decd="${vo.deductCode }">
						<td><input type="checkbox" class="check" /><input
							type="hidden" class="valPay"></td>
						<td><a href="#detailLayer" class="deductDetail">${vo.deductCode }</a></td>
						<td>${vo.deductName}</td>
						<c:if test="${vo.establishcode!=null}">
							<td>${vo.establishName}</td>
						</c:if>
						<c:if test="${vo.useStatus==1}">
							<td>사용</td>
						</c:if>
						<c:if test="${vo.useStatus==2}">
							<td>미사용</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="btn_btm">
		<input class="btn btn-info btn-lg" type="button" id="delPayBtn"
			value="선택 삭제">
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#my80sizeModal">신규등록</button>
	</div>
</form>


<!-- 80% size Modal  등록 모달 창-->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog"
	aria-labelledby="my80sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">공제 등록</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form action="${cp}/addDeproduct" method="post" id="modalAddFrm">
					<input type="hidden" name="deprostatus" value="2"/>
						<label for="inputName">공제코드</label> <input type="text"
							class="form-control" name="deductCode"
							placeholder="공제코드를 입력해 주세요">
						<button type="button" class="btn btn-default"
							id="addModalCheckBtn">중복여부</button>
				</div>
				<div class="form-group">
					<label for="InputEmail">공제명</label> <input type="text"
						class="form-control" name="deductName" placeholder="공제명을 입력해주세요">
				</div>


				<div class="form-group">
					<table>
						<tr>
							<td><label for="inputPassword">걔정과목명</label></td>
							<td>
								<input type="text" class="form-control" name="establishcode" readonly="readonly" id="establishCode"/>
								<input type="button" class="btn btn-info btn-lg" value="검색" id="estBtn"/>
							</td>
						</tr>
					</table>
				</div>


				<div class="form-group">
					<label for="inputPassword">사용여부</label> <select name="useStatus"
						class="form-control">
						<option value="1">예</option>
						<option value="">아니오</option>
					</select>
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalAddBtn" type="button" class="btn btn-default">등록</button>
				</form>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<link href=""/>


<script type="text/javascript" src="/js/deduct.js" >
</script>
