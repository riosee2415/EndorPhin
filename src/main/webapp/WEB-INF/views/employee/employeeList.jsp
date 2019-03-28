<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<style>
.form-horizontal {
	width: 100%;
}

.thead {
	color: white;
	background-color: #6E6867;
}

.tbody {
	color: white;
}

.form-group {
	width: auto;
}

a:hover, a:focus {
	text-decoration: none;
	outline: none;
}

.tab .nav-tabs {
	border: none;
	border-bottom: 2px solid #079fc9;
	margin: 0;
}

.tab .nav-tabs li a {
	padding: 10px 20px;
	margin: 0 10px -1px 0;
	font-size: 17px;
	font-weight: 600;
	color: #293241;
	text-transform: uppercase;
	border: 2px solid #e6e5e1;
	border-bottom: none;
	border-radius: 5px 5px 0 0;
	z-index: 1;
	position: relative;
	transition: all 0.3s ease 0s;
}

.tab .nav-tabs li a:hover, .tab .nav-tabs li.active a {
	background: #fff;
	color: #079fc9;
	border: 2px solid #079fc9;
	border-bottom-color: transparent;
}

.tab .nav-tabs li a:before {
	content: "";
	display: block;
	height: 2px;
	background: #fff;
	position: absolute;
	bottom: -2px;
	left: 0;
	right: 0;
	transform: scaleX(0);
	transition: all 0.3s ease-in-out 0s;
}

.tab .nav-tabs li.active a:before, .tab .nav-tabs li a:hover:before {
	transform: scaleX(1);
}

.tab .tab-content {
	padding: 10px;
	font-size: 17px;
	color: white;
	line-height: 30px;
	letter-spacing: 1px;
	position: relative;
}

@media only screen and (max-width: 479px) {
	.tab .nav-tabs {
		border: none;
	}
	.tab .nav-tabs li {
		width: 100%;
		text-align: center;
		margin-bottom: 15px;
	}
	.tab .nav-tabs li a {
		margin: 0;
		border-bottom: 2px solid transparent;
	}
	.tab .nav-tabs li a:before {
		content: "";
		width: 100%;
		height: 2px;
		background: #079fc9;
		position: absolute;
		bottom: -2px;
		left: 0;
	}
}

.table {
	border-width: 3px;
	border-style: inset;
	border-color: black;
}

.btnform {
	size: 5em;
	color: white;
	background-color: #6E6867;
	border-width: 3px;
	border-style: inset;
	border-color: black;
}
</style>


