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


#tdtd{


margin-left: 30px !important;

}

 img.ui-datepicker-trigger{ width: 30px; margin-bottom: 5px; }
 
 th{
 
vertical-align: middle !important;
 }
 
</style>

</head>



<body>

	<div class="container">
		<div class="row">
			<div class="col-md-10" style="width: 100%">

				<div class="form-group">
					<h2>
						<strong><i class="fa fa-book"></i> 근태 입력</strong>
					</h2>
				</div>






				<table class="table table-striped">
					<thead class="thead">
						<tr class="tablespa">
							<form action="${cp}/attitude/searchAttitude">
							<td>근태명 <input type="text" name="search">
							<button type="submit" style="background-color: #6E6867;" class="btn btn-info">검색</button>
							</td>
							<td id="tdtd"><input type="text" id="startDate" class="startDate"/></td>
							<td><h2><strong> ~ </strong></h2></td>
							<td><input type="text" id="endDate"/> </td>
							</form>
						</tr>
					</thead>
				</table>

			</div>
		</div>
	</div>
	



<!--  목록 출력 -->




<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-md-10" style="width: 100%">
				<div class="form-group">
					<table class="table table-striped" style="text-align: center;" border="1">
						<thead class="thead" >
							<tr >
								<th  rowspan="2">사번</th>
								<th  rowspan="2">사원명</th>
								<th  rowspan="2">부서명</th>
								<th  colspan="2">근태항목</th>
								<th  colspan="2">기간</th>
								<th  rowspan="2">일수
								<th  rowspan="2">메모</th>
							</tr>
							<tr>
								<td>코드</td>
								<td>명</td>
								<td>부터</td>
								<td>까지</td>
							</tr>
						</thead>
					 <tbody id="mytbody">
							<c:forEach items="${allAttitude_record}" var="allAttitude_record">
								<tr class="boardTr" data-userId="${allAttitude_record.userid}">
									<td><input type="checkbox" name="check"
										value="${allAttitude_record.userid}"
										style="width: 30px; height: 30px;"></td>

									<td><button type="button" class="btn btn-default"
											data-toggle="modal" data-target="#attitudeEdit">${allAttitude_record.userid }</button></td>
									<td>${allAttitude_record.usernm }</td>
									<td>${allAttitude_record.deptname }</td>
									<td>${allAttitude_record.attitudename }</td>
									<td>${allAttitude_record.startday }</td>
									<td>${allAttitude_record.endday }</td>
									<td>${allAttitude_record.basedays }</td>
									<td>${allAttitude_record.attitudememo }</td>
								</tr>
							</c:forEach>
						</tbody> 

					</table>
				</div>
			</div>
		</div>
		
		
		<div class="container">
			<div class="row">

				<button style="background-color: #6E6867;" class="btn btn-info" id="cancleBtn">근태이력삭제</button>
				
					
					 <a style="margin-left: 705px;" data-toggle="modal" href="#myModal" class="btn btn-primary">신규등록</a>
			</div>
		</div>



		<!--  근태 항목 등록 모달창 실행  -->
		
		<div class="contain_box">
      <div class="container">
 
		
		
		
			<%@ include file="attitudeRecordInsert.jsp"%>
		<!--  근태 항목 등록 모달창 종료  -->
		
		
		
		
		<!--  근태 항목 등록 모달창 실행  -->
			<%@ include file="attitudeRecordEdit.jsp"%>
		<!--  근태 항목 등록 모달창 종료  -->


</div>
          </div>
        </div>
    



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
	$(function() {
        $("#startDate").datepicker(   // inputbox 의 id 가 startDate 이겠죠.
                {dateFormat:'yy/mm/dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
                 , showOn: 'button' // 우측에 달력 icon 을 보인다.
                 , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"  // 우측 달력 icon 의 이미지 패스 
                 , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
                 , changeMonth: true // 월선택 select box 표시 (기본은 false)
                 ,changeYear: true  // 년선택 selectbox 표시 (기본은 false)
                 ,showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
               });

        $("#endDate").datepicker({dateFormat:'yy/mm/dd',showOn: 'button'
                , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", buttonImageOnly: true
                , changeMonth: true,changeYear: true,showButtonPanel: true});
        
        
      //초기값을 오늘 날짜로 설정
        $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
        $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  

    });
    
	
	
	</script>
	
	
	
</body>

