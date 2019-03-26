<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
	<h2>계정과목 관리</h2>
<hr>

<div class="table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>계정과목코드</th>
				<th>계정과목명(한글)</th>
				<th>계정과목명(영어)</th>
				<th>계정과목유형</th>
			</tr>
		</thead>
		<tbody id="establishListTbody">
		</tbody>
	</table>




	<c:set var="lastPage"
		value="${Integer(establishCnt/pageSize + (establishCnt%pageSize > 0 ? 1 : 0))}" />

	<nav style="text-align: center;">
		<ul id="pagination" class="pagination">
		</ul>
	</nav>
</div>

<form action="" method="get">
	<button type="submit" class="btn btn-default">계정과목 등록</button>
</form>





<script>


	$("document").ready(function() {

		getEstablishListHtml(1);

	});
	
	
	
	function getEstablishPageList(page){
		$.ajax({
			url : "${pageContext.request.contextPath }/getEstablishPageList",
			data : "page=" + page,
			success : function(data){
				
				var htmlArr = data
				.split("================seperator================");

				$("#establishListTbody").html(htmlArr[0]);
				$("#pagination").html(htmlArr[1]);
				
			}
		});
		
	}
		

	function getEstablishListHtml(page) {

		$.ajax({
			url : "${pageContext.request.contextPath }/establishAjaxHtml",
			data : "page=" + page,
			success : function(data) {

				var htmlArr = data
						.split("================seperator================");

				$("#establishListTbody").html(htmlArr[0]);
				$("#pagination").html(htmlArr[1]);

			}

		});

	}
</script>