</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12" style="width: 100%">
				<div class="tab" role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a id="frmTap"
							href="#Section1" aria-controls="home" role="tab"
							data-toggle="tab">사원 목록</a></li>
						<li role="presentation"><a href="#Section2"
							aria-controls="profile" role="tab" data-toggle="tab"> 인 사 </a></li>
						<li role="presentation"><a href="#Section3"
							aria-controls="messages" role="tab" data-toggle="tab"> 회 계 </a></li>
						<li role="presentation"><a href="#Section4"
							aria-controls="messages" role="tab" data-toggle="tab"> 물 류 </a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content tabs">
						<div role="tabpanel" class="tab-pane fade in active" id="Section1">
							<p>
							<form class="form-horizontal">
								<div class="form-group">
									<h2>
										<strong>사원목록</strong>
									</h2>
								</div>

								<div class="form-group">
									<table class="table table-striped">
										<thead class="thead">
											<tr>
												<th>선택</th>
												<th>사원번호</th>
												<th>사원명</th>
												<th>부서명</th>
												<th>직책명</th>
												<th>직급명</th>
												<th>근속년수</th>
												<th>비고</th>
												<th>입사일</th>
												<th>생년월일</th>
											</tr>
										</thead>

										<tbody class="tbody">
											<c:forEach items="${allEmployee}" var="allEmployee">
												<tr class="boardTr" data-userId="${allEmployee.userId}">
													<td><input type="checkbox" name="check"
														value="${allEmployee.userId}"
														style="width: 30px; height: 30px;"></td>

													<td><button type="button" class="btn btn-default"
															data-toggle="modal" data-target="#my80sizeModal2">
															<u>${allEmployee.userId }</u>
														</button></td>

													<td>${allEmployee.userNm }</td>
													<td>${allEmployee.deptname }</td>
													<td>${allEmployee.positionname }</td>
													<td>${allEmployee.rankname }</td>
													<td>${allEmployee.continuousYear }</td>
													<td>${allEmployee.relate }</td>
													<td>${allEmployee.joinCompany }</td>
													<td>${allEmployee.birthDate }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</form>


							<div class="form-group">
								<button type="button" class="btnform" id="cancleBtn">삭
									제</button>
								<button type="button" class="btnform" data-toggle="modal"
									data-target="#my80sizeModal">신규등록</button>

							</div>


								<!-- 80% size Modal -->
							<div class="modal fade" id="my80sizeModal" tabindex="-1"
								role="dialog" aria-labelledby="my80sizeModalLabel">
								<div class="modal-dialog modal-80size" role="document">
									<div class="modal-content modal-80size">
										<div class="modal-header">
											<h2>신규 사원 등록</h2>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<form action="${cp}/employee/insertEmployee" method="post"
													enctype="multipart/form-data">
													<label for="inputName">사원번호</label> <input type="text"
														class="form-control" id="userId" name="userId"
														placeholder="사원번호를 입력해 주세요"> <input type="button"
														id="emplCheck" name="emplCheck" value="중복체크" /> <span
														id="duplicate"></span>
											</div>
											<div class="form-group">
												<label for="InputEmail">사원명</label> <input type="text"
													class="form-control" name="userNm"
													placeholder="사원명을 입력해주세요">
											</div>


											<div class="form-group">
												<table>
													<tr>
														<td><label for="inputPassword">부서코드</label></td>
														<td><select name="deptCode" class="form-control">
																<option value="100">인사</option>
																<option value="200">회계</option>
																<option value="300">물류</option>
														</select></td>

														<td><label for="inputPassword">직책코드</label></td>
														<td><select name="positionCode" class="form-control">
																<option value="60">사장</option>
																<option value="50">부사장</option>
																<option value="40">본부장</option>
																<option value="30">팀장</option>
																<option value="10">파트장</option>
																<option value="10">팀원</option>
														</select></td>

														<td><label for="inputPassword">직급코드</label></td>
														<td><select name="rankCode" class="form-control">
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
												<label for="inputPassword">비밀번호</label> <input
													type="password" class="form-control" id="inputPassword"
													name="password" placeholder="비밀번호를 입력해주세요">
											</div>
											<div class="form-group">
												<label for="inputPasswordCheck">비밀번호 확인</label> <input
													type="password" class="form-control"
													id="inputPasswordCheck"
													placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
											</div>

											<div class="form-group">
												<label for="inputMobile">비고</label> <input type="text"
													class="form-control" id="inputMobile" name="relate"
													placeholder="특이사항란">
											</div>
											<div class="form-group">
												<label for="inputtelNO">생년월일</label> <input type="text"
													class="form-control" id="inputtelNO" name="BirthDate"
													placeholder="생년월일을 입력하세요">
											</div>
											<div class="form-group">
												<label for="inputtelNO">사진첨부</label>
												<button>
													<input type="file" class="form-control" name="realFilename">
												</button>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-default">등록</button>
											</form>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 직급 모달창 수정하기  -->
                        
                        
                      	<!-- 80% size Modal -->
							<div class="modal fade" id="my80sizeModal2" tabindex="-1"
								role="dialog" aria-labelledby="my80sizeModalLabel">
								<div class="modal-dialog modal-80size" role="document">
									<div class="modal-content modal-80size">
										<div class="modal-header">
											<h2>신규 사원 등록</h2>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<form action="${cp}/employee/insertEmployee" method="post"
													enctype="multipart/form-data">
													<label for="inputName">사원번호</label> <input type="text"
														class="form-control" id="userId" name="userId"
														placeholder="사원번호를 입력해 주세요"> <input type="button"
														id="emplCheck" name="emplCheck" value="중복체크" /> <span
														id="duplicate"></span>
											</div>
											<div class="form-group">
												<label for="InputEmail">사원명</label> <input type="text"
													class="form-control" name="userNm"
													placeholder="사원명을 입력해주세요">
											</div>


											<div class="form-group">
												<table>
													<tr>
														<td><label for="inputPassword">부서코드</label></td>
														<td><select name="deptCode" class="form-control">
																<option value="100">인사</option>
																<option value="200">회계</option>
																<option value="300">물류</option>
														</select></td>

														<td><label for="inputPassword">직책코드</label></td>
														<td><select name="positionCode" class="form-control">
																<option value="60">사장</option>
																<option value="50">부사장</option>
																<option value="40">본부장</option>
																<option value="30">팀장</option>
																<option value="10">파트장</option>
																<option value="10">팀원</option>
														</select></td>

														<td><label for="inputPassword">직급코드</label></td>
														<td><select name="rankCode" class="form-control">
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
												<label for="inputPassword">비밀번호</label> <input
													type="password" class="form-control" id="inputPassword"
													name="password" placeholder="비밀번호를 입력해주세요">
											</div>
											<div class="form-group">
												<label for="inputPasswordCheck">비밀번호 확인</label> <input
													type="password" class="form-control"
													id="inputPasswordCheck"
													placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
											</div>

											<div class="form-group">
												<label for="inputMobile">비고</label> <input type="text"
													class="form-control" id="inputMobile" name="relate"
													placeholder="특이사항란">
											</div>
											<div class="form-group">
												<label for="inputtelNO">생년월일</label> <input type="text"
													class="form-control" id="inputtelNO" name="BirthDate"
													placeholder="생년월일을 입력하세요">
											</div>
											<div class="form-group">
												<label for="inputtelNO">사진첨부</label>
												<button>
													<input type="file" class="form-control" name="realFilename">
												</button>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-default">등록</button>
											</form>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
