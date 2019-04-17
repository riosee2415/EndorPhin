<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>


a {
	color: black !important;
	text-decoration: none;
	outline: none
}

</style>
            
<body>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table class="table table-striped">
                <h2><strong><i class="fas fa-pen-alt"></i>게시글 상세조회</strong></h2>
                <colgroup>
                    <col width='15%' />
                    <col width='*%' />
                </colgroup>
                <tbody>
                    <tr>
                        <td>제목</td>
                        <td colspan='2'><input id="title" type="text" name="title" size="70" maxlength="200" value="${boardInfo.title}" readonly></td>
<%--                         <td>${boardInfo.title}</td> --%>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td><input id="userId" type="text" name="title" size="70" maxlength="200" value="${boardInfo.userId}" readonly></td>
                        <td>작성일 : <input id="userId" type="text" name="title" size="30" maxlength="200" value="${boardInfo.postDate}" readonly></td>
<%--                         <td>${boardInfo.userId}</td> --%>
                    </tr>
                    <tr>
                        <td>내용</td>
                         <td colspan='2'><textarea id="contents" name="contents" rows="10" cols="80" readonly>${boardInfo.contents}</textarea></td>
<%--                         <td colspan='2'>${boardInfo.contents}</td> --%>
                    </tr>
                    <tr>
                    	<td>첨부파일</td>
                    	<td>
                    		<c:forEach items="${listview }" var="listview" varStatus="status">
								<a href="/download?attachCode=${listview.attachCode }">${listview.attachName }</a>
							</c:forEach>
                    	</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <a href="#" onclick="history.back(-1)"><button class="bttn-jelly bttn-warning">돌아가기</button></a>
            <a href="boardDelete?boardNo=${boardInfo.boardNo}&boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">삭제</button></a>
            <a href="boardForm?boardNo=${boardInfo.boardNo}&boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">수정</button></a>
            <p>&nbsp;</p>
            <div style="border: 1px solid; width: 600px; padding: 5px">
                <form name="form" action="boardReplySave" method="post">
                    <input type="hidden" name="boardNo" value="${boardInfo.boardNo}">
                    작성자: <input type="text" id="commentUser" name="commentUser" size="20" maxlength="20"> <br />
                    <textarea  id="commentContents" name="commentContents" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
                    <a href="#" onclick="fn_formSubmit()"><button class="bttn-jelly bttn-warning">저장</button></a>
                    <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
                </form>
            </div>
            <c:forEach var="replylist" items="${replylist}" varStatus="status">
                <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;">
                    <c:out value="${replylist.commentUser}" />
                    <fmt:formatDate value="${replylist.commentDate}" pattern="yyyy-MM-dd HH:mm:ss" />
                    <a href="#" onclick="fn_replyDelete('<c:out value=" ${replylist.commentNo}" />')">삭제</a>
                    <a href="#" onclick="fn_replyUpdate('<c:out value=" ${replylist.commentNo}" />')">수정</a>
                    <br />
                    <div id="reply<c:out value=" ${replylist.commentNo}" />">
                    <c:out value="${replylist.commentContents}" />
                </div>
        </div>
        </c:forEach>

        <div id="replyDiv" style="width: 99%; display:none">
            <form name="form2" action="boardReplySave" method="post">
                <input type="hidden" name="boardNo" value="<c:out value=" ${boardInfo.boardNo}" />">
                <input type="hidden" name="commentNo">
                <textarea name="commentContents" rows="3" cols="60" maxlength="500"></textarea>
                <a href="#" onclick="fn_replyUpdateSave()">저장</a>
                <a href="#" onclick="fn_replyUpdateCancel()">취소</a>
                <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
            </form>
        </div>
    </div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
    function fn_formSubmit() {
        var form = document.form;

        if ($("#commentUser").val().trim() == "") {
            alert("작성자를 입력해주세요.");
            $("#commentUser").focus();
            return false;
        }
        
        if ($("#commentContents").val().trim() == "") {
            alert("내용을 입력해주세요.");
            $("#commentContents").focus();
            return false;
        }

        form.submit();
    }

    function fn_replyDelete(commentNo) {
        if (!confirm("삭제하시겠습니까?")) {
            return;
        }
        var form = document.form2;
        form.action = "boardReplyDelete";
        form.commentNo.value = commentNo;
        form.submit();
    }
    var updatecommentNo = updatecommentContents = null;

    function fn_replyUpdate(commentNo) {
        var form = document.form2;
        var reply = document.getElementById("reply" + commentNo);
        var replyDiv = document.getElementById("replyDiv");
        replyDiv.style.display = "";

        if (updatecommentNo) {
            document.body.appendChild(replyDiv);
            var oldReno = document.getElementById("reply" + updatecommentNo);
            oldReno.innerText = updatecommentContents;
        }

        form.commentNo.value = commentNo;
        form.commentContents.value = reply.innerText;
        reply.innerText = "";
        reply.appendChild(replyDiv);
        updatecommentNo = commentNo;
        updatecommentContents = form.commentContents.value;
        form.contents.focus();
    }

    function fn_replyUpdateSave() {
        var form = document.form2;
        if (form.commentContents.value == "") {
            alert("글 내용을 입력해주세요.");
            form.commentContents.focus();
            return;
        }

        form.action = "boardReplySave";
        form.submit();
    }

    function fn_replyUpdateCancel() {
        var form = document.form2;
        var replyDiv = document.getElementById("replyDiv");
        document.body.appendChild(replyDiv);
        replyDiv.style.display = "none";

        var oldcommentNo = document.getElementById("reply" + updatecommentContents);
        oldReno.innerText = updatecommentContents;
        updatecommentContents = updatecommentContents = null;
    }

</script>
