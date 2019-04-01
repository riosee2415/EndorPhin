<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



			 <div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
       <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Modal 2</h4>
            </div><div class="container"></div>
            <div class="modal-body">



				<div class="row-0">
					<div class="col-0-0">
						부서명 <select id="paidStatus" name="paidStatus">
							<option value="">전체</option>
							<option value="2">인사팀</option>
							<option value="3">회계팀</option>
							<option value="3">물류팀</option>
						</select>
					</div>
				</div>



				<!-- 불러온 사원 목록창 -->
				<div class="row-1" style="margin-top: 50px">
					<div class="col-1-0">

						<table class="table table-striped" style="text-align: center;"
							border="1">
							<thead class="thead">
								<tr>
									<th>check</th>
									<th>사번</th>
									<th>사원명</th>
									<th>부서명</th>
								</tr>
							</thead>

							<tbody id="userListTbody">
							</tbody>

						</table>

					</div>
				</div>




				<!-- 불러온 사원 목록창 종료 -->

				<div class="row-1" style="margin-top: 50px">
					<div class="col-1-0">


						<button type="button" id="emplLoadingCheck"
							class="btn btn-secondary btn-lg">선택</button>

					</div>
				</div>




            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
        </div>
    </div>
			
			
			
			
			
			
			
			
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>


$("#attitudeInsert").on("click", function(){
			console.log("클릭");

	//사원 전체 불러오기
	$.ajax({
		url			: "${pageContext.request.contextPath }/employee/getAllEmployeeAjax" ,
		method		: "get",
		//data		: "userId="+$(this).data().userid,
		success		: function(data) {
			
			console.log(data);
			
			makeUserList(data);
		
		} 
	});
	
	});
	
function makeUserList(allEmployee) {
	var html = "";
	
	for(var i = 0; i < allEmployee.length; i++){
		var user = allEmployee[i];
		html += "<tr class='userTr' data-userid='"+ user.userId+ "'>";
		html += "<td> <input type='checkbox' name='check'  value=' "+ user.userId+"' /></td>";
		
		html += "	<td>"+ user.userId +"</td>";
		html += "	<td>"+ user.userNm +"</td>";
		html += "	<td>"+user.deptname+"</td>";
		html += "</tr>";
	}
	$("#userListTbody").html(html);
	
}

//사용자 tr 태그 클릭시 이벤트 핸들러
$("#emplLoadingCheck").click(function() {
	 $('input:checkbox[name="check"]:checked').each(function() {
		 $("#frmInsert").append("<input type=\'hidden\' name=\'check_no\' value=\''"+$(this).val()+"\'' />")
	}); 
	 
	$("#frmInsert").submit();
	 
	
	});
	
$(document).on('hidden.bs.modal', function (event) {

	if ($('.modal:visible').length) {

		$('body').addClass('modal-open');

	}

});


</script>

	<form id="frmInsert" action="${cp}/attitudeRecord/attitudeRecordInsert" method="get">
	</form>
