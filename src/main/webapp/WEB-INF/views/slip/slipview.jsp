<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <h2>전표 관리</h2>
    <hr>
    
    <div>
		날짜 : <input id="sArea" name="sArea" type="text" />&nbsp;
			<input id="sBtn" name="sBtn"  class="btn btn-primary" type="button" value="검색" />
			<input id="aBtn" name="aBtn"  class="btn btn-primary" type="button" value="전체조회" />
			<br />
	</div><p />
	
	<div style="text-align: right;">
		<input type="button" class="btn btn-primary" id="insertSlipBtn" name="insertSlipBtn" value="전표작성하기" />
	</div>
	
	<div id="insertArea">
		
	</div>
	
	

	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<td><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></td>
					<th>전표번호</th>
					<th>분개금액</th>
					<th>작성일</th>
					<th>사용부서</th>
					<th>메모</th>
					<th>승인여부</th>
				</tr>
			</thead>
			<tbody id="establishListTbody">
			</tbody>
		</table>
	    
	    <c:set var="lastPage"
		value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

	<nav style="text-align: center;">
		<ul id="pagination" class="pagination">
		</ul>
	</nav>
</div>





<script>

	$("document").ready(function(){
		getSlipPageList(1);
	});
	
	function getSlipPageList(page){
		$.ajax({
			url : "${pageContext.request.contextPath }/getSlipPageList",
			data : "page=" + page,
			success : function(data){
				
				var htmlArr = data
				.split("================seperator================");
	
				$("#establishListTbody").html(htmlArr[0]);
				$("#pagination").html(htmlArr[1]);
				
			}
		});
	}
	
	var insertFlag = 0;
	$("#insertSlipBtn").on("click", function(){
		
		if(insertFlag === 0){
			$.ajax({
				url : "${pageContext.request.contextPath }/getSlipInsertBtn",
				success : function(data){
					console.log(data);
					$("#insertArea").html(data);
				}
				
			});
			
			insertFlag = 1;
		} else if(insertFlag === 1) {
			$("#insertArea").html("");
			
			insertFlag = 0;
			
		}
	});
	
		


</script>