<!-- 직급 모달창 수정하기  -->
							</p>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="Section3">
							<p>
								<!-- 직책시작 -->
							<form class="form-horizontal">
								<div class="form-group">
									<h2>
										<strong>직책 목록</strong>
									</h2>
								</div>

								<div class="form-group">
									<table class="table table-striped">
										<thead class="thead">
											<tr>
												<th>선택</th>
												<th>직급/직책코드</th>
												<th>직급/직책코드명</th>
												<th>순위</th>
												<th>사용여부</th>
												<th>비고</th>
												<th>직급/직책 분류</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${allPosition}" var="allPosition">
												<c:if test="${allPosition.positionStatus == '직책' }">
													<tr class="boardTr"
														data-userId="${allPosition.positionCode}">
														<td><input type="checkbox" name="check"
															value="${allPosition.positionCode}"
															style="width: 30px; height: 30px;"></td>

														<td><button type="button" class="btn btn-default"
																data-toggle="modal" data-target="#my80sizeModal2">
																<u>${allPosition.positionCode}</u>
															</button></td>

														<td>${allPosition.positionName }</td>
														<td>${allPosition.rank }</td>
														<td>${allPosition.useStatus }</td>
														<td>${allPosition.relate }</td>
														<td>${allPosition.positionStatus }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</form>





							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>























	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


	<script>
	
	
	/*Duplication Check*/
	$("#emplCheck").on("click", function(){
		$.ajax({
			url			: "${pageContext.request.contextPath }/employee/emplIdAjax" ,
			method		: "post",
			data		: "userId="+$("#userId").val(),
			success		: function(userIdCode) {
				transDupl(userIdCode);
				
			}
		});
	});
	var duplicateCode = "";
	
	function transDupl(userIdCode){
		if(userIdCode == 1){
			insertFlag = "1";
			duplicateCode = "<b><font color='blue'>사용가능한 사원번호 입니다. </font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (userIdCode == 0){
			duplicateCode = "<b><font color='red'>중복된 사원번호 가 있습니다.</font></b>";
			$("#duplicate").html(duplicateCode);
		} else if (userIdCode == "WS"){
			duplicateCode = "<b><font color='red'>사원번호를 입력하세요.</font></b>";
			$("#duplicate").html(duplicateCode);
		}
		
	}

		$(document).ready(function() {
			console.log("레디");
			$("#frmTap").trigger('click');
		
			
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
			
			/* $(".boardTr").click(function() {



				var userId = $(this).data("userId");


				//2 form
				$("#userId").val(userId);
				$("#frm2").submit();

			}); */
			
			
			
			
			
			
			
			
			

	
			

		});
	</script>

	<form id="frm1" action="${cp}/employee/deleteEmployee" method="get">
		<input type="hidden" id="delete_no" name="delete_no" />
	</form>

	<form id="frm2" action="${cp}/employee/detailEmployee" method="get">
		<input type="hidden" id="userId" name="userId" />
	</form>
</body>