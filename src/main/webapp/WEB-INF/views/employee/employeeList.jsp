<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

<style>

.form-horizontal{
width : 100%;

}
.thead{
color : white;
background-color: #6E6867;
}
</style>



</head>
<body>
<form class="form-horizontal">
<div class="form-group">
<h2><strong>사원목록</strong></h2>
</div>

	<div class="form-group">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th>선택</th>
					<th>사원번호</th>
					<th>사원명</th>
					<th>부서코드</th>
					<th>직책코드</th>
					<th>직급코드</th>
					<th>근속년수</th>
					<th>비고</th>
					<th>입사일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allEmployee}" var="allEmployee">
					<tr class="boardTr" data-userId="${allEmployee.userId}">
						<td><input type="checkbox" name="check"
							value="${allEmployee.userId}" style="width: 30px; height: 30px;"></td>
						<td>${allEmployee.userId }</td>
						<td>${allEmployee.userNm }</td>
						<td>${allEmployee.deptCode }</td>
						<td>${allEmployee.positionCode }</td>
						<td>${allEmployee.rankCode }</td>
						<td>${allEmployee.continuousYear }</td>
						<td>${allEmployee.relate }</td>
						<td>${allEmployee.joinCompany }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</form>


<div class="form-group">
	<button type="button" class="btn btn-info btn-lg" id="cancleBtn"> 삭 제 </button>
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#my80sizeModal">
  신규등록
</button>

</div>
	
	<!-- 80% size Modal -->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel">
  <div class="modal-dialog modal-80size" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header"><h2>신규 사원 등록</h2>
      </div>
      <div class="modal-body">
        <div class="form-group">
						<form action="${cp}/employee/insertEmployee" method="post">
							<label for="inputName">사원번호</label> <input type="text"
								class="form-control" name="userId" placeholder="사원번호를 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="InputEmail">사원명</label> <input type="text"
							class="form-control" name="userNm" placeholder="사원명을 입력해주세요">
					</div>
					
					
					<div class="form-group">
						<table>
							<tr>
								<td><label for="inputPassword">부서코드</label></td>
								<td><select name="deptCode" class="form-control">
										<option value="10">인사</option>
										<option value="20">회계</option>
										<option value="30">물류</option>
								</select></td>
							
								<td><label for="inputPassword">직책코드</label></td>
								<td><select name="positionCode" class="form-control">
										<option value="5">사장</option>
										<option value="4">부사장</option>
										<option value="3">본부장</option>
										<option value="2">팀장</option>
										<option value="1">팀원</option>
								</select></td>
							
								<td><label for="inputPassword">직급코드</label></td>
								<td><select name="rankCode" class="form-control">
										<option value="9">사장</option>
										<option value="8">전무</option>
										<option value="7">상무</option>
										<option value="6">이사</option>
										<option value="5">부장</option>
										<option value="4">차장</option>
										<option value="3">과장</option>
										<option value="2">대리</option>
										<option value="1">사원</option>
								</select></td>
							</tr>
							</table>
						</div>
						

					<div class="form-group">
						<label for="inputPassword">비밀번호</label> <input type="password"
							class="form-control" id="inputPassword" name="password"
							placeholder="비밀번호를 입력해주세요">
					</div>
					<div class="form-group">
						<label for="inputPasswordCheck">비밀번호 확인</label> <input
							type="password" class="form-control" id="inputPasswordCheck"
							placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
					</div>
					
					<div class="form-group">
						<label for="inputMobile">비고</label> <input type="text"
							class="form-control" id="inputMobile" name="relate"
							placeholder="특이사항란">
					</div>
					<div class="form-group">
						<label for="inputtelNO">생년월일</label> <input type="text"
							class="form-control" id="inputtelNO" name="BirthDate" placeholder="생년월일을 입력하세요">
					</div>
      </div>
      <div class="modal-footer">
      <button type="submit" class="btn btn-default">등록</button>
					</form>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>











	<script>
		//문서로딩이 완료된 이후 이벤트 등록

		$(document).ready(function() {
			
			 //server side 에서 비교
			<c:if test="${msg != null}">
			alert("${msg}");
			</c:if> 
			
			
			//사용자 tr 태그 클릭시 이벤트 핸들러
			$("#cancleBtn").click(function() {

				$('input:checkbox[name="check"]:checked').each(function() {

	
				var delete_no = $(this).val();
				$("#delete_no").val(delete_no);
				$("#frm1").submit();
				
				});

			});
			
			$(".boardTr").click(function() {



				var userId = $(this).data("userId");


				//2 form
				$("#userId").val(userId);
				$("#frm2").submit();

			});
			
			
			
			
			
			
			
			
			

	
			

		});
	</script>

	<form id="frm1" action="${cp}/employee/deleteEmployee" method="get">
		<input type="hidden" id="delete_no" name="delete_no" />
	</form>

	<form id="frm2" action="${cp}/employee/detailEmployee" method="get">
		<input type="hidden" id="userId" name="userId" />
	</form> 



</body>