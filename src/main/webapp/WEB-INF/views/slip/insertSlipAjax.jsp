<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<style type="text/css">
	.thead2{
	color : white;
	background-color: #997149;
	text-align: center;
	}
	
	</style>
</head>
<br />
<input id="currval" type="hidden" value="${currval }" />

	<center>
	  	<table>
	  		<thead class="thead2">
				<tr>
					<td>  전표번호 </td>
					
					<td>  작성일(*)  </td>
	
					<td>  차대변(*)  </td>
		
					<td colspan="2">  계정과목(*)  </td>
					
					<td>  사용부서  </td>
		
					<td colspan="2">  거래처/카드(*)  </td>
				
					<td>  메모  </td>
					
					<td>  금액  </td>

					<td >   </td>
					
				</tr>
			</thead>
			
			<tbody>
					
				<tr>
					<td> <input style="width: 50px;" type="text" id="insertSlipNumber" name="insertSlipNumber" value="${slipNumber }" readonly ></td>
					
					<td> <input style="width: 100px;"  type="text" id="insertSlipDate">    </td>
					
					<td> 
						<select name="status">
							<option value="0" selected="selected">차변</option>
							<option value="1" >대변</option>
						</select>
				   </td>
				   <!-- Establish -->
				   <td> <input type="text" id="searchEstablishValue" name="searchEstablishValue"/>  		</td>
				   <td> <input type="button" id="searchEstablish_btn" value="검색" data-toggle="modal" data-target="#searchEstablish_modal"/>		</td>
				   
					
					<td>
						<select name="dept">
							<option value="미등록" selected="selected">-------</option>
								<c:forEach items="${deptList }" var="dept">
									<option value="${dept.deptName }">${dept.deptName }</option>
								</c:forEach>
						</select>
					</td>
					<!-- Client -->
					<td> <input type="text" id="searchClientValue" name="searchClientValue"/>  		</td>
				    <td> <input type="button" id="searchClient_btn2" value="검색" data-toggle="modal" data-target="#searchClient_modal"/>	</td>
					
					<td> <input id="juckyo" name="juckyo" type="text" />  </td>
					
					<td> <input id="searchPriceValue" type="text" />  </td>
					
					<td> <input id="temporaryAddition" name="temporaryAddition" type="button" value="등록">  </td>
				</tr>
			</tbody>
	  	</table>
	  		<br />
	  	
		  		<div id="temporaryArea">
		  		
		  		</div>
		  		
		  		<br />
		  		
		  		<div id="cancleBtn_onlySlip">
		  			<input type="button" class="bttn-simple bttn-warning" id="cancleOnlySlip" name="cancleOnlySlip" value="작성취소" />
		  		</div>
  		</center>
  		
  		
  		
  	<!-- Search Establish Modal Window  -->		
  	<div class="modal modal-center fade" id="searchEstablish_modal" tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel"> 
	   		<div class="modal-dialog modal-80size modal-center" role="document">
	   			 <div class="modal-content modal-80size"> 
		   			<div class="modal-header"> 
		   				<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
		   				<h4 class="modal-title" id="myModalLabel">계정과목 검색</h4>
		   			</div> 
		   			
		   			<div class="modal-body"> 
		   				<div class="form-group">
		   					<label for="InputEmail">계정과과목 코드&nbsp;&nbsp;&nbsp;</label> 
		   					<input type="text" id="searchEstablishValue2" name="searchEstablishValue2" />
		   					<input type="button" id="searchDataBtn" name="searchDataBtn" value="검색"/>
		   				</div>
		   				
		   				<div class="form-group">
		   					<label for="InputEmail">현재선택된 코드&nbsp;&nbsp;&nbsp;</label> 
		   					<input type="text" id="selectEstablishValue" name="selectEstablishValue" readonly/>
		   					<button type="button" class="btn btn-primary" id="ok_btn" class="btn btn-default" data-dismiss="modal" >확인</button>
		   				</div>
		   				
		   				<div id="searchDataArea">
		   				
		   				</div>
		   				
		   			</div> 
		   			
		   			<div class="modal-footer">
	   				</div> 
	   				
	   			</div> 
	   		</div> 
	   </div>
	   
	   
	   
	<!-- Search Client Modal Window  -->		
  	<div class="modal modal-center fade" id="searchClient_modal" tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel"> 
	   		<div class="modal-dialog modal-80size modal-center" role="document">
	   			 <div class="modal-content modal-80size"> 
		   			<div class="modal-header"> 
		   				<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
		   				<h4 class="modal-title" id="myModalLabel">거래처 검색</h4>
		   			</div> 
		   			
		   			<div class="modal-body"> 
		   				<div class="form-group">
		   					<label for="InputEmail">거&nbsp;&nbsp;&nbsp;래&nbsp;&nbsp;&nbsp;처&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;</label> 
		   					<input type="text" id="searchClientValue2" name="searchClientValue2" />
		   					<input type="button" id="searchDataBtn2" name="searchDataBtn2" value="검색"/>
		   				</div>
		   				
		   				<div class="form-group">
		   					<label for="InputEmail">선택한 거래처&nbsp;&nbsp;&nbsp;</label> 
		   					<input type="text" id="selectClientValue" name="selectClientValue" readonly/>
		   					<button type="button" class="btn btn-primary" id="ok_btn2" class="btn btn-default" data-dismiss="modal" >확인</button>
		   				</div>
		   				
		   				<div id="searchDataArea2">
		   				
		   				</div>
		   				
		   			</div> 
		   			
		   			<div class="modal-footer">
	   				</div> 
	   				
	   			</div> 
	   		</div> 
	   </div>
  		
  		
  	
  	 <script>
  	 
  	 $("document").ready(function(){
  		 
  	
        $(function() {
            //input을 datepicker로 선언
            $("#insertSlipDate").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
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
            $('#insertSlipDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
        });
        
  	 });
  	 
  	 
  	/* 계정과목 검색 기능 */
  	$("#searchEstablishValue").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#searchEstablish_btn").click();
			$("#searchEstablishValue2").focus();
		}
  	});
  	
  	$("#searchEstablishValue").dblclick(function(){
  		$("#searchEstablish_btn").click();
		$("#searchEstablishValue2").focus();
  	});
  	
  	$("#searchEstablishValue2").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#searchDataBtn").click();
			$("#searchEstablishValue2").focus();
		}
  	});
		
		
  	 $("#searchEstablish_btn").on("click", function(){
  		$("#searchEstablishValue2").val($("#searchEstablishValue").val());
  		$("#searchDataBtn").click();
  		$("#searchEstablishValue2").focus();
  		$("#searchDataArea").html("");
  		 
  		 
  	 });
  	 
  	 $("#searchDataBtn").on("click", function(){
  		$("#searchEstablishValue2").focus();
  		 $.ajax({
  			url : "${pageContext.request.contextPath }/establishSearchUseSlip",
			data : "searchEstablishValue2=" +$("#searchEstablishValue2").val(),
			success : function(data){
				console.log(data);
				$("#searchDataArea").html(data);
				$("#searchEstablishValue2").focus();
				
			}
  		 });
  		 
  	 });
  	 
  	 
  	/* 거래처 검색 기능 */
    $("#searchClientValue").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#searchClient_btn2").click();
			$("#searchClientValue2").focus();
		}
  	});
  	
  	$("#searchClientValue").dblclick(function(){
  		$("#searchClient_btn2").click();
		$("#searchClientValue2").focus();
  	});
  	
  	$("#searchClientValue2").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#searchDataBtn2").click();
			$("#searchClientValue2").focus();
		}
  	});
		
		
  	 $("#searchClient_btn2").on("click", function(){
  		$("#searchClientValue2").val($("#searchClientValue").val());
  		$("#searchDataBtn2").click();
  		$("#searchClientValue2").focus();
  		$("#searchDataArea2").html("");
  		 
  		 
  	 });
  	 
  	$("#searchDataBtn2").on("click", function(){
  		$("#searchClienthValue2").focus();
  		 $.ajax({
  			url : "${pageContext.request.contextPath }/ClientSearchUseSlip",
			data : "searchClientValue2=" +$("#searchClientValue2").val(),
			success : function(data2){
				console.log(data2);
				$("#searchDataArea2").html(data2);
				$("#searchClientValue2").focus();
				
			}
  		 });
  		 
  	 });
    
  	var detailNo  = 1;
  	
  	$("#temporaryAddition").on("click", function(){
  		
  		
  		$("#cancleOnlySlip").attr("disabled", true);
  		/*Validation*/

  		
  		/*Insert Source*/
  		var insertSlipNumber		= $("#insertSlipNumber").val();
  		var insertSelectSlipStatus 	= $("select[name=status]").val();
  		var insertEstablish			= $("#searchEstablishValue").val();
  		var insertClientCard		= $("#searchClientValue").val();
  		var insertPrice				= $("#searchPriceValue").val();
  		var currval					= $("#currval").val();
  		var insertSlipDate			= $("#insertSlipDate").val();
  		var insertDept				= $("select[name=dept]").val();
  		var juckyo					= $("#juckyo").val();
  		
  		$.ajax({
  			url : "${pageContext.request.contextPath }/insertDetailSlip",
  			data : "slipDetailNo=" + detailNo + "&status=" + insertSelectSlipStatus + "&price=" + insertPrice + "&clientCard=" + insertClientCard + "&slipNumber=" + insertSlipNumber + "&establishCode=" + insertEstablish + "&currval=" + currval +"&insertSlipDate=" + insertSlipDate + "&insertDept=" + insertDept + "&juckyo=" + juckyo,
  			success : function(data){
  				console.log(data);
  				$("#temporaryArea").html(data);
  				
  			}
  			
  		});
  		
  		
  		detailNo++;
  		
  		// 입력영역 값 초기화
  		$("#searchEstablishValue").val("");
  		$("#searchClientValue").val("");
  		
  	});
  	
  	
  	$(document).keydown(function (e) {
  	     
        if (e.which === 116) {
            if (typeof event == "object") {
                event.keyCode = 0;
            }
            return false;
        } else if (e.which === 82 && e.ctrlKey) {
            return false;
        }
}); 

  	
  	$("#cancleOnlySlip").on("click", function(){
		var answer = confirm("입력하신 전표 데이터가 삭제됩니다. 취소하시겠습니까?");
		
		// 확인버튼
		if(answer){
			$.ajax({
				url : "${pageContext.request.contextPath }/cancleOnlySlip",
				data : "slipNumber=" + $("#currval").val() ,
				success : function(data){
					alert("전표입력 정상 취소");
				$("#insertArea").html("");
				insertFlag = 0;		
					
				}
				
			});
			
				
			
			
			
			$("#insertSlipBtn").attr("disabled", false);
		// 취소버튼 (동작 없음)
		} else if(!answer){
			
		}
  		
  	});


     </script>
	

	