<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${clientList }" var="vo">
	<tr class="establishTr" data-establishCode="${vo.clientCode }"onclick="establishTr()">
		<td>${vo.clientCode}</td>
		<td>${vo.clientName}</td>
	</tr>
</c:forEach>