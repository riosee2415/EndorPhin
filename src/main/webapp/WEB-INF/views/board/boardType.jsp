<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EndoRPhin</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css"/>
</head>
<body>
<div class="row">
	<div class="col-sm-5">
		<table>
			<form action="/boardType?type=create" method="post">
				<tr id="boardType">
					<td class="boardTable">게시판 이름</td>
					<td class="boardTable"><input type="text" name="boardTypeName"></td>
					<td class="boardTable">
						<select name="useStatus">
							<option value="1">사용</option>
							<option value="0">미사용</option>
						</select>
					</td>
					<td class="boardTable"><input type="submit" value="생성"></td>
				</tr>
			</form>
		</table>
		
		<table style="margin-top: 50px;">
			<c:forEach var="board" items="${boardAllList }">
				<form action="/boardType?type=update" method="post">
					<tr>
						<input type="hidden" name="boardTypeCode" value="${board.boardTypeCode}">
						<td class="boardTable">게시판 이름</td>
						<td class="boardTable"><input type="text" name="boardTypeName" value="${board.boardTypeName }"></td>
						<td class="boardTable">
							<select name="useStatus" >
								<option value="1" 
									<c:if test="${board.useStatus eq '1' }"> selected</c:if>>사용
								</option>
								<option value="0" 
									<c:if test="${board.useStatus eq '0' }"> selected</c:if>>미사용
								</option>
							</select>
						</td>
						<td class="boardTable"><input type="submit" value="수정"></td>
					</tr>
				</form>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>