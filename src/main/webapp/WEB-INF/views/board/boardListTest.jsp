<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board</title>
</head>
<body>
<a href="boardForm?boardTypeCode=${boardTypeCode}">글쓰기</a>
                    
<table border="1" style="width:600px">
    <caption>게시판</caption>
    <colgroup>
        <col width='8%' />
        <col width='*%' />
        <col width='15%' />
        <col width='15%' />
    </colgroup>
    <thead>
        <tr>
        <th>번호</th> 
        <th>제목</th>
        <th>등록자</th>
        <th>등록일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="listview" items="${postList}">
            <tr>
                <td>${listview.boardNo}</td>
                <td><a href="boardRead?boardNo=${listview.boardNo}&boardTypeCode=${boardTypeCode}">${listview.boardNo}</a></td>
                <td>${listview.userId}</td>
                <td>${listview.postDate}</td>
           </tr>
        </c:forEach>
    </tbody>
</table>    
<%-- <c:if test="${BoardpageVO.totPage>1}">
<div class="paging">
    <c:forEach var="i" begin="${BoardpageVO.pageStart}" end="${BoardpageVO.pageEnd}" step="1">
        <c:url var="pageLink" value="boardList">
        <c:param name="page" value="${i}" />
        </c:url>                        
            <a href="${pageLink}"><c:out value="${i}"/>${i}</a>
    </c:forEach>
</div>
</c:if>  --%>  
<c:set var="lastPage" value="${Integer(postCnt/pageSize + (postCnt%pageSize > 0 ? 1 : 0)) }" />
<nav style="text-align: center">
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
                <li>
                    <a href="${pageContext.request.contextPath }/boardList?boardTypeCode=${boardTypeCode }" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${page == 1}">
                <li class="disabled">
                    <a aria-label="Previous">
                        <span aria-hidden="true">&lt;</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <a href="${pageContext.request.contextPath }/boardListt?boardTypeCode=${boardTypeCode }&page=${page-1 }" aria-label="Previous">
                        <span aria-hidden="true">&lt;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="1" end="${lastPage }" var="i">
            <c:set var="active" value="" />
            <c:if test="${i == page }">
                <c:set var="active" value="active" />
            </c:if>
            <li class="${active }">
                <a href="${pageContext.request.contextPath }/boardList?boardTypeCode=${boardTypeCode }&page=${i }">${i }</a>
            </li>
        </c:forEach>

        <c:choose>
            <c:when test="${page == lastPage }">
                <li class="disabled">
                    <a aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li><a href="${pageContext.request.contextPath }/boardList?boardTypeCode=${boardTypeCode}&page=${page+1 }" aria-label="Previous">
                        <span aria-hidden="true">&gt;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${page == lastPage }">
                <li class="disabled">
                    <a aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <a href="${pageContext.request.contextPath }/boardList?boardTypeCode=${boardTypeCode }&page=${lastPage }" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
</body>
</html>
