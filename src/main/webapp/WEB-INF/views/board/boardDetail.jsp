<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="row" style="padding-top: 50px;">
		<div class="col-sm-7" style="border: 1px solid #ccc; padding: 5px;" >
			[${selectPost.userId } / <fmt:formatDate value="${selectPost.postDate }" pattern="yyyy-MM-dd"/>]
		</div>
	</div>
	<div class="row" style="padding-top: 0px;">
		<div class="col-sm-7" style="border: 1px solid #ccc; padding: 5px;" >
			${selectPost.title }
		</div>
	</div>
	<div class="row" style="padding-top: 0px;">
		<div class="col-sm-7" style="border: 1px solid #ccc;  padding: 5px;">
			${selectPost.contents }
		</div>
	</div>
	<div class="row">
		<div class="col-sm-5" >
			첨부파일  
			<c:forEach var="Attach_boardVo" items="${Attach_boardVoList }"> 
				<br>
				<a href="${pageContext.request.contextPath }/fileDownload?attachCode=${Attach_boardVo.attachCode }" style="color: black;">${Attach_boardVo.attachCode }</a>
			</c:forEach>
			
		</div>
		<div class="col-sm-6" style="padding-left: 115px;">
<%-- 				<form action="${pageContext.request.contextPath }/postsWriting" method="get" style="display:inline;"> --%>
<!-- 					<button type="submit" class="btn btn-default">답글</button> -->
<%-- 					<input type="hidden" name="ps_parentsnum" value="${selectPost.boardNo }"> --%>
<%-- 					<input type="hidden" name="ps_gn" value="${postsVo.ps_gn }"> --%>
<%-- 					<input type="hidden" name="board_num" value="${param.board_num }"> --%>
<!-- 				</form> -->
			
			<c:if test="${employeeVo.userId eq postsVo.userId}">
				<form action="${pageContext.request.contextPath }/postsWriting" method="post" style="display:inline;">
					<button type="submit" class="btn btn-default">수정</button>
					<input type="hidden" name="boardNo" value="${selectPost.boardNo }">
					<input type="hidden" name="boardTypeCode" value="${param.boardTypeCode }">
					<input type="hidden" name="update" value="update">
				</form>
				
				<form action="${pageContext.request.contextPath }/updatePosts" method="get" style="display:inline;">
					<button type="submit" class="btn btn-default">삭제</button>
					<input type="hidden" name="boardNo" value="${selectPost.boardNo}">
					<input type="hidden" name="boardTypeCode" value="${param.boardTypeCode }">
				</form>
			</c:if>
		</div>
	</div>
	<div class="row"></div>
	<c:forEach var="cmtVo" items="${commentList }">
				<div class="row" style="padding-top: 0px">
					<div class="col-sm-7" style="border: 1px solid #ccc; padding: 7px;" >
						<div class="col-sm-9">
						${cmtVo.commentContents }
						</div>
						<div class="col-sm-3">
							[${cmtVo.commentUser } / <fmt:formatDate value="${cmtVo.commentDate }" pattern="yyyy-MM-dd"/>]
						</div>
					</div>
					<c:if test="${cmtVo.commentUser eq employeeVo.userId }">
						<div class="col-sm-1">
							<form action="${pageContext.request.contextPath }/board_cmtController" method="post">
								<input type="hidden" name="boardNo" value="${selectPost.boardNo }">
								<input type="hidden" name="boardTypeCode" value="${param.boardTypeCode }">
								<input type="hidden" name="commentNo" value="${commentList.commentNo }">
								<button type="submit" class="btn btn-default">삭제</button>
							</form>
						</div>
					</c:if>
				</div>
	</c:forEach>
	<div class="row">
		<form action="${pageContext.request.contextPath }/board_cmtController" method="get">
			<div class="col-sm-6" style="padding-left: 0px;">
				<input type="text" name="cmt_contents" style="width: 715px;">
				<input type="hidden" name="boardNo" value="${selectPost.boardNo }">
				<input type="hidden" name="boardTypeCode" value="${param.boardTypeCode}">
				<button type="submit" class="btn btn-default">댓글 작성</button>
			</div>
		</form>
	</div>