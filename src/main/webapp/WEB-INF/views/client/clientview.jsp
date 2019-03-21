<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2>거래처 관리</h2>
	<hr>
	<br />
	거래처코드 : <input name="client_code" id="client_code" type="text" />
	거래처명 : <input name="client_name" id="client_name" type="text" />
	<input type="button" id="seachBtn" value="검색" onclick="seachClientBtn()" />
	<br /><br />
	<table>
		<thead>
			<tr>
				<th>거래처코드</th>
				<th>거래처명</th>
				<th>대표자명</th>
				<th>전화번호</th>
				<th>팩스번호</th>
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
					<td>${client.faxNumber }</td>
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

	<input name="insertClient" id="insertClient" type="button"
		value="거래처등록" onclick="insertClientBtn()" />




	
	
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

	<script>
		$(document).ready(function() {
			$("#client_code").focus();
			
			$("#client_code").keydown(function(key) {
				if (key.keyCode == 13) {
					$("#seachBtn").click();
					
				}

			});
			
			$("#client_name").keydown(function(key) {
				if (key.keyCode == 13) {
					$("#seachBtn").click();
					
				}

			});




		
		});
			function insertClientBtn() {
	
				var popUrl = "/popup/insertClientPop.jsp"; //팝업창에 출력될 페이지 URL
				var popOption = "left=300, top=200, width=900, height=740, resizable=no, scrollbars=yes, status=no;";
				window.open(popUrl, "", popOption);
			}
			
			function seachClientBtn(){
				var client_code = $("#client_code").val();
				var client_name = $("#client_name").val();
				
				/*Validation*/
				if(client_code === "" && client_name === ""){
					alert("거래처코드 또는 거래처이름을 입력하세요.");
					$("#client_code").focus();
				} else if(client_code !== "" && client_name === ""){
					$("#cCode").val(client_code);
					
					$("#frm1").submit();
				} else if(client_name !== "" && client_code === ""){
					$("#cName").val(client_name);
					
					$("#frm2").submit();
				} else if(client_code !== "" && client_name !== "" ){
					$("#BothName").val(client_name);
					$("#BothCode").val(client_code);
					
					$("#frm3").submit();
					
				}			
			}
		
	
		
	</script>
	
	
	<form id="frm1" action="${pageContext.request.contextPath }/seachCodeClient" method="get">
		<input type="hidden" name="cCode" id="cCode" />
	</form>
	
	<form id="frm2" action="${pageContext.request.contextPath }/seachNameClient" method="get">
		<input type="hidden" name="cName" id="cName" />
	</form>
	
	<form id="frm3" action="${pageContext.request.contextPath }/seachBothClient" method="get">
		<input type="hidden" name="BothCode" id="BothCode" />
		<input type="hidden" name="BothName" id="BothName" />
	</form>
	

</body>
</html>