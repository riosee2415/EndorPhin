<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h2>전표 관리</h2>
<hr>

<div style="text-align: right;">
	<input type="button" class="btn btn-primary" id="insertSlipBtn"
		name="insertSlipBtn" value="전표작성" />
</div>

<div id="insertArea"></div>



<div class="table-responsive">
	<table class="table table-striped">
		<thead class="thead">
			<tr>
				<td><input type="checkbox" name="allCheck" id="th_allCheck"
					onclick="allCheck();"></td>
				<th>전표번호</th>
				<th>분개금액</th>
				<th>작성일</th>
				<th>사용부서</th>
				<th>메모</th>
				<th>승인여부</th>
			</tr>
		</thead>
		<tbody id="establishListTbody">
		</tbody>
	</table>

	<c:set var="lastPage"
		value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

	<nav style="text-align: center;">
		<ul id="pagination" class="pagination">
		</ul>
	</nav>
</div>




<!-- 상세보기 모달 -->
<!-- Search Establish Modal Window  -->
<div class="modal modal-center fade" id="detailSlipView" tabindex="4"
	role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">전표상세</h4>
			</div>

			<div class="modal-body">
				<div class="form-group">
					<label>전표번호</label> <input style="width: 50px;" type="text"
						id="modal_detail_slipNumber" readonly />
				</div>

				<div class="form-group">
					<label for="InputEmail">분개내역&nbsp;&nbsp;&nbsp;</label>
					<table>
						<thead>
							<tr>
								<td>상세번호</td>
								<td>계정과목</td>
								<td>거래처</td>
								<td>차변</td>
								<td>대변</td>
							</tr>
						</thead>
						<tbody id="detailBody">

						</tbody>
					</table>
				</div>


			</div>

			<div class="modal-footer"></div>

		</div>
	</div>
</div>







<script>
	$("document").ready(function() {
		getSlipPageList(1);
	});

	function getSlipPageList(page) {
		$.ajax({
			url : "${pageContext.request.contextPath }/getSlipPageList",
			data : "page=" + page,
			success : function(data) {

				var htmlArr = data
						.split("================seperator================");

				$("#establishListTbody").html(htmlArr[0]);
				$("#pagination").html(htmlArr[1]);

			}
		});
	}

	var insertFlag = 0;
	$("#insertSlipBtn").on("click", function() {

		$("#insertSlipBtn").attr("disabled", true);

		if (insertFlag === 0) {
			$.ajax({
				url : "${pageContext.request.contextPath }/getSlipInsertBtn",
				success : function(data) {
					$("#insertArea").html(data);
				}

			});

			insertFlag = 1;
		} else if (insertFlag === 1) {
			$("#insertArea").html("");

			insertFlag = 0;

		}
	});
</script>