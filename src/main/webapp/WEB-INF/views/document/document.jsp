<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link href="css/document.css" rel="stylesheet" type="text/css">
<br>
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
						<td><br><br></td></tr>
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
						<td><br><label>문서종류&nbsp;&nbsp;</label></td>
						<td><select class="form-control " id="documentType" name="documentType">
								<option value="품의서" selected="selected">품의서</option>
								<option value="기안서">기안서</option>
								<option value="발주서">발주서</option>
						</select></td>
						<td><label>&nbsp;&nbsp;&nbsp;&nbsp;제목</label>
							<input class="form-control-sm"type="text" style="width: 280px" /> &nbsp;&nbsp;</td>
						<td><button id="searchBtn" name="searchBtn"class="btn btn-secondary" style="color: #ffffff;">검색</button></td>
					</tr>
					<tr>
						<td><br><br></td>
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
					</tr>
				</thead>
				<tbody id="assetTbody">

					<c:forEach items="${documentList }" var="vo">
						<tr>
							 <c:set var="dates" >
								<fmt:formatDate value="${vo.presentDate  }" pattern="yyyy/MM/dd" />
							</c:set>							
							<td><a class="bttn-stretch bttn-warning detailView" href="#documentDetail" 
																				 data-documentnumber="${vo.documentNumber }" 
																				 data-title="${vo.title }" 
																				 data-preservation="${vo.preservation }" 
																				 data-presentdate="${dates }" 
																				 data-contents="${vo.contents }" 
																				 data-tempsortation="${vo.tempSortation }" 
																				 data-completesortation="${vo.completeSortation }" 
																				 data-presentuser="${vo.presentUser }" 
																				 data-presentdepartment="${vo.presentDepartment }" 
																				 data-documenttype="${vo.documentType }"
																				 data-toggle="modal">${vo.documentNumber }</a></td>
							
							<td>${vo.documentType }</td>
							<td><fmt:formatDate value="${vo.presentDate }" pattern="yyyy-MM-dd" /></td>
							<td>${vo.presentUser }</td>
							<td>${vo.title }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="modal-footer">
			<select class="form-control-lg " id="documentType" name="documentType"style="width: 150px;">
				<option value="품의서" selected="selected">품의서</option>
				<option value="기안서">기안서</option>
				<option value="발주서">발주서</option>
			</select>
			<button type="button" class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#my80sizeModal3">문서작성</button>
		</div>
	</div>
</div>
<!--------------------상세보기 ------------------>
<div class="modal fade" id="documentDetail" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header"  style="background:#6C757D;" >
			<table>
				<tr><td><div id="de_documentType" style="color: #ffffff;" ></div></td></tr>
			</table>
			</div>
			<div class="doc_contents">
				<div class='doc_paper'>
					<table>
						<tr>
							<td class='board_blank'><div style='width: 64px'></div></td>
							<td class='board_blank'><div style='width: 134px'></div></td>
							<td class='board_blank'><div style='width: 317px'></div></td>
							<td class='board_blank'><div style='width: 64px'></div></td>
							<td class='board_blank'><div style='width: 134px'></div></td>
						</tr>
						<tr>
							<th rowspan='2' colspan='3' class='paper_title'><div id="de_documentType2"></div></th>
							<th>문서번호</th>
							<td><div id="de_documentNumber"></div></td>
						</tr>
						<tr>
							<th>보존연한</th>
							<td><div id="de_preservation"></div></td>
						<tr>
							<th>기안부서</th>
							<td><div id="de_presentDepartment"></div></td>
							<td rowspan='2' colspan='3' class='paper_table'>
								<table style='width: 100%;'>
									<tr>
										<th rowspan='3' style='width: 5%'>기<br />안<br />부<br />서
										</th>
										<th>결재</th>
										<th>결재</th>
										<th>결재</th>
										<th>결재</th>
										<th>결재</th>
									</tr>
									<tr>
										<td style='height: 50px;'>완료 <br />2019-04-18
										</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>부장 곽동훈</td>
										<td></td>
										<td></td>
										<td>과장 써니</td>
										<td>차장 홍필호</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>기안자</th>
							<td><div id="de_presentUser"></div></td>
						<tr>
							<th>기안일자</th>
							<td><div id="de_presentDate"></div></td>
							<td rowspan='2' colspan='3' class='paper_table'>
								<table style='width: 100%;'>
									<tr>
										<th rowspan='3' style='width: 5%'>협<br />조<br />부<br />서
										</th>
										<th>결재</th>
										<th>결재</th>
										<th>결재</th>
										<th>결재</th>
										<th>결재</th>
									</tr>
									<tr>
										<td style='height: 50px;'></td>
										<td>ㅈㅈㄷㄱ</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th>협조부서</th>
							<td></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan='4'><div id="de_title"></div></td>
						</tr>
						<tr>
							<td colspan='5' class='board_contents'>
								<div class='board_contents_txt'>
									<p>
									</p>
								</div>
								<div id="de_contents"></div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	</div>
