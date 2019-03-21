<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h2> 거래처 관리 </h2>
<hr>

<table>
	<thead>
		<tr>
			<th>거래처코드</th>
			<th>거래처명</th>
			<th>대표자명</th>
			<th>전화번호</th>
			<th>상태</th>
		</tr>
	</thead>
	<c:forEach items="${clientList }" var="client">
		<tbody>
			<tr>
				<td>${client.clientCode }</td>
				<td>${client.clientName }</td>
				<td>${client.manager }</td>
				<td>${client.telephone }</td>
				<c:choose>
					<c:when test="${client.useStatus == 1 }">
						<td>거래가능</td>
					</c:when>
					
					<c:otherwise>
						<td><font color="red">거래불가</font></td>
					</c:otherwise>	
				</c:choose>
			</tr>		
		</tbody>
	</c:forEach>
</table>
<br />

<input name="insertClient" id="insertClient" type="button" value="거래처등록" onclick="insertClientBtn()"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>
	$(document).ready(function(){
	
	
	});
	

	function insertClientBtn(){
		
		var popUrl = "/popup/insertClientPop.jsp";	//팝업창에 출력될 페이지 URL
		var popOption = "left=300, top=200, width=900, height=740, resizable=no, scrollbars=yes, status=no;";    
			window.open(popUrl,"",popOption);
	}

</script>

</body>
</html>