<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2>
			<i class="fa fa-calculator"></i>기안문서함
		</h2>
		<div class="bootstrap-iso">
			<div class="container-fluid">
				<table>
					<tr>
						<td><br>
						<br></td>
					</tr>
					<tr>
						<td><label for="date">작성일&nbsp;<span
								class="asteriskField">*</span></label></td>
						<td><div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input class="form-control" id="date" name="date"
									placeholder="MM/DD/YYYY" type="text" style="width: 200px" />&nbsp;&nbsp;~
								&nbsp;&nbsp;
							</div></td>
						<td><div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								&nbsp;<input class="form-control" id="date" name="date"
									placeholder="MM/DD/YYYY" type="text" style="width: 200px" />
							</div></td>
					</tr>
					<tr>
						<td><br>
						<label>문서종류&nbsp;&nbsp;</label></td>
						<td><select class="form-control " id="documentType"
							name="documentType">
								<option value="품의서" selected="selected">품의서</option>
								<option value="기안서">기안서</option>
								<option value="업무협조전">업무협조전</option>
								<option value="보고서">보고서</option>
								<option value="구매품의서">구매품의서</option>
								<option value="지출품의서">지출품의서</option>
								<option value="인사품의서">인사품의서</option>
								<option value="출장품의서">출장품의서</option>
						</select></td>
						<td><label>&nbsp;&nbsp;&nbsp;&nbsp;제목</label>
							&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control-sm"
							type="text" style="width: 280px" /> &nbsp;&nbsp;</td>
						<td><button id="searchBtn" name="searchBtn"
								class="btn btn-secondary" style="color: #ffffff;">검섹</button></td>
					</tr>
					<tr>
						<td><br>
						<br></td>
					</tr>
				</table>
			</div>

			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<td>문서번호</td>
						<td>문서종류</td>
						<td>신청일</td>
						<td>작성자</td>
						<td>제목</td>
						<td>첨부</td>
					</tr>
				</thead>
				<tbody id="assetTbody">

					<c:forEach items="${depreciationList }" var="vo">
						<tr>
							<td>${vo.assetName }</td>
							<td>${vo.assetCode }</td>
							<td><fmt:formatDate value="${vo.acquisitionDate  }"
									pattern="yyyy-MM-dd" /></td>
							<td>${vo.acquisitionPrice }</td>
							<td>${vo.depreciation }</td>
							<td>${vo.accumulated }</td>
							<td>${vo.residualvalue }</td>
							<td>${vo.serviceLife }</td>

							<!-- 데이트타입 스트링으로 변경 -->
							<c:set var="dates">
								<fmt:formatDate value="${vo.acquisitionDate  }"
									pattern="yyyy/MM/dd" />
							</c:set>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
		<div class="modal-footer">
			<select class="form-control " id="documentType" name="documentType"style="width: 150px;">
				<option value="품의서" selected="selected">품의서</option>
				<option value="기안서">기안서</option>
				<option value="업무협조전">업무협조전</option>
				<option value="보고서">보고서</option>
				<option value="구매품의서">구매품의서</option>
				<option value="지출품의서">지출품의서</option>
			</select>
			<button type="button" class="btn btn-secondary" id="documentInsert" >문서작성</button>
		</div>
		<button type="button" class="btn btn-secondary" id="setting" data-toggle="modal" data-target="#my80sizeModal">기안양식 설정</button>
			
	</div>
</div>
 		
 	<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
 		 <div class="modal-content"> 
  			<div class="modal-header" >
  			<table>
  				<tr>
					<td><label >| 기안서 양식 등록</label>
  				</tr>
			</table>
			</div>
			<div class="modal-body">
				<table class="table table-striped-sm">
					<thead class="thead">
						<tr>
							<th>양식코드</th>
							<th>양식명</th>
						</tr>
					</thead>
					<tbody>
						<tr></tr>
						<tr></tr>
					</tbody>					
				</table>
				</div>	
				<div class="modal-footer">
					<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">신규등록</button>
					<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">선택삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
   		</div> 
	</div>
</div>

<script>
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'mm/dd/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})
</script>
