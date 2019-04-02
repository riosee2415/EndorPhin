<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<style>
select{
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
						<strong><i class="fa fa-calculator"></i> 급여조정</strong>
					</h2>
				</div>


				<table class="table table-striped">
					<thead class="thead">
						<tr>
							<th>년도   <select  name="positionStatus" >
										<option value="2014">2014년</option>
										<option value="2015">2015년</option>
										<option value="2016">2016년</option>
										<option value="2017">2017년</option>
										<option value="2018">2018년</option>
										<option value="2019">2019년</option>
										<option value="2020">2020년</option>
										<option value="2021">2021년</option>
								</select></th>
							<th>월 <select  name="positionStatus" >
										<option value="1">1월</option>
										<option value="2">2월</option>
										<option value="3">3월</option>
										<option value="4">4월</option>
										<option value="5">5월</option>
										<option value="6">6월</option>
										<option value="7">7월</option>
										<option value="8">8월</option>
										<option value="9">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
								</select>
							
							</th>
							<th>차수 <select  name="positionStatus" >
										<option value="1">1차</option>
										<option value="2">2차</option>
										<option value="3">3차</option>
										<option value="4">4차</option>
										<option value="5">5차</option>
										<option value="6">6차</option>
										<option value="7">7차</option>
										<option value="8">8차</option>
										<option value="9">9차</option>
										<option value="10">10차</option>
								</select>
							
							</th>
							<th><button type="submit" >검색
							</button>  
							
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
					<th>년도</th>
					<th>월</th>
					<th>차수</th>
					<th>급여구분</th>
					<th>급여조정</th>
					<th>공제조정</th>
					<th>등록관리</th>
				</tr>
			</thead>
			
		</table>
	</div>
	</div>
		</div>
	
	
	<div class="container">
	<div class="row">
	
	 <button style=" background-color:#6E6867;  important" class="btn btn-info">급여조정삭제</button>  
	<button style="margin-left: 705px; background-color:#6E6867;  important "   class="btn btn-info">신규등록</button> 
	</div>
	</div>
	
	

</body>
 