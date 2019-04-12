<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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