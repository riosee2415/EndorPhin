<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
   	<c:forEach items="${slipList }" var="vo">
   	

   		<tr>
   			<td><input type="checkbox" name="checkRow" value="${vo.slipNumber }" ></td>
   			<td><a class="detailView" href="#esDetail" data-toggle="modal">${vo.slipNumber}</a></td>
   			<td><fmt:formatNumber value="${vo.total}" pattern="#,###" /></td>
   			<td><fmt:formatDate value="${vo.slipDate}" pattern="yyyy/MM/dd" /></td>
   			<td>${vo.departmentName}</td>
   			<td>${vo.jukyo}</td>
   			<c:choose>
				<c:when test="${vo.status == 0 }">
					<td><font color="red">미승인</font></td>
				</c:when>
	
				<c:otherwise>
					<td><font color="blue">승인</font></td>
				</c:otherwise>
			</c:choose>
   		</tr>
   	
   	</c:forEach>
   	
   	
   	

   	
================seperator================


   	
<c:set var="lastPage"
	value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

<c:choose>
	<c:when test="${page == 1 }">
		<li class="disabled"><a aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="${pageContext.request.contextPath }/slipview" aria-label="Previous">
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
		href="javascript:getSlipPageList(${i})">${i}</a></li>
</c:forEach>


<c:choose>
	<c:when test="${page == lastPage }">
		<li class="disabled"><a aria-label="Next"> <span
				aria-hidden="true">&raquo;</span>
		</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:getSlipPageList(${lastPage})"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</c:otherwise>
</c:choose>