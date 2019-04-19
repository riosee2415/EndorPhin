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
						<td><label for="date">작성일&nbsp;
								<span class="asteriskField">*</span></label></td>
						<td><div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input class="form-control" id="date" name="date"placeholder="YYYY/MM/DD" type="text" style="width: 200px" />&nbsp;&nbsp;~&nbsp;&nbsp;
						</div></td>
						<td><div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								&nbsp;<input class="form-control" id="date2" name="date2"placeholder="YYYY/MM/DD" type="text" style="width: 200px" />
							</div></td>
					</tr>
					<tr>
						<td><br>
						<label>문서종류&nbsp;&nbsp;</label></td>
						<td><select class="form-control " id="documentType"
							name="documentType">
								<option value="품의서" selected="selected">품의서</option>
								<option value="기안서">기안서</option>
								<option value="발주서">발주서</option>
						</select></td>
						<td><label>&nbsp;&nbsp;&nbsp;&nbsp;제목</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="form-control-sm"type="text" style="width: 280px" /> &nbsp;&nbsp;</td>
						<td><button id="searchBtn" name="searchBtn"class="btn btn-secondary" style="color: #ffffff;">검색</button></td>
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
							<td><fmt:formatDate value="${vo.acquisitionDate }" pattern="yyyy-MM-dd" /></td>
							<td>${vo.acquisitionPrice }</td>
							<td>${vo.depreciation }</td>
							<td>${vo.accumulated }</td>
							<td>${vo.residualvalue }</td>
							<td>${vo.serviceLife }</td>

							<!-- 데이트타입 스트링으로 변경 -->
							<c:set var="dates">
								<fmt:formatDate value="${vo.acquisitionDate }" pattern="yyyy/MM/dd" />
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
				<option value="발주서">발주서</option>
			</select>
			<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#my80sizeModal3">문서작성</button>
		</div>
	</div>
</div>

 <!-- 문서작성-->
<div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		 <div class="modal-content"> 
 			<div class="modal-header"  style="background:#6C757D;"  >
 			<table>
 				<tr>
				<td><h5  style="color: #ffffff;" >|품위서작성</h5>
 				</tr>
		</table>
		</div>
		<div class="modal-body">
				<div class="modal-body">
				<table>
					<tr>
						<td><label>문서번호&nbsp;&nbsp;&nbsp;</label></td> 
						<td><input type="text" id="documentNumber" name="documentNumber" class="form-control-sm " style="background: #F4EBE7;"style="width: 250px"> </td>
						<td><label>보존년한&nbsp;&nbsp;</label> </td>
						<td><select class="form-control-sm " id="preservation" name="preservation"style="width: 100px;">
							<option value="5년" selected="selected">5년</option>
							<option value="4년">4년</option>
							<option value="3년">3년</option>
							<option value="2년">2년</option>
							<option value="1년">1년</option>
						</select></td>
					</tr>
					<tr>
						<td><label>기안부서&nbsp;&nbsp;</label> </td>
						<td ><input type="text" id="presentDepartment"class="form-control-sm" readonly value="${deptName}" ></td>
						<td><label>기안자&nbsp;&nbsp;
							<span class="asteriskField">*</span></label></td>
						<td><input type="text" id="presentUser" class="form-control-sm" readonly style="width: 200px" value="${userName}" /></td>
					</tr>
					<tr> 
						<td colspan="1"><label for="presentDate">기안일자&nbsp;
								<span class="asteriskField">*</span></label></td>
						<td><div class="input-group">
								<input class="form-control-sm" id="presentDate" name="presentDate"placeholder="YYYY/MM/DD" type="text" style="width: 180px" />&nbsp;
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div></div></td>
					</tr>
					<tr>
						<td><label>제목&nbsp;&nbsp;
							<span class="asteriskField">*</span></label></td>  
						<td  colspan="4"><input type="text" id="title" style="width: 480px" class="form-control-sm"></td>
					</tr>
				</table>
				<br>
					<textarea  name="contents" id="contents" rows="10" cols="150" style="width: 730px; height: 300px;"></textarea>
						<table>
							<tr>
								<th scope="row">첨부파일1</th>
								<td><input name="filename" type="file" multiple /></td>
							</tr>
							<tr>
								<th scope="row">첨부파일2</th>
								<td><input name="filename" type="file" multiple /></td>
							</tr>
						</table>
					</div>
				</div>
						
			<div class="modal-footer">
				<button type="button" id="signBtn1" class="btn btn-outline-secondary" data-toggle="modal"  data-target="#my80sizeModal4">결재선 지정</button>
				<button type="button" id="referenceBtn" class="btn btn-outline-secondary">참조선 지정</button>
				<button type="button" id="signBtn"  class="btn btn-secondary" id="signBtn" name="signBtn">결제상신</button>
				<button type="button" class="btn btn-secondary" id="temporarilyBtn" data-toggle="modal" data-target="#my80sizeModal2">임시저장</button>
				<button type="button" class="btn btn-secondary" id="showBtn" data-toggle="modal" data-target="#my80sizeModal2">미리보기</button>
			</div>
  		</div> 
	</div>
