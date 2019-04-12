<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 사원 정보 수정하기  -->










<div class="modal fade" id="myLargeModalEdit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">큰 Modal 제목</h4>
      </div>
				<form action="${cp}/employee/updateEmployee_POST" method="post">
			<div class="modal-body">



					<div class="container-fluid">
						<div class="row">
							
							
							<div class="col-md-2">
							<img class="img-fluid" id="userimage" >
							<input type="file" name="fileEdit" value="사진변경">
							</div>
							
							
							<div class="col-md-6">
							<table >
								<tr style="padding-left: 10px">
								<td>
							<span>사원번호</span></td> <td><input type="text"
							class="form-control" id="userIde" name="userId"
							placeholder="사원번호를 입력해 주세요" readonly>
							</td>
							<td>
							<span>사원명</span></td> <td><input type="text"
								class="form-control" name="userNm" id="userNme"
								placeholder="사원명을 입력해주세요">
								</td>
								</tr>
							</table>
							
							</div>
						</div>
							
							
							
							
							
							
							
							
							
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-6">
							<table>
							<tr>
									<td><label for="inputPassword">부서명</label></td>
									<td><select id="deptCodee" name="deptCode"
										class="form-control">
											<option value="100">인사</option>
											<option value="200">회계</option>
											<option value="300">물류</option>
									</select></td>

									<td><label for="inputPassword">직책명</label></td>
									<td><select id="positionCodee" name="positionCode"
										class="form-control">
											<option value="60">사장</option>
											<option value="50">부사장</option>
											<option value="40">본부장</option>
											<option value="30">팀장</option>
											<option value="10">파트장</option>
											<option value="10">팀원</option>
									</select></td>

									<td><label for="inputPassword">직급명</label></td>
									<td><select id="rankCodee" name="rankCode"
										class="form-control">
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
						</div>
					
					
					
					<div class="row">
							<div class="col-md-6">
							<span>비밀번호</span> <input type="password"
								class="form-control" id="inputPassworde" name="password"
								placeholder="비밀번호를 입력해주세요">
							</div>
					</div>
					
					<div class="row">
							<div class="col-md-6">
							<span>비밀번호 확인</span> <input
								type="password" class="form-control" id="inputPasswordChecke"
								placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
							</div>
					</div>
					
					<div class="row">
							<div class="col-md-6">
							
							<span>비고</span> <input type="text"
								class="form-control" id="relatee" name="relate"
								placeholder="특이사항란">
							</div>
					</div>
					
					
					<div class="row">
							<div class="col-md-6">
							<span>생년월일</span> <input type="text"
								class="form-control" id="BirthDatee" name="BirthDate"
								placeholder="생년월일을 입력하세요">
							</div>
					</div>
					
					
					</div>


						
						
			</div>
						
						<div class="modal-footer">
							<button type="submit" class="btn btn-default">수정</button>
				</form>



				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>