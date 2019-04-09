<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:forEach items="${companyList }" var="vo">
		<tr class="companyTr" data-selcompanycode="${vo.companyCode }"
			onclick="companyTr();">
			<td>${vo.companyCode}</td>
			<td>${vo.companyName}</td>
		</tr>
	</c:forEach>
