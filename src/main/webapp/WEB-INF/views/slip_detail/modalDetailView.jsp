<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${data }" var="data">
	<tr>
		<td><input style="width: 70px;" type="text" value="000${data.slipDetailNo }" /></td>
		<td><input style="width: 70px;" type="text" value="${data.establishCode }" /></td>
		<td><input style="width: 100px;" type="text" value="${data.clientCard }" /></td>
		<c:choose>
			<c:when test="${data.status  == 0 }">
				<td><input class="left" style="width: 70px;" type="text" value="${data.price }"/></td>
				<td><input style="width: 70px;" type="text" value=""/></td>
			</c:when>

			<c:otherwise>
				<td><input style="width: 70px;" type="text" value=""/></td>
				<td><input class="right" style="width: 70px;" type="text" value="${data.price }"/></td>
			</c:otherwise>
		</c:choose>
	</tr>
</c:forEach>
