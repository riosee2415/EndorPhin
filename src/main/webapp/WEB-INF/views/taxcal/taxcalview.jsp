<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>매입매출전표 관리</h2>
<hr>
<!-- 키 값으로 하나만 출력하기
<c:out value="${scCode['11'] }" />
 -->


<table class="table table-striped">
		<tr>
			<td style="width: 150px;">dd</td>
			<td style="width: 300px;"><input type="text" /></td>

			<td style="width: 150px;">dd</td>
			<td style="width: 300px;"><input type="text" /></td>
		</tr>
		<tr>
			<td style="width: 150px;">dd</td>
			<td style="width: 300px;"><input type="text" /></td>

			<td style="width: 150px;">dd</td>
			<td style="width: 300px;"><input type="text" /></td>
		</tr>
	</table>
	
	
<div class="table-responsive">
	<table class="table table-striped">
		<thead class="thead">
			<tr>
				<td><input type="checkbox" name="allCheck" id="th_allCheck"
					onclick="allCheck();"></td>
				<th>전표번호</th>
				<th>분개금액</th>
				<th>작성일</th>
				<th>사용부서</th>
				<th>메모</th>
				<th>승인여부</th>
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

<b>매입코드</b> 
<table border="1">
	<tr> 
		<td style="font-size: 12px;">
			<c:forEach var="ph" items="${phCode}" varStatus="status"> 
					<b><font color="blue">${ph.key}</font></b> = 
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
					<b><font color="red">${sc.key}</font></b>  =
					${sc.value} ||
			</c:forEach>
		</td> 
	</tr> 
</table>




