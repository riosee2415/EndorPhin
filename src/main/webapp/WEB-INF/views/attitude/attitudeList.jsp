<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>

<style>
select {
	width: 200px;
}
</style>

<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">
</head>



<body>


	<div class="container">
		<div class="row">
			<div class="col-md-10" style="width: 100%">

				<div class="form-group">
					<h2>
						<strong><i class="fa fa-book"></i> 근태 항목</strong>
					</h2>
				</div>


				<table class="table table-striped">
					<thead class="thead">
						<tr>

							<th>근태명 <input type="text">
							<button style="background-color: #6E6867;" class="btn btn-info">검색</button>

							</th>
					</thead>
				</table>

			</div>
		</div>
	</div>


	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-md-10" style="width: 100%">
				<div class="form-group">
					<table class="table table-striped">
						<thead class="thead">
							<tr>
								<th>선택</th>
								<th>근태코드</th>
								<th>근태명</th>
								<th>유무급</th>
								<th>기준일수</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${allAttitude}" var="allAttitude">
								<tr class="boardTr" data-userId="${allAttitude.attitudeCode}">
									<td><input type="checkbox" name="check"
										value="${allAttitude.attitudeCode}"
										style="width: 30px; height: 30px;"></td>

									<td><button type="button" class="btn btn-default"
											data-toggle="modal" data-target="#attitudeInsert">${allAttitude.attitudeCode }</button></td>
									<td>${allAttitude.attitudeName }</td>
									<td>${allAttitude.paidStatus }</td>
									<td>${allAttitude.baseDays }</td>
									<td>${allAttitude.relate }</td>
								</tr>
							</c:forEach>
						</tbody>


					</table>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">

				<button style="background-color: #6E6867;" class="btn btn-info">근태항목삭제</button>
				
				
				
				
				<button style="margin-left: 705px; background-color: #6E6867;"
					class="btn btn-info" data-toggle="modal" data-target="#attitudeInsert">신규등록</button>
			</div>
		</div>
		
		
		<!--  근태 항목 등록 모달창 실행  -->
<div class="modal fade" id="attitudeInsert" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel" style="color: black">
  <div class="modal-dialog modal-80size" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header"><h2>근태항목 등록</h2>
      </div>
      <div class="modal-body">
        <div class="form-group">
						<form action="${cp}/attitude/insertAttitude" method="get">
							<label for="inputName">근태 코드</label> <input type="text" 
								class="form-control" id="attitudeCodeE" name="attitudeCode" placeholder="근태코드를 입력해 주세요">
								
					</div>
					<div class="form-group">
						<label for="InputEmail">근태명</label> <input type="text"
							class="form-control" id="attitudeNameE" name="attitudeName" placeholder="근태명을 입력해주세요">
					</div>
					
					
					<div class="form-group">
						<table>
							<tr>
								<td><label for="inputPassword">유/무급 분류</label></td>
								<td><select id="paidStatusE" name="paidStatus" class="form-control">
										<option value="유급">유급</option>
										<option value="무급">무급</option>
								</select></td>
							
							</tr>
							</table>
						</div>
						
						<div class="form-group">
						<label for="InputEmail">기준일수</label> <input type="text"
							class="form-control" id="baseDaysE" name="baseDays" placeholder="기준일수를 입력해주세요">
					</div>
						
						
						<div class="form-group">
						<label for="InputEmail">비고</label> <input type="text"
							class="form-control" id="relateE" name="relate" placeholder="비고란을 입력해주세요">
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
		
		<!--  근태 항목 등록 모달창 종료  -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>