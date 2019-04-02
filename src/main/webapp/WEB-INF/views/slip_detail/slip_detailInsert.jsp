<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<input type="hidden" id="currval" value="${currval }" />
<input type="hidden" id="slipDate" value="${slipDate }" />
<input type="hidden" id="insertDept" value="${insertDept }" />
<input type="hidden" id="juckyo" value="${juckyo }" />

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
		<tr class="inertTemporaryData" data-detailnumber="${list.slipDetailNo }">
			<td><input id="detailNum" style="width: 50px;" type="text" value="000${list.slipDetailNo }"/></td>
			
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
					<td><input class="left" style="width: 70px;" type="text" value="${list.price }"/></td>
					<td><input style="width: 70px;" type="text" value=""/></td>
				</c:when>

				<c:otherwise>
					<td><input style="width: 70px;" type="text" value=""/></td>
					<td><input class="right" style="width: 70px;" type="text" value="${list.price }"/></td>
				</c:otherwise>
			</c:choose>
				<!-- 입력중인 전표 하나만 수정하기 -->
					<td><input type="button" class="cancleOne" name="cancleOne" value="취소"/></td>
		</tr>
	</c:forEach>
</table>
<br />
<span id="sumLeftText">차변합계 : </span><input type="text" id="sumLeftValue" name="sumLeftValue" readonly>
<span id="sumRightText">대변합계 : </span><input type="text" id="sumRightValue" name="sumRightValue" readonly>

<br /><br />

<input id="saveSlip" class="btn btn-primary" type="button" value="전표저장" />
<input id="cancleSlip" class="btn btn-primary" type="button" value="취소" />


<script>
	
	var sumLeft = 0;
	var sumright = 0;
	
	$(document).ready(function(){
		
		$('.left').each(function(){ 
			  var text =+ $(this).val(); 
			  sumLeft = parseInt(sumLeft) + parseInt(text);
			 
			});
		 $("#sumLeftValue").val(sumLeft);
		 

		$('.right').each(function(){ 
			  var text =+ $(this).val(); 
			  sumright = parseInt(sumright) + parseInt(text);
			 
			});
		 $("#sumRightValue").val(sumright);
	});
	
	
	
	
	
	
	
	

	$("#saveSlip").on("click", function(){
		$("#insertSlipBtn").attr("disabled", false);
		
		var sumLeftValue = $("#sumLeftValue").val();
		var sumRightValue = $("#sumRightValue").val();
		
		if(sumLeftValue != sumRightValue){
			alert("차변과 대변의 금액이 다릅니다. 분개내용을 확인해주세요.");
			return;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/finalSaveSlip",
			data : "slipNumber=" + $("#currval").val() + "&total=" + sumLeftValue + "&slipDate=" + $("#slipDate").val() + "&insertDept=" + $("#insertDept").val() + "&juckyo=" +$("#juckyo").val(),
			success : function(data){
				
				
				
				alert("전표가 정상적으로 작성되었습니다.");
				$("#insertArea").html("");
				insertFlag = 0;
				
			}
				
		
		});
	});

	
	
	$("#cancleSlip").on("click",function(){
		
		var answer = confirm("입력하신 전표 데이터가 삭제됩니다. 취소하시겠습니까?");
		
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
	
	
	// 입력중인 상세전표 하나 삭제하기
	$(".cancleOne").on("click", function(){
		var slipNum = $("#currval").val();
		var detailNum = $(".inertTemporaryData").data("detailnumber");
		
		var tr = $(this).parent().parent();
		
		tr.children().eq(0).html("");
		tr.children().eq(1).html("");
		tr.children().eq(2).html("");
		tr.children().eq(3).html("");
		tr.children().eq(4).html("");
		tr.children().eq(5).html("");
		
		$(this).parent().html("");
		
		
		
		$.ajax({
			url : "${pageContext.request.contextPath }/deleteSlip_detail_one",
			data : "slipNumber=" + slipNum  + "&detailNum=" + detailNum,
			success : function(data){
				
				
			}
			
		});
		
		
	});
	
	
</script>



