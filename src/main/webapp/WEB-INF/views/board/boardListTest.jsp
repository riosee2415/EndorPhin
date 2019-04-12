<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(function() {
    $("#startDate").datepicker(   // inputbox 의 id 가 startDate 이겠죠.
            {dateFormat:'yy-mm-dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
             , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"  // 우측 달력 icon 의 이미지 패스 
             , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
             , changeMonth: true // 월선택 select box 표시 (기본은 false)
             ,changeYear: true  // 년선택 selectbox 표시 (기본은 false)
             ,showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
           });

    $("#endDate").datepicker({dateFormat:'yy-mm-dd'
            , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", buttonImageOnly: true
            , changeMonth: true,changeYear: true,showButtonPanel: true});
    
    
  //초기값을 오늘 날짜로 설정
    $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
    $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  

});
</script>
<style>
/* 글 숨기 */
.target { display: inline-block;
		  width: 100px; white-space: nowrap;
		  overflow: hidden; text-overflow: ellipsis;
	 }

</style>
<body>
<div class="form-group">
	<h2><strong><i class="fas fa-pen-alt"></i>게시판</strong></h2>
</div>
<form action="${cp}/boardList?boardTypeCode=${boardTypeCode}" method="post">
			<table class="table table-striped">
				<thead class="thead">
					<tr>
						<td><input style="color: black" type="text" id="startDate" class="search-query form-control"
							name="startDate" class="startDate" /></td>
						<td><h4>
								<strong> ~ </strong>
							</h4></td>
						<td><input style="color: black" type="text" id="endDate" class="search-query form-control" 
							name="endDate" class="startDate"/></td>
						<td>
							<select name="searchType">
								<option value="title" <c:out value="${map.searchType == 'title' ? 'selected' : '' }"/>>제목</option>   
								<option value="contents" <c:out value="${map.searchType == 'contents' ? 'selected' : '' }"/>>내용</option>    
								<option value="userId" <c:out value="${map.searchType == 'userId' ? 'selected' : '' }"/>>작성자</option>
							</select>
						</td>
						<td><input type="text" name="keyword" style="color: black" class="form-control" placeholder="Search">
						<td>
							<button type="submit" style="background-color: #6E6867;" class="btn btn-info">검색</button>
						</td>
					</tr>
				</thead>
			</table>
	        	<input type="hidden" name="keyword" value="map.keyword" > 
		</form>
                    
<table class="table table-striped">
    <colgroup>
        <col width='8%' />
        <col width='*%' />
        <col width='15%' />
        <col width='15%' />
    </colgroup>
    <thead class="thead">
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
<a href="boardForm"><button type="button" class="bttn-jelly bttn-md bttn-warning">글쓰기</button></a>
</body>
</html>
