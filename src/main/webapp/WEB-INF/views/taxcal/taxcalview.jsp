<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>매입매출전표 관리2</h2>
<hr>

<!-- 키 값으로 하나만 출력하기
	<c:out value="${scCode['11'] }" />
 -->


<!-- 뷰 폼 -->
<table class="table table-striped">
		<tr>
			<td style="width: 150px;">ddaa24</td>
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
				<td style="width: 100px;">공급가액</td>
				<td style="width: 100px;">부가세</td>
				<td style="width: 100px;">공급대가</td>
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
		<td><input id="insertSupplyValue" style="width: 100px;" type="text" readonly/></td>  <!-- 공급가액 -->
		<td><input id="insertSurTax" style="width: 100px;" type="text" readonly/></td>  <!-- 부가세 -->
		<td><input id="insertSumValue" style="width: 100px;" type="text" /></td>  <!-- 공급대가 -->
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
					<b><font class="phKey" color="blue">${ph.key}</font></b> = 
					<span class="phValue">${ph.value}</span>||
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
					<b><font class="scKey" color="red">${sc.key}</font></b>  =
					<span class="scValue">${sc.value}</span> ||
			</c:forEach>
		</td> 
	</tr> 
</table>



<script>
	// Status Code Map
	var statusCodeMap = new Map();
	
	
	// 매입매출전표 입력 - 구분 엔터키 실행
	$("#insertSalesStatus").keypress(function(e){
		fn_salesSet(e);
	});
	
	// 공급대가 금액 입력 - 엔터키 실행
	$("#insertSumValue").keypress(function(e){
		fn_distinguishValue(e);
	});
	
	
	
	
	
	
	
	
	
	
	
// function
	
	
	
	/*매입매출 구분 셋팅*/
	function fn_salesSet(e){
		if(e.which == 13){
			
			// 파라미터 index, item
			$(".scKey").each(function(i,item){
				statusCodeMap.set($(this).html(), $(".scValue").eq(i).html());
			});
			
			// 파라미터 index, item
			$(".phKey").each(function(i,item){
				statusCodeMap.set($(this).html(), $(".phValue").eq(i).html());
			});
			
		$("#insertSalesStatus").val(statusCodeMap.get($("#insertSalesStatus").val()));
		}
	}
	
	
	/*공급대가 데이터를 활용하여 공급가액과 부가세액 셋팅*/
	function fn_distinguishValue(e){
		if(e.which == 13){
			var supplyValue = parseInt($("#insertSumValue").val() / 1.1);
			var surTax 		= parseInt($("#insertSumValue").val() - supplyValue);
			var sumValue 	= $("#insertSumValue").val();
			
			supplyValue 	= fn_numberWithCommas(supplyValue + "");
			surTax 			= fn_numberWithCommas(surTax + "");
			sumValue 		= fn_numberWithCommas(sumValue + "");
			
			$("#insertSupplyValue").val(supplyValue);
			$("#insertSurTax").val(surTax);
			$("#insertSumValue").val(sumValue);
			
		}
		
	}
	
	
	/*공급대가 데이터를 활용하여 공급가액과 부가세액 셋팅*/
	function fn_numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	

</script>
