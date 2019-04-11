<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<h2>감가상각비</h2>	
	<br>
	<br>
		<table class="table table-hover">
		<tr>
			<td> 연도/년도 
				<select class="chosen-select" id="acquisitionDate">
						<option selected="selected"></option>
				</select>
			</td>
			<td>계정과목명
				<input id="accountName" name="accountName" type="text" id="year" type="text" /> &nbsp
				<input type="button" class="bttn-fill bttn-warning" id="seachBtn" value="검색" onclick="myClick();" />
			</td>
		</tr>
		</table>
    <br>
	<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th>자산명</th>
					<th>자산코드</th>
					<th>취득일</th>
					<th>취득가액</th>
					<th>감가 상각비</th>
					<th>감가상각 누계액</th>
					<th>자존가치</th>
					<th>내용연수</th>
					<th>장부반영</th>
				</tr>
			</thead>	
			<tbody id="assetTbody">
				
			</tbody>
			
		</table>
	</div>
</div>

	<script>
	
	function Enter_Check(){
	        // 엔터키의 코드는 13입니다.
	    if(event.keyCode == 13){
	    	$("#searchE_Btn").click();  // 실행할 이벤트
	    }
	}
    /*계정과목 검색  */
 	function myClick(){
 		if($("#accountName").val().trim()==""){
 			alert("계정과목명을 입력하세요.");
 			$("accountName").focus();
 			return false;
 		}
 		$.ajax({
 			url : "${pageContext.request.contextPath }/assetDateSearch",
 			data : "accountName="+$("#accountName").val() + "&"+ "acquisitionDate="+$("#acquisitionDate").val(),
 			success : function(data){
 				$("#accountName").val("");
 				$("#assetTbody").html(data);
 			}
  		});
    }
 // 동적으로 날짜 년도 append
 	function appendYear($select){
 	 
 	    var date = new Date();
 	    var year = date.getFullYear();
 	    var idx = 0;
 	    for(var i=year-10; i<=year; i++){
 	        $select.prepend("<option value='"+i+"'>"+i+"년"+"</option>");
 	        idx++;
 	    }
 	    $select.find("option:eq(0)").prop("selected", true); // 현재년도 선택
 	 
 	}
 	 
 	appendYear($("#acquisitionDate"));
 		
 	/*장부반영 */
 	function apply_click(){
 		$.ajax({
 			url : "${pageContext.request.contextPath }/slipApply",
 			data : "accountName="+$("#accountName").val() + "&"+ "acquisitionDate="+$("#acquisitionDate").val(),
 			success : function(data){
 				$("#accountName").val("");
 				$("#assetTbody").html(data);
 			}
  		});
 	}
   
	</script>

 	
    