<!-- --------------------문서작성-------------------------------------->
<div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		 <div class="modal-content"> 
 			<div class="modal-header"  style="background:#6C757D;"  >
 			<table>
				<tr><td><h5  style="color: #ffffff;" >|품의서작성</h5></tr>
			</table>
		</div>
		<div class="modal-body">
				<div class="modal-body">
				<table>
					<tr>
						<td><label>문서번호</label></td> 
						<td><input type="text" id="documentNumber" name="documentNumber" class="form-control" style="background: #F4EBE7;"style="width: 130px"> </td>
						<td><label>&nbsp;&nbsp;보존년한&nbsp;&nbsp;</label> </td>
						<td><select class="form-control " id="preservation" name="preservation"style="width: 100px;">
							<option value="5년" selected="selected">5년</option>
							<option value="4년">4년</option>
							<option value="3년">3년</option>
							<option value="2년">2년</option>
							<option value="1년">1년</option>
						</select></td>
					</tr>
					<tr>
						<td><label>기안부서</label> </td>
						<td ><input type="text" id="presentDepartment"class="form-control" readonly value="${deptName}" ></td>
						<td><label>&nbsp;&nbsp;기안자
							<span class="asteriskField">*</span></label></td>
						<td><input type="text" id="presentUser" class="form-control" readonly style="width: 200px" value="${userName}" /></td>
					</tr>
					<tr> 
						<td colspan="1"><label for="presentDate">기안일자&nbsp;
								<span class="asteriskField">*</span></label></td>
						<td><div class="input-group">
								<input class="form-control-sm" id="presentDate" name="presentDate" placeholder="YYYY/MM/DD" type="text" style="width: 180px" />&nbsp;
									<i class="fa fa-calendar"></i>
							</div></td>
					</tr>
					<tr>
						<td><label>제목&nbsp;&nbsp;
							<span class="asteriskField">*</span></label></td>  
						<td  colspan="4"><input type="text" id="title" style="width: 480px" class="form-control"></td>
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
				<button type="button" id="signBtn1" class="btn btn-outline-secondary btn-lg" data-toggle="modal"  data-target="#my80sizeModal4">결재선 지정</button>
				<button type="button" id="referenceBtn" class="btn btn-outline-secondary btn-lg">참조선 지정</button>
				<button type="button" id="signBtn"  class="btn btn-secondary btn-lg" id="signBtn" name="signBtn">결제상신</button>
				<button type="button" class="btn btn-secondary btn-lg" id="temporarilyBtn" data-toggle="modal" data-target="#my80sizeModal2">임시저장</button>
			</div>
  		</div> 
	</div>
</div>

<!----------------------------결재선 지정 모달창  -->
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
						<th>직급</th>
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
						<th>직급</th>
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

$(".detailView").on("click", function(){
	$("#de_presentDepartment").html($(this).data("presentdepartment"));
	$("#de_presentUser").html($(this).data("presentuser"));
	$("#de_presentDate").html($(this).data("presentdate"));
	$("#de_documentType").html($(this).data("documenttype"));
	$("#de_documentNumber").html($(this).data("documentnumber"));
	$("#de_preservation").html($(this).data("preservation"));
	$("#de_title").html($(this).data("title"));
	$("#de_contents").html($(this).data("contents"));
	$("#de_documentType2").html($(this).data("documenttype"));
});
$("#signBtn").on("click", function(){
	$.ajax({
		url : "${pageContext.request.contextPath }/insertDocument",
		data : "documentNumber="+ $("#documentNumber").val()+ "&" + 
				"presentUser="+ $("#presentUser").val() + "&"
				+ "presentDate="+ $("#presentDate").val() + "&"
				+ "title="+ $("#title").val() + "&"
				+ "presentDepartment="+ $("#presentDepartment").val() + "&"
				+ "preservation="+$("#preservation").val() + "&"
				+ "documentType="+$("#documentType").val() + "&"
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*달력 3개입력받을 거 있음  */
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
