<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach items="${dateList00 }" var="vo1">
		<tr>
			<td> ${vo1.slipNumber }</td>
			<td><fmt:formatDate value="${vo1.slipDate }" pattern="yyyy-MM-dd"/></td>
			<td> ${vo1.jukyo }</td>
			<td> ${vo1.total }</td>
			<td> ${vo1.departmentName }</td>
		</tr>
</c:forEach>

================seperator================

<c:set var="lastPage" value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />


<nav style="text-align:center;">
	<ul class="pagination">
		<c:choose>
			<c:when test="${page == 1 }">
				<li class="disabled">
					<a aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:when>	
		<c:otherwise>
			<li><a href="${pageContext.request.contextPath }/approval" aria-label="Previous"></a>
				<span aria-hidden="true">&laquo;</span>
			</li>
		</c:otherwise>		
		</c:choose>
		
		<c:forEach begin="1" end="${lastPage }" var="i">
			<c:set var="active" value="" />
			 <c:if test="${i == page }" >
			 	<c:set var ="active" value="active"/>
			 </c:if>
			 
			 <li class="${active }">
			 	<a href="javascript:searchAjax(${i})">${i}</a>
			 </li>
		</c:forEach>
	<c:choose>
		<c:when test="${page == lastPages }" >
			<li class="disabled">
			<a aria-labe="Next">
			<span aria-hidden="true">&raqua;</span>
			 </a></li>
		</c:when>
		<c:otherwise>
			<li><a href="javascript:searchAjax(${lastPage })" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</nav>