<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<style>

#nav{


		font-size :large;
 		width: 500px;
        margin-left: auto;
        margin-right: auto;

}


</style>


<c:set var="lastPage" value="${Integer(postCnt/pageSize + (postCnt%pageSize > 0 ? 1 : 0)) }" />
<nav id="nav" >
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
                    <a href="${pageContext.request.contextPath }/boardList?boardTypeCode=${boardTypeCode }&page=${page-1 }" aria-label="Previous">
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
                                                 
<input type="hidden" name="page" id="page" value="" />
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	function fnSubmitForm(page){ 
		document.form.page.value=page;
		document.form.submit();
	}
	</script>

</body>
</html>