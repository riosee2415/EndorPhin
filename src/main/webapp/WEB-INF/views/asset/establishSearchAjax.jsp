<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:forEach items="${establishList }" var="vo">
		<tr class="establishTr" data-establishCode="${vo.establishCode }"
			onclick="establishTr()">
			
			<td>${vo.establishCode}</td>
			<td>${vo.status}</td>
			<td>${vo.establishNameKor}</td>
		</tr>
	</c:forEach>