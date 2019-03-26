<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
   	<c:forEach items="${establishList }" var="vo">
   	
   		<tr>
   			<td>${vo.establishCode}</td>
   			<td>${vo.establishNameKor}</td>
   			<td>${vo.establishNameEng}</td>
   			<td>${vo.status}</td>
   		</tr>
   	
   	</c:forEach>

   	
================seperator================


   	
<c:set var="lastPage"
	value="${Integer(establishCnt/pageSize + (establishCnt%pageSize > 0 ? 1 : 0))}" />

<c:choose>
	<c:when test="${page == 1 }">
		<li class="disabled"><a aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="${cp }/establishview" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>

<c:forEach begin="1" end="${lastPage }" var="i">
	<c:set var="active" value="" />
	<c:if test="${i == page }">
		<c:set var="active" value="active" />
	</c:if>

	<li class="${active }"><a
		href="javascript:getEstablishPageList(${i})">${i}</a></li>
</c:forEach>


<c:choose>
	<c:when test="${page == lastPage }">
		<li class="disabled"><a aria-label="Next"> <span
				aria-hidden="true">&raquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:getEstablishPageList(${lastPage})"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>