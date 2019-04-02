<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>매입매출전표 관리</h2>
<hr>


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

