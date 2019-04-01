<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<input type="hidden" id="currval" value="${currval }" />

<table>
	<thead>
		<tr>
			<td>전표상세</td>
			<td>차/대</td>
			<td>계정과목</td>
			<td>거래처</td>
			<td>차변</td>
			<td>대변</td>
		</tr>
	</thead>
	
	<c:forEach items="${slip_detailList }" var="list">
		<tr>
			<td><input style="width: 50px;" type="text" value="000${list.slipDetailNo }"/></td>
			
			<c:choose>
				<c:when test="${list.status  == 0 }">
					<td><input style="width: 70px;" type="text" value="차변"/></td>
				</c:when>

				<c:otherwise>
					<td><input style="width: 70px;" type="text" value="대변"/></td>
				</c:otherwise>
			</c:choose>
			
			<td><input style="width: 70px;" type="text" value="${list.establishCode }"/></td>
			<td><input style="width: 120px;" type="text" value="${list.clientCard }"/></td>
			
			<c:choose>
				<c:when test="${list.status  == 0 }">
					<td><input style="width: 70px;" type="text" value="${list.price }"/></td>
					<td><input style="width: 70px;" type="text" value=""/></td>
				</c:when>

				<c:otherwise>
					<td><input style="width: 70px;" type="text" value=""/></td>
					<td><input style="width: 70px;" type="text" value="${list.price }"/></td>
				</c:otherwise>
			</c:choose>
			
			
		</tr>
	</c:forEach>
	
</table>

<input id="saveSlip" class="btn btn-primary" type="button" value="전표저장" />
<input id="cancleSlip" class="btn btn-primary" type="button" value="취소" />


<script>
	$("#saveSlip").on("click",function(){
		$("#insertSlipBtn").attr("disabled", false);
	});
	
	
	
	
	
	$("#cancleSlip").on("click",function(){
		
		var answer = confirm("입력하던 전표가 삭제됩니다. 취소하시겠습니까?");
		
		// 확인버튼
		if(answer){
			$.ajax({
				url : "${pageContext.request.contextPath }/deleteSlip_detail",
				data : "slipNumber=" + $("#currval").val() ,
				success : function(data){
					console.log(data);
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



