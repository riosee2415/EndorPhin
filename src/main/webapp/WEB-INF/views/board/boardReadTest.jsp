<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>board1</title>
</head>

<body>
    <table class="table table-striped">
        <h2><strong><i class="fas fa-pen-alt"></i>게시글 상세조회</strong></h2>
        <colgroup>
            <col width='15%' />
            <col width='*%' />
        </colgroup>
        <tbody>
            <tr>
                <td>작성자</td>
                <td>${boardInfo.userId}</td>
            </tr>
            <tr>
                <td>제목</td>
                <td>${boardInfo.title}</td>
            </tr>
            <tr>
                <td>내용</td>
                <td>${boardInfo.contents}</td>
            </tr>
        </tbody>
    </table>
    <br>
    <a href="#" onclick="history.back(-1)"><button class="bttn-jelly bttn-warning">돌아가기</button></a>
    <a href="boardDelete?boardNo=${boardInfo.boardNo}&boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">삭제</button></a>
    <a href="boardForm?boardNo=${boardInfo.boardNo}&boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">저장</button></a>
    <p>&nbsp;</p>
    <div style="border: 1px solid; width: 600px; padding: 5px">
        <form name="form" action="boardReplySave" method="post">
            <input type="hidden" name="boardNo" value="${boardInfo.boardNo}">
            작성자: <input type="text" name="commentUser" size="20" maxlength="20"> <br />
            <textarea name="commentContents" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
            <a href="#" onclick="fn_formSubmit()"><button class="bttn-jelly bttn-warning">저장</button></a>
            <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
        </form>
    </div>
    <c:forEach var="replylist" items="${replylist}" varStatus="status">
        <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;">
            <c:out value="${replylist.commentUser}"/>
            	<fmt:formatDate value="${replylist.commentDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
            <textarea name="rememo" rows="3" cols="60" maxlength="500"></textarea>
            <a href="#" onclick="fn_replyUpdateSave()">저장</a>
            <a href="#" onclick="fn_replyUpdateCancel()">취소</a>
        </form>
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
        //사용자 이름
        if ($("#commentContents").val().trim() == "") {
            alert("내용을 입력해주세요.");
            $("#commentContents").focus();
            return false;
        }

        form.submit();
    }
    function fn_replyDelete(commentNo){
    	if (!confirm("삭제하시겠습니까?")) {
    		return;
    	}
    	var form = document.form2;
    	form.action="boardReplyDelete";
    	form.commentNo.value=commentNo;
    	form.submit();	
    } 

</script>

</html>
