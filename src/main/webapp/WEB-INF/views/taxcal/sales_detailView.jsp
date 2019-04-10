<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h4> 전표 상세내역</h4>
<table border="1">
	<thead class="thead">
		<tr>
			<td style="width: 150px;">구분</td>
			<td style="width: 150px;">계정</td>
			<td style="width: 300px;">적요</td>
			<td style="width: 150px;">차변</td>
			<td style="width: 150px;">대변</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${sales_detailList }" var="list">
			<tr>
				<td><input style="width: 150px;" type="text" value="${list.status }"/></td>
				<td><input style="width: 150px;" type="text" value="${list.establishCode }"/></td>
				<td><input style="width: 300px;" type="text" value="${list.jukyo }"/></td>
				<c:choose>
					<c:when test="${list.status eq '차변' }">
						<td><input  class="leftPrice" type="text" value='<fmt:formatNumber value="${list.price }" pattern="#,###" />' onchange="javascript:fn_setSum()"/></td>
						<td></td>
					</c:when>
					<c:otherwise>
						<td></td>
						<td><input  class="rightPrice" type="text" value='<fmt:formatNumber value="${list.price }" pattern="#,###" />' onchange="javascript:fn_setSum()"/></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
		
		<tr style="background-color: #E6E6E6;">
			<td colspan="3"><b>합계</b></td>
			<td><b><input style="text-decoration: underline;" id="leftSum" type="text"  readonly/></b></td>
			<td><b><input style="text-decoration: underline;" id="rightSum" type="text" readonly/></b></td>
		</tr>
	</tbody>
</table>

<script>

//합계구하기, 차변 - 대변


$("document").ready(function(){
	
	fn_setSum();
	
	
});




function fn_setSum(){
	
	var leftSum = 0;
	var rightSum = 0;
	
	$(".leftPrice").each(function(){
		var left = $(this).val().replace(",","");
		
		leftSum += parseInt(left);
		fn_setSumLeftValue(leftSum);
		
	});
	
	$(".rightPrice").each(function(){
		var right = $(this).val().replace(",","");
		
		rightSum += parseInt(right);
		fn_setSumRightValue(rightSum);
		
	});
}





/* 세자리 단위 콤마*/
function fn_setSumLeftValue(setLeftSum){
	setLeftSum = numberWithCommas(setLeftSum);
	$("#leftSum").val(setLeftSum);
}

/* 세자리 단위 콤마*/
function fn_setSumRightValue(setRightSum){
	setRightSum = numberWithCommas(setRightSum);
	$("#rightSum").val(setRightSum);
}

/* 세자리 단위 콤마*/
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}



</script>