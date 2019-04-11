<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board</title>
</head>
<body>
	<c:set var="boardNo" value="${boardInfo.boardNo}"/>
    <form name="form" action="boardSave" method="post">
        <table class="table table-striped">
        <c:choose>
         <c:when test = "${boardNo eq null}">
            <h2><strong><i class="fas fa-pen-alt"></i>게시글 등록</strong></h2>
         </c:when>
          <c:otherwise>
            <h2><strong><i class="fas fa-pen-alt"></i>게시글 수정</strong></h2>
         </c:otherwise>
        </c:choose>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
<!--                 <tr> -->
<!--                     <td>작성자</td>  -->
<%--                     <td><input type="text" id="userId" name="userId" size="20" maxlength="20" value="${boardInfo.userId}"></td>  --%>
<!--                 </tr> -->
                <tr>
                    <td>제목</td> 
                    <td><input id="title" type="text" name="title" size="70" maxlength="250" value="${boardInfo.title}"></td> 
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea id="contents" name="contents" rows="10" cols="80">${boardInfo.contents}</textarea></td> 
                </tr>
            </tbody>
        </table>    
        <br>
        <a href="#" onclick="fn_formSubmit()"><button class="bttn-jelly bttn-warning">저장</button></a>
        <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
        <input type="hidden" name="boardNo" value="${boardInfo.boardNo}"> 
    </form>    
</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
function fn_formSubmit(){
    var form = document.form;
    
//     if (form.title.value=="") {
//         alert("글 제목을 입력해주세요.");
//         form.title.focus();
//         return;
//     }
//     if (form.contents.value=="") {
//         alert("글 내용을 입력해주세요.");
//         form.contents.focus();
//         return;
//     }
    
    // 게시글 
    if($("#title").val().trim() == ""){
    	 alert("글 제목을 입력해주세요.");
		$("#title").focus();
		return false;
	}			
	//사용자 이름
	if($("#contents").val().trim() == ""){
		alert("글 내용을 입력해주세요.");
		$("#contents").focus();
		return false;
	}			
    
    form.submit();    
} 
</script>
</html>
