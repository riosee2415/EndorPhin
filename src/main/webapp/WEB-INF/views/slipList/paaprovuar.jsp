<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--���̺� ����Ʈ���  -->
	<h2>�̽��� ��ǥ </h2>	
	<br>
	<br>
	��ǥ���� &nbsp<input name="before_slipDate" id="before_slipDate" type="text" />
	- &nbsp<input name="after_slipDate" id="after_slipDate" type="text" />
	&nbsp<input type="button" id="seachBtn" value="�˻�" /><br>
	<br>
<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th>
					<th>��ǥ��ȣ</th>
					<th>��ǥ����</th>
					<th>����</th>
					<th>��ǥ�ݾ�</th>
					<th>��ǥ����</th>
				</tr>
			</thead>
			<tbody id="deptListTbody">
			</tbody>
		</table>

		<c:set var="lastPage"
			value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

		<nav style="text-align: center;">
			<ul id="pagination" class="pagination">
			</ul>
		</nav>

	</div>
</div>
<!--------------(����,���) ��ư ------------------->
	
	<div class="modal-footer">
		<button name="upd_btn"  id="upd_btn" type="button" value="0" onclick="myclick()">���� ��� </button>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">���</button>
	</div>
			
	<!-----------------�󼼺���  ���â ---------------->	
	
	<div class="modal fade" id="deptDetail" role="deptDetail" aria-hidden="true"> 
   		<div class="modal-dialog">
   			 <div class="modal-content"> 
	   			<div class="modal-header"> 
	   				<label>| �μ����</label>
	   				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	   				<h4 class="modal-title" id="myModalLabel"></h4>
	   			</div> 
	   			<div class="modal-body"> 
	   				<div class="form-group">
	   					<label for="InputEmail">�μ��ڵ�(*)</label> 
	   					<input type="text" id="upd_deptCode" name="upd_deptCode" readonly>
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">�μ��� (*)&nbsp;&nbsp;</label> 
	   					<input type="text" name="upd_deptName" id="upd_deptName"  > 
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">ȸ�� �ڵ� &nbsp;&nbsp;</label> 
	   					<input type="text" id="upd_companyCode" name="upd_companyCode" />
	   					<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="�˻�" >
	   				</div>
	   			<div class="modal-footer">
	   			
					<button id="yes_Btn" name="yes_Btn" class="btn btn-default" data-dismiss="modal"  value="1" style="background: #486068; color: #ffffff"></button>
	   				<!-- <input type="hidden" id="no_Btn" name="no_Btn" class="btn btn-default" data-dismiss="modal" value="0" style="background: #ff8e77; color: #ffffff"> -->
	   				
	   				<button type="button" id="modalUpdateBtn" class="btn btn-default" data-dismiss="modal" >����</button>
	   			
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>

	<!---------------����---------------->

 	<form id="update_frm" action="${pageContext.request.contextPath }/updateSlip">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		
 	
 	<form id="useFrm" action="${pageConext.request.contextPath }/useDept">
		<input type="hidden"  id="frm_usestatus" name="frm_usestatus">
		<input type="hidden"  id="frm_deptCode" name="frm_deptCode" >
	</form>
	
    <!---------------------------------------------->
	<script>
    
	$("document").ready(function() {
		
		/* �󼼺���  */
		$(".detailView").on("click", function(){
			
			$("#upd_deptCode").val($(this).data().upd_deptcode);
			$("#upd_deptName").val($(this).data().upd_deptname);
			$("#upd_companyCode").val($(this).data().upd_companycode);
			
			if($(this).data().upd_usestatus==1){
				$("#yes_Btn").html("�̻��");
				
			}
			else if($(this).data().upd_usestatus==0){
				$("#yes_Btn").html("���");
				$("#yes_btn").attr("style","background: #ff8e77; color: #ffffff");
			}
			
		});
	});
		 	
		/*ȸ���̸� �˻�  */
 	$("#searchC_Btn").on("click", function(){
 		if($("#companyName").val().trim()==""){
 			alert("ȸ����� �Է��ϼ���.");
 			$("companyName").focus();
 			return false;
 		}
		$.ajax({
    		url 	: "${pageContext.request.contextPath }/searchCompanyAjax",
    		data 	: "companyName=" + $("#companyName").val(),
    		success : function(data){
    			$("#companyName").val("");
				$("#companyListTbody").html(data);
    			
    		}
    	});
    }); 
    
    
 	/* ī�� �ڵ�,�̸� �˻� */  
    $("#seachBtn").on("click", function(){
    		if($("#deptCode1").val().trim() != "" || $("#deptName1").val().trim() !=""){
   	 	$.ajax({
       		url 	: "${pageContext.request.contextPath }/searchDept_BothAjax",
       		data 	: "deptCode1=" + $("#deptCode1").val() +  "&" + "deptName1=" + $("#deptName1").val(),
       		success : function(data){
       			$("#deptCode1").val("");
       			$("#deptName1").val("");
   				$("#deptListTbody").html(data);
       			
       		}
       	});
   	 	}else if($("#deptCode1").val().trim() != "" || $("#deptName1").val().trim() == ""){
   	 		
   		$.ajax({
       		url 	: "${pageContext.request.contextPath }/searchDept_codeAjax",
       		data 	: "deptCode1=" + $("#deptCode1").val(),
       		success : function(data){
       			$("#deptCode1").val("");
   				$("#deptListTbody").html(data);
       			
       		}
       	});
   		 
   	 	}else if($("#deptCode1").val().trim() == "" || $("#deptName1").val().trim() != ""){
   		$.ajax({
       		url 	: "${pageContext.request.contextPath }/searchDept_NameAjax",
       		data 	: "deptName1=" + $("#deptName1").val(),
       		success : function(data){
       			$("#deptName1").val("");
   				$("#deptListTbody").html(data);
       			
       		}
       	});
   	 }
}); 

	$("document").ready(function(){
		paaprovuarPageList(1);
 	});
 	function paaprovuarPageList(page){
 		
 		$.ajax({
 			url : "${pageContext.request.contextPath }/paaprovuarPageList",
 			data : "page=" + page,
 			success : function(data){
 				
 				var htmlArr = data.split("================seperator================");
 				
 				$("#deptListTbody").html(htmlArr[0]);
 				$("#pagination").html(htmlArr[1]);
 			}
 		});
 	}

       
	/* ��ü���� ���� */
	function allCheck() {
		if ($("#th_allCheck").is(':checked')) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}

	/* ���� �������*/
	function myclick() {
		var checkRow = '';
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val()+",";
		});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //�ǳ� �޸� �����  
			$("#checkRow").val(checkRow);
		

			if(checkRow === ""){		
			alert("������ ����� �����ϼ���");
			return false;
		}
		
		
		$("#update_frm").submit();
	}

	
	</script>
	

 	
