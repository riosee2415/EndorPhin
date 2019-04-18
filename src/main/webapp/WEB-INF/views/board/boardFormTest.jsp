<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<body>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <c:set var="boardNo" value="${boardInfo.boardNo}" />
            <form name="form" action="boardSave" method="post" enctype="multipart/form-data">
                <table class="table table-striped">
                    <c:choose>
                        <c:when test="${boardNo eq null}">
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
<!--                                         <tr> -->
<!--                                             <td>작성자</td>  -->
<%--                                             <td><input type="text" id="userId" name="userId" size="20" maxlength="20" value="${boardInfo.userId}"></td>  --%>
<!--                                         </tr> -->
                        <tr>
                            <td>제목</td>
                            <td><input id="title" type="text" name="title" size="70" maxlength="250" value="${boardInfo.title}"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea id="contents" name="contents" rows="10" cols="80">${boardInfo.contents}</textarea></td>
                        </tr>
                        <tr>
                            <td>첨부파일</td>
                            <td>
                                <c:forEach var="listview" items="${listview}" varStatus="attachCnt">
                                    <input type="checkbox" name="attachCode" value="${listview.attachCode}">
                                    <a href="download?attachCode=${listview.attachCode }">${listview.attachName }</a>
                                </c:forEach>

                                <input type="file" name="attachFile" multiple="" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                
<!--                 <div id="fileDiv"> -->
<!--                 	<p> -->
<!--                 		<input type="file" id="file" name="file_0"><a href="#this" class="btn" id="delete" name="delete">삭제</a> -->
<!--                 	</p> -->
<!--                 </div> -->
                <br>
<!--                 <a href="#this" class="btn" id="addFile">파일 추가</a> -->
                <a href="#" onclick="fn_formSubmit()"><button class="bttn-jelly bttn-warning">저장</button></a>
                <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
                <input type="hidden" name="boardNo" value="${boardInfo.boardNo}">
            </form>
        </div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
    function fn_formSubmit() {
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
        if ($("#title").val().trim() == "") {
            alert("글 제목을 입력해주세요.");
            $("#title").focus();
            return false;
        }
        //사용자 이름
        if ($("#contents").val().trim() == "") {
            alert("글 내용을 입력해주세요.");
            $("#contents").focus();
            return false;
        }

        form.submit();
    }
    
//     var gfv_count = 1;
//     $("#addFile").on("click", function(e){ //파일 추가 버튼
//     	e.preventDefault();
//     	if(gfv_count < 5){
//     	fn_addFile();
//     	}else{
//     		alert("더이상 추가할수 없습니다.");	
//     	}
//     });
    

//     function fn_addFile(){ 
//     	var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
    	
//     	$("#fileDiv").append(str);
//     	$("a[name='delete']").on("click", function(e){ //삭제 버튼 
//     		e.preventDefault();
//     		fn_deleteFile($(this));
//     	});
//     }
    
//     function fn_deleteFile(obj){
//     	obj.parent().remove();
//     }


</script>
