<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${assetList }" var="vo">	
	 <tr>
		<td><a class="bttn-stretch bttn-warning detailView" >
					${vo.assetCode }</a></td>
					<c:set var = "sum" value = "${sum+vo.acquisitionPrice/1.1 }" />
					<td>${vo.assetName }</td>	
					<td>${vo.accountName }</td>								
		<td><fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy-MM-dd"/></td>
		<td>${vo.acquisitionPrice }</td>
		<td><input type="button" value="장부반영" id="applybtn" name="applybtn"/></td>
 	</tr>
 	<div id="insertArea"></div>
</c:forEach>