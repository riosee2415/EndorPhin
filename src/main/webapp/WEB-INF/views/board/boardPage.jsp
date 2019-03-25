<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h1 class="page-header">전체 게시글 리스트</h1>
<!-- bdList 정보를 화면에 출력하는 로직 작성 -->

<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${postsList }" var="vo">
					<tr class="bdTr" data-bdid="${vo.boardNo }">
						<td>${vo.boardNo}</td>
						<td>${vo.title}</td>
						<td>${vo.userId}</td>
						<td><fmt:formatDate value="${vo.postDate}"
								pattern="yyyy/MM/dd"></fmt:formatDate></td>
					</tr>
			</c:forEach>
		</tbody>
	</table>

	<form action="${pageContext.request.contextPath}/boarddetail"
		method="get" id="Frm">
		<input type="hidden" id="boardNo" name="boardNo" />
	</form>

	<c:set var="lastPage"
		value="${Integer(postsCnt / pageSize + (postsCnt % pageSize > 0 ? 1 : 0))}" />

	<nav style="text-align: center;">
		<ul class="pagination">
			<c:choose>
				<c:when test="${page == 1 }">
					<li class="disabled"><a aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.servletContext.contextPath }/boardPage?boardTypeCode=${boardTypeCode}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page == 1 }">
					<li class="disabled"><a aria-label="Previous"> <span
							aria-hidden="true">&lt;</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.servletContext.contextPath }/boardPage?page=${page-1}&boardTypeCode=${boardTypeCode}"
						aria-label="Previous"> <span aria-hidden="true">&lt;</span>
					</a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach begin="1" end="${lastPage }" var="i">
				<c:set var="active" value="" />
				<c:if test="${i == page }">
					<c:set var="active" value="active" />
				</c:if>

				<li class="${active }"><a
					href="${pageContext.servletContext.contextPath }/boardPage?boardTypeCode=${boardTypeCode}&page=${i}">${i}</a>
				</li>
			</c:forEach>

			<c:choose>
				<c:when test="${page ==lastPage}">
					<li class="disabled"><a aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.servletContext.contextPath }/boardPage?boardTypeCode=${boardTypeCode}&page=${page+1}"
						aria-label="Next"> <span aria-hidden="true">&gt;</span>
					</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page ==lastPage}">
					<li class="disabled"><a aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.servletContext.contextPath }/boardPage?boardTypeCode=${boardTypeCode}&page=${lastPage}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<form action="${pageContext.request.contextPath}/postInsert" method="get">
			<input type="hidden" id="boardTypeCode" name="boardTypeCode"
				value="${boardTypeCode}"> <input type="hidden" id="cnt"
				name="cnt" value="1">
			<button type="submit" class="btn_btn-default">글 등록</button>
		</form>
	</nav>


</div>

<script>
	$(document).ready(function() {
		$(".bdTr").on("click", function() {
			console.log($(this).data("bdid"));
			var bdId = $(this).data("bdid");
			$("#boardNo").val(bdId);
			$("#Frm").submit();
		})
	});
</script>
