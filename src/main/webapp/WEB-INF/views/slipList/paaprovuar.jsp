<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--테이블 리스트출력  -->
	<h2>미승인 전표 </h2>	
	<br>
	<br>
	전표일자 &nbsp<input name="before_slipDate" id="before_slipDate" type="text" />
	- &nbsp<input name="after_slipDate" id="after_slipDate" type="text"/>
	&nbsp<input type="button" id="serachBtn" value="검색" /><br>
	<br>
<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th>
					<th>전표번호</th>
					<th>전표일자</th>
					<th>적요</th>
					<th>전표금액</th>
					<th>사용부서</th>
				</tr>
			</thead>
			<tbody id="deptListTbody">
			</tbody>
		</table>

		<c:set var="lastPage"
			value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

		<nav style="text-align: center;">
			<ul id="pagination" class="pagination">
			</ul>
		</nav>

	</div>
</div>
<!--------------(삭제,등록) 버튼 ------------------->
	
	<div class="modal-footer">
		<button name="upd_btn"  id="upd_btn" type="button" value="0" onclick="myclick()">승인</button>
	</div>
			
	<!-----------------상세보기  모달창 ---------------->	
	
	<div class="modal fade" id="deptDetail" role="deptDetail" aria-hidden="true"> 
   		<div class="modal-dialog">
   			 <div class="modal-content"> 
	   			<div class="modal-header"> 
	   				<label>| 승인상세보기</label>
	   				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	   				<h4 class="modal-title" id="myModalLabel"></h4>
	   			</div> 
	   			<div class="modal-body"> 
	   				<div class="form-group">
	   					<label for="InputEmail">전표번호</label> 
	   					<input type="text" style="width:200px;" id="slipnumber" name="slipnumber" readonly>
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">전표일자</label> 
	   					<input type="text" style="width: 250px;" name="slipdate" id="slipdate"  > 
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">적요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
	   					<input type="text" style="width:250px;" id="jukyo" name="jukyo" />
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">전표금액</label> 
	   					<input type="text" style="width: 250px;" name="total" id="total"  > 
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">전표유형</label> 
	   					<input type="text" style="width: 250px;" name="departmentname" id="departmentname"  > 
	   				</div>
	   				
	   			<div class="modal-footer">
	   			
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>


	<!---------------승인---------------->

 	<form id="update_frm" action="${pageContext.request.contextPath }/updateSlip">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		

 	<form id="useFrm" action="${pageConext.request.contextPath }/useDept">
		<input type="hidden"  id="frm_usestatus" name="frm_usestatus">
		<input type="hidden"  id="frm_deptCode" name="frm_deptCode" >
	</form>
	
    <!---------------------------------------------->
	<script>
    
	 $("document").ready(function() {
			/* 상세보기  */
			$("#deptListTbody").on("click", ".detailView", function(){
				
				$("#slipnumber").val($(this).data().slipnumber);
				$("#slipdate").val($(this).data().slipdate);
				$("#jukyo").val($(this).data().jukyo);
				$("#total").val($(this).data().total);
				$("#departmentname").val($(this).data().departmentname);
				
			});
	 	});
	 
 
	$("#serachBtn").on("click", function(){
		
   	 	$.ajax({
       		url 	: "${pageContext.request.contextPath }/searchAjax_p",
       		data 	: "before_slipDate=" + $("#before_slipDate").val() +  "&" + "after_slipDate=" + $("#after_slipDate").val(),
       		success : function(data){
       			console.log(data);
       			var htmlArr = data.split("================seperator================");
       			$("#deptListTbody").html("");
       			$("#deptListTbody").html(htmlArr[0]);
       			$("#pagination").html("");
       			$("#pagination").html(htmlArr[1]);
       		
       		}
       	});
	});
 	
	$("document").ready(function(){
 		console.log('최초실행');
 		paaprovuarPageList(1);
 	});
 	function paaprovuarPageList(page){
 		
 		$.ajax({
 			url : "${pageContext.request.contextPath }/paaprovuarPageList",
 			data : "page=" + page,
 			success : function(data){
 				console.log('ajax호출');
 				var htmlArr = data.split("================seperator================");
 				
 				$("#deptListTbody").html(htmlArr[0]);
 				$("#pagination").html(htmlArr[1]);
 			}
 		});
 	}
 	

	/* 전체선택 삭제 */
	function allCheck() {
		if ($("#th_allCheck").is(':checked')) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}

	/* 선택 승인취소*/
	function myclick() {
		var checkRow = '';
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val()+",";
		});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
			$("#checkRow").val(checkRow);
		
			if(checkRow === ""){		
			alert("삭제할 대상을 선택하세요");
			return false;
		}
		
		
		$("#update_frm").submit();
	}

	 
 	 $("document").ready(function(){
 	
       $(function() {
           //input을 datepicker로 선언
           $("#before_slipDate").datepicker({
               dateFormat: 'yy/mm/dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
               ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });                    
           
           //초기값을 오늘 날짜로 설정
           $('#before_slipDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
       });
       
       $(function() {
           //input을 datepicker로 선언
           $("#after_slipDate").datepicker({
               dateFormat: 'yy/mm/dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
               ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });                    
           
           //초기값을 오늘 날짜로 설정
           $('#after_slipDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
       });
 	 });
	</script>
	

 	
