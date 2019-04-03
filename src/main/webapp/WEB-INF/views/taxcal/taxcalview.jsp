<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>매입매출전표 관리</h2>
<hr>

<!-- 키 값으로 하나만 출력하기
	<c:out value="${scCode['11'] }" />
 -->
 
 <div id="setSalesStatus">
 </div>

<c:out value="${scCode['51'] }" />

<!-- 뷰 폼 -->
<table class="table table-striped">
		<tr>
			<td style="width: 150px;">ddaa2</td>
			<td style="width: 300px;"><input type="text" /></td>

			<td style="width: 150px;">dd</td>
			<td style="width: 300px;"><input type="text" /></td>
		</tr>
	</table>
	
	
<div class="table-responsive">
	<table class="table table-striped">
		<thead class="thead">
			<tr>
				<td style="width: 100px;">날짜</td>
				<td style="width: 80px;">구분</td>
				<td>공급가액</td>
				<td>부가세</td>
				<td>공급대가</td>
				<td>거래처</td>
				<td>사용부서</td>
				<td>발주번호</td>
				<td>전자여부</td>
				<td>분개</td>
			</tr>
		</thead>
		<tbody id="establishListTbody">
		</tbody>
	</table>

	<c:set var="lastPage"
		value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

	<nav style="text-align: center;">
		<ul id="pagination" class="pagination">
		</ul>
	</nav>
</div>
<hr>


<!-- 입력 폼 -->
<table>
	<tr>
		<td><input style="width: 100px;" type="text" /></td> <!-- 날짜 -->
		<td><input id="insertSalesStatus" style="width: 80px;" type="text" /></td> <!-- 구분 -->
		<td><input type="text" /></td> 
		<td><input type="text" /></td> 
		<td><input type="text" /></td> 
		<td><input type="text" /></td> 
		<td><input type="text" /></td> 
		<td><input type="text" /></td> 
		<td><input type="text" /></td> 
		<td><input type="text" /></td> 
	</tr>
</table>
<!-- 입력 폼 끝 -->



<hr>
<b>매입코드</b> 
<table border="1">
	<tr> 
		<td style="font-size: 12px;">
			<c:forEach var="ph" items="${phCode}" varStatus="status"> 
					<b><font class="phClass" color="blue">${ph.key}</font></b> = 
					${ph.value} ||
			</c:forEach>
		</td> 
	</tr> 
</table>


<br /> <br />
<b>매출코드</b> <br />
<table border="1">
	<tr> 
		<td style="font-size: 12px;">
			<c:forEach var="sc" items="${scCode}" varStatus="status"> 
					<b><font class="scClass" color="red">${sc.key}</font></b>  =
					<span>${sc.value}</span> ||
			</c:forEach>
		</td> 
	</tr> 
</table>



<script>
	var ph = new Map();
	var sc = new Map();
	
	
	
	
	// 매입매출전표 입력 - 구분 선택
	$("#insertSalesStatus").keypress(function(e){
		fn_salesSet(e);
	});
	
	
	
	
	
	
	
	
// function
	
	// 매입매출 구분 셋팅
	function fn_salesSet(e){
		if(e.which == 13){
			
			$(".phClass").each(function(){
				ph.set($(this).html(),1);
		
			});
		alert(ph.get($("#insertSalesStatus").val()));			
		}
	}
	
	
	
	

</script>
