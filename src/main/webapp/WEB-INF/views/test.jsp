<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<div class="form-group">
	<button type="button" class="btn btn-info btn-lg" id="cancleBtn"> 삭 제 </button>
	<button type="button" class="btn btn-info btn-lg"" data-toggle="modal" data-target="#my80sizeModal">
  신규등록
</button>

</div>
	
	<!-- 80% size Modal -->
<div class="modal fade" id="my80sizeModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel">
  <div class="modal-dialog modal-80size" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">조금 부족한 Modal</h4>
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
