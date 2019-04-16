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

/* @media only screen and (max-width: 479px) {
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
} */
.table {
	border-width: 3px;
	border-style: inset;
	border-color: black;
}
</style>


</head>
<body>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" style="width: 100%">
			<div class="tab" role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a id="frmTap"
						href="#Section1" aria-controls="home" role="tab" data-toggle="tab">사원
							목록</a></li>
					<li role="presentation"><a href="#Section2"
						aria-controls="Section2" role="tab" data-toggle="tab"> 인 사 </a></li>
					<li role="presentation"><a href="#Section3"
						aria-controls="Section3" role="tab" data-toggle="tab"> 회 계 </a></li>
					<li role="presentation"><a href="#Section4"
						aria-controls="Section4" role="tab" data-toggle="tab"> 물 류 </a></li>



				</ul>

				<!-- Tab panes -->
				<div class="tab-content tabs">
					<div role="tabpanel" class="tab-pane fade in active" id="Section1">
						<form class="form-horizontal">
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

									<tbody id="mytbody">
										<c:forEach items="${allEmployee}" var="allEmployee">
											<tr>
												<td><input type="checkbox" name="check"
													value="${allEmployee.userId}"
													style="width: 30px; height: 30px;"></td>

												<td class="boardTr" data-userid="${allEmployee.userId}"><button
														type="button" class="btn btn-default" data-toggle="modal"
														data-target="#myLargeModalEdit">
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
							<form action="${cp}/employee/SearchEmployee" id="searchFrm">
								<table>
									<tr>
										<td>
											<button style="background-color: #6E6867 !important;"
												type="button" class="btn btn-primary btn-lg" id="cancleBtn">삭
												제</button>
											<button style="background-color: #6E6867 !important;"
												type="button" class="btn btn-primary btn-lg"
												data-toggle="modal" data-target="#myLargeModalInsert"
												id="employeeInsert">신규등록</button>
										</td>
										<td></td>
										<td style="padding-left: 600px"><input type="text"
											class="search-query form-control" id="searchPay"
											name="searchName" placeholder="사원명을 검색하시오" /></td>
										<td>
											<button class="btn btn-info" type="submit" id="searchBtn">
												<span class=" glyphicon glyphicon-search">검색</span>
											</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>




					<!-- Section2 시작-->
					<div role="tabpanel" class="tab-pane fade" id="Section2">
						<form class="form-horizontal">
							<div class="form-group">
								<table class="table table-striped">
									<thead class="thead">
										<tr>
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

									<tbody id="mytbody">
										<c:forEach items="${allEmployee}" var="allEmployee">
											<c:if test="${allEmployee.deptname == '인사' }">
												<tr>
													<td class="boardTr" data-userid="${allEmployee.userId}"><button
															type="button" class="btn btn-default" data-toggle="modal"
															data-target="#myLargeModalEdit">
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
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</form>
					</div>
					<!-- Section2 끝-->

					<!-- Section3 시작-->
					<div role="tabpanel" class="tab-pane fade" id="Section3">
						<form class="form-horizontal">

							<div class="form-group">
								<table class="table table-striped">
									<thead class="thead">
										<tr>
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

									<tbody id="mytbody">
										<c:forEach items="${allEmployee}" var="allEmployee">
											<c:if test="${allEmployee.deptname == '회계' }">
												<tr>
													<td class="boardTr" data-userid="${allEmployee.userId}"><button
															type="button" class="btn btn-default" data-toggle="modal"
															data-target="#myLargeModalEdit">
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
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</form>
					</div>
					<!-- Section3 끝-->

					<!-- Section4 시작-->
					<div role="tabpanel" class="tab-pane fade" id="Section4">
						<form class="form-horizontal">
							<div class="form-group">
								<table class="table table-striped">
									<thead class="thead">
										<tr>
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

									<tbody id="mytbody">
										<c:forEach items="${allEmployee}" var="allEmployee">
											<c:if test="${allEmployee.deptname == '물류' }">
												<tr>
													<td class="boardTr" data-userid="${allEmployee.userId}"><button
															type="button" class="btn btn-default" data-toggle="modal"
															data-target="#myLargeModalEdit">
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
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--  사원 등록 모달창 불러오기  -->
	<%@ include file="employeeInsert.jsp"%>

	<!--  사원 등록 모달창 불러오기  -->
	<%@ include file="employeemodify.jsp"%>
	<script>
	
	  /*사원정보 수정하기*/
	   $("#mytbody").on("click", ".boardTr", function(){
		   
		   var deptCode_htmlEdit = "";
		   var position_htmlEdit = "";
		   var rank_htmlEdit = "";
		                     
	         
	      console.log($(this).data().userid);
	      
	      $.ajax({
	         url         : "${pageContext.request.contextPath }/employee/updateEmployee" ,
	         method      : "get",
	         data      : "userId="+$(this).data().userid,
	         success      : function(userIdCode) {
	             $("#userIde").val(userIdCode.userId); 
	             $("#userNme").val(userIdCode.userNm);
	             $("#deptCode_htmlEdit").val(userIdCode.deptCode); 
	             $("#position_htmlEdit").val(userIdCode.positionCode);
	             $("#rank_htmlEdit").val(userIdCode.rankCode);
	           console.log(userIdCode.birthDate);
	             
	             $("#relateE").val(userIdCode.relate);
	             $("#BirthDateE").val(userIdCode.birthDate);
	             $("#finalSchoolE").val(userIdCode.finalschool);
	             $("#phoneNumberE").val(userIdCode.phonenumber); 
	             $("#emailE").val(userIdCode.email); 
	             
	             var addrtemp = Array();
	             addrtemp = userIdCode.address.split(',');

	          	 $("#addressE").val(addrtemp[0]); 
	             $("#addressDetailE").val(addrtemp[1]); 
	             $("#marryStatusE").val(userIdCode.marryStatus); 
	             $("#imagecodeE").val(userIdCode.imagecode); 
	             
	             $("#userimage").attr('src','${cp}/employee/profileImg?userId=' + userIdCode.userId);
	             
	         } 
	      });
	   });
	  
	
   
   //사원 신규등록 클릭시 정보가져오기
   $("#employeeInsert").on("click", function(){
      
      
      $.ajax({
         url         : "${pageContext.request.contextPath }/employee/getSelectBox" ,
         method      : "get",
         //data      : "userId="+$(this).data().userid,
         success      : function(data) {
            console.log(data);
            makeUserList(data);
             
            
         } 
      });
      
   });
   
   
   
   
   
   function makeUserList(data) {
      
      var deptCode_html = "";
      var position_html = "";
      var rank_html = "";
      
      for(var i = 0; i < data.allDept.length; i++){
         var dept = data.allDept[i];
         
         deptCode_html += "<option value='" +dept.deptCode+"'> "+dept.deptName +"</option>";
         
      }
                             
      $("#deptCode_html").html(deptCode_html);
      
      
      
      for(var i = 0; i < data.allPosition.length; i++){
         
         if(data.allPosition[i].positionStatus == "직책"){
            var position = data.allPosition[i];
            position_html += "<option value='" + position.positionCode +"'> "+position.positionName +"</option>";
            
         }else if(data.allPosition[i].positionStatus == "직급"){
            
            var rank = data.allPosition[i];
            rank_html += "<option value='" + rank.positionCode +"'> "+rank.positionName +"</option>";
         }
         
      
      }          
             
      $("#position_html").html(position_html);
      $("#rank_html").html(rank_html);
      
      
      
      
   }
   
   
   
 
   /*Duplication Check*/
   $("#emplCheck").on("click", function(){
      $.ajax({
         url         : "${pageContext.request.contextPath }/employee/emplIdAjax" ,
         method      : "post",
         data      : "userId="+$("#userId").val(),
         success      : function(userIdCode) {
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
         
         $("#frmTap").trigger('click');
         
         
       //수정창 부서,직급 정보가져오기
   		  
   		   $.ajax({
   		         url         : "${pageContext.request.contextPath }/employee/getSelectBox" ,
   		         method      : "get",
   		         //data      : "userId="+$(this).data().userid,
   		         success      : function(data) {
   		            editUserList(data);
   		             
   		            
   		         } 
   		      });
   	  
   	  function editUserList(data) {
   	      
   	      var deptCode_html = "";
   	      var position_html = "";
   	      var rank_html = "";
   	      
   	      for(var i = 0; i < data.allDept.length; i++){
   	         var dept = data.allDept[i];
   	         
   	         deptCode_html += "<option value='" + dept.deptCode +"'> "+dept.deptName +"</option>";
   	         
   	      }
   	                             
   	      $("#deptCode_htmlEdit").html(deptCode_html);
   	      
   	      
   	      
   	      for(var i = 0; i < data.allPosition.length; i++){
   	         
   	         if(data.allPosition[i].positionStatus == "직책"){
   	            var position = data.allPosition[i];
   	            position_html += "<option value='" + position.positionCode +"'> "+position.positionName +"</option>";
   	            
   	         }else if(data.allPosition[i].positionStatus == "직급"){
   	            
   	            var rank = data.allPosition[i];
   	            rank_html += "<option value='" + rank.positionCode +"'> "+rank.positionName +"</option>";
   	         }
   	         
   	      
   	      }          
   	             
   	      $("#position_htmlEdit").html(position_html);
   	      $("#rank_htmlEdit").html(rank_html);
   	      
   	      
   	   } 
      
         
          //server side 에서 비교
         <c:if test="${msg != null}">
         alert("${msg}");
         </c:if> 
         
         
          //사용자 tr 태그 클릭시 이벤트 핸들러
         $("#cancleBtn").click(function() {
            var implArray = new Array();

            $('input:checkbox[name="check"]:checked').each(function() {
               implArray.push($(this).val());
   
            $("#delete_no").val(implArray);
            $("#frm1").submit();
            
            });

         }); 
          
         

      });
      
       
       
       $("#zipcodeBtn").on("click", function() {

         new daum.Postcode({
            oncomplete : function(data) {
               console.log(data);
            
               //새 우편번호 : data.zonecode
               //우편번호 input select .val (data.zonecode)
               //$("#zipcode").val(data.zonecode);
               
               //기본주소(도로주소) : data.roadAddress
               //주소1 input select .val (data.zonecode);
               $("#address").val(data.roadAddress);
               
               //상세주소 input focus
               //$("#addressDetail").focus();
            
            
               
            
            }
         }).open();

      }); 
   </script>

	<form id="frm1" action="${cp}/employee/deleteEmployee" method="get">
		<input type="hidden" id="delete_no" name="delete_no" />
	</form>

	<form id="frm2" action="${cp}/employee/detailEmployee" method="get">
		<input type="hidden" id="userId" name="userId" />
	</form>
</body>