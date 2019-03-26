<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
	<h2>계정과목 관리</h2>
	<hr>

	<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>사용자 아이디</th>
								<th>사용자 이름</th>
								<th>별명</th>
								<th>등록일시</th>
							</tr>
						</thead>
							<tbody id="establishListTbody">
						</tbody>
					</table>
					
					<form action="" method="get">
						<button type="submit" class="btn btn-default">계정과목 등록</button>
					</form>
					
					    
					
				<c:set var="lastPage" value="${Integer(establishCnt/pageSize + (establishCnt%pageSize > 0 ? 1 : 0))}"/>
					
					<nav style="text-align:center;">
						<ul id="pagination" class="pagination">
						</ul>
					</nav>
				</div>




	<script>
	
	function makePagenation(establishCnt, pageSize, page){
		var lastPage = parseInt(establishCnt/pageSize) + (establishCnt%pageSize > 0 ? 1 : 0);

		var html = "";
		
		if(page == 1) {
			html += "<li class='disabled'>";
			html += "	<a aria-label='Previous'>";
			html += "		<span aria-hidden='true'>&laquo;</span>";
			html += " 	</a>";
			html += "</li>";
		} else {
			html += "<li>";
			html += "	<a href='javascript:getUserPageList(1);' aria-label='Previous'>";
			html += "		<span aria-hidden='true'>&laquo;</span>";
			html += "	</a>";
			html += "</li>";
		}
		
		for(var i = 1; i <= lastPage; i++){
			var active = "";
			if(i == page){
				active = "active";
			}
			html += "<li class='" + active + "'>";
			html += "	<a href='javascript:getUserPageList(" + i + ");'>" + i + "</a>";
			html += "</li>";
		}		
		
		
		
		if(page == lastPage){
			html += "<li class='disabled'>";
			html += "	<a aria-label='Next'>";
			html += "		<span aria-hidden='true'>&raquo;</span>";
			html += "	</a>";
			html += "</li>";
		} else {
			html += "<li>";
			html += "	<a href='javascript:getUserPageList(" + lastPage + ");'>" ;
			html += "		<span aria-hidden='true'>&raquo;</span>";
			html += "	</a>";
			html += "</li>";
			
		}
		
		$("#pagination").html(html);
		
		
		
	}
	
	
	</script>
