<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<style>
/* 글 숨기 */
.target { display: inline-block;
		  width: 100px; white-space: nowrap;
		  overflow: hidden; text-overflow: ellipsis;
	 }

</style>
<body>
                    
<table class="table table-striped">
	<h2><strong><i class="fas fa-pen-alt"></i>게시판</strong></h2>
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
                <td><a class="target" href="boardRead?boardNo=${listview.boardNo}&boardTypeCode=${boardTypeCode}">${listview.title}</a></td>
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
<jsp:include page="/WEB-INF/views/board/pagingforSubmit.jsp" />
<a href="boardForm?boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">글쓰기</button></a>
</body>
</html>