</div>


<div class="modal fade" id="my80sizeModal4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		 <div class="modal-content"> 
				<div class="container-fluid">
					<div class="row">
						<div class="modal-header">
				<h3 class="page-header" >|결재선 지정</h3>
		</div>
			<div class="col-sm-15 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<table>
					<tr>
						<td><label>부서명</label></td>
						<td><input class="form-control" name="deptName" id="deptName" style="width: 200px; height: 25px;" /></td>
						<td><button type="button" class="btn btn-outline-secondary btn-sm" id="dept_searchBtn">검색</button></td>
						<td><label>사원명</label></td>
						<td><input class="form-control" name="usernm" id="usernm" style="width: 200px; height: 25px;" /></td>
						<td><button type="button" class="btn btn-outline-secondary btn-sm" id="user_searchBtn">검색</button></td>
					</tr>
				</table>
				<table class="table table-sm">
					<thead class="thead">
					<tr>
						<th>부서</th>
						<th>직금</th>
						<th>직원코드</th>
						<th>직원명</th>
					</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				<table class="table table-sm">
					<thead class="thead">
					<tr>
						<th>부서</th>
						<th>직금</th>
						<th>직원코드</th>
						<th>직원명</th>
					</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sm" id="insertBtn" data-toggle="modal">저장</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
				</div>
			 </div>
		  </div>
		</div> 
	</div>		
 </div>
</div> 


<script>

$("#signBtn").on("click", function(){
	alert("ddd");
	$.ajax({
		url : "${pageContext.request.contextPath }/insertDocument",
		data : "documentNumber="+ $("#documentNumber").val()+ "&" + 
				"presentUser="+ $("#presentUser").val() + "&"
				+ "presentDate="+ $("#presentDate").val() + "&"
				+ "title="+ $("#title").val() + "&"
				+ "presentDepartment="+ $("#presentDepartment").val() + "&"
				+ "preservation="+$("#preservation").val() + "&"
				+ "contents="+ $("#contents").val(),
				
		success : function(data) {
			alert("기안작성이 완료되었습니다.");
			location.reload();
			return false;
		}
	});
});

var oEditors = []; 

$(document).ready(function() {
	// Editor Setting
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors, // 전역변수 명과 동일해야 함.
		elPlaceHolder : "contents", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
		sSkinURI : "/SE2/SmartEditor2Skin.html", // Editor HTML
		fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true, 
		},
	 	fOnAppLoad: function () {    
	      $("iframe").css("width", "100%").css("height", "399px");
	    }
	});
});

	// 필수값 Check
	function validation(){
		var contents = $.trim(oEditors[0].getContents());
		if(contents === '<p>&nbsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 <p>&nbsp;</p> 값이 입력되어 있음. 
			alert("내용을 입력하세요.");
			oEditors.getById['smarteditor'].exec('FOCUS');
			return false;
		}

		return true;
	}
	

	
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			dateFormat: 'yy/mm/dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
			
		});
		var date_input=$('input[name="date2"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			dateFormat: 'yy/mm/dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
		});
		
		var date_input=$('input[name="presentDate"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			dateFormat: 'yy/mm/dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
		});
	});

</script>
