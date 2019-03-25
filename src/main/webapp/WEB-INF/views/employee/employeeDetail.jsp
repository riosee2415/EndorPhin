<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<form class="form-horizontal">
	<div class="form-group">
		<label for="userNm" class="col-sm-3 control-label">게시글 번호</label>
		<div class="col-sm-9">
			<label class="control-label">${boardvo.post_no }</label>
		</div>
	</div>


	<div class="form-group">
		<label for="userNm" class="col-sm-3 control-label">제목</label>
		<div class="col-sm-9">
			<label class="control-label">${boardvo.post_title }</label>
		</div>
	</div>

	<div class="form-group">
		<label for="userNm" class="col-sm-3 control-label">내용</label>
		<div class="col-sm-9">
			<label class="control-label">${boardvo.post_contents }</label>
		</div>
	</div>


	<div class="form-group">
		<label for="pass" class="col-sm-3 control-label">등록일자</label>
		<div class="col-sm-9">
			<label class="control-label">${boardvo.post_date}</label>
		</div>
	</div>
	&nbsp;<br> &nbsp;<br> &nbsp;<br> &nbsp;<br> &nbsp;<br>
	&nbsp;<br>

	<div class="form-group">
		<c:forEach items="${fileList }" var="filevo">
			<label for="pass" class="col-sm-3 control-label">첨부파일</label>
			<div class="col-sm-9">
				<a
					href="<%=request.getContextPath()%>/board/boardDownload?post_no=${filevo.post_no  }"><label
					class="control-label">${filevo.upload_name}</label></a>
			</div>
		</c:forEach>
	</div>

	&nbsp;<br> &nbsp;<br> &nbsp;<br> &nbsp;<br> &nbsp;<br>
	&nbsp;<br>

	<style>
#test button {
	margin-right: 10px;
}
</style>

	<table>
		<tr id="test">
			<td>
				<button>
					<a
						href="<%=request.getContextPath()%>/board/boardEdit?post_no=${boardvo.post_no  }">수정</a>
				</button>
			</td>
			<td>
				<button>
					<a
						href="<%=request.getContextPath()%>/board/boardDelete?post_no=${boardvo.post_no  }">삭제</a>
				</button>
			</td>
			<td>
				<button>
					<a
						href="<%=request.getContextPath()%>/board/boardDapgle?post_no=${boardvo.post_no  }">답글</a>
				</button>
			</td>
		</tr>
	</table>



	&nbsp;<br> &nbsp;<br> &nbsp;<br> &nbsp;<br> &nbsp;<br>
	&nbsp;<br>




	<form action="${pageContext.request.contextPath }/board/boardDetail"
		method="post">
		<div class="form-group">
			<label for="userNm" class="col-sm-5 control-label">댓글</label>
			<div class="col-sm-10">
				<input type="text" style="width: 1000px; height: 100px;"
					class="form-control" id="comment_contents" name="comment_contents"
					placeholder="댓글을 입력하세요"> <input type="submit" id="frm"
					value="등록"> <input type="hidden" id="post_no"
					name="post_no" value="${boardvo.post_no }" /> <input type="hidden"
					id="userid" name="userid" value="${boardvo.userid }" />
			</div>
		</div>
	</form>



	<table class="table table-striped">
		<thead>
			<tr>
				<th>아이디</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<c:forEach items="${commentvo}" var="commentvo">
			<tr>
				<td>${commentvo.userid }</td>
				<td>${commentvo.commnet_contents }</td>
				<td>${commentvo.comment_date }</td>
				<td><a
					href="${CP }/board/commentdelete?comment_no=${commentvo.comment_no }&
										post_no=${boardvo.post_no }"><button
							type="button">삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>

</form>
</body>
</html>

