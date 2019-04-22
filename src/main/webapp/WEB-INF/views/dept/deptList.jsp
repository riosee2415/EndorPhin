<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
		<h2><i class="fa fa-calculator"></i> �μ� ���</h2>	
		<table>
			<tr>
				<td><strong>�μ��ڵ� :</strong></td>
				<td><input class="search-query form-control" name="deptCode1" id="deptCode1" type="text" /></td>
				<td><strong>�μ��� :</strong></td>
				<td><input class="search-query form-control" name="deptName1" id="deptName1" type="text" /></td>
				<td><input type="button" class="bttn-fill bttn-md bttn-warning" id="seachBtn" value="�˻�" /></td>
			</tr>
		</table>
		<table class="table table-hover">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th> 
					<th>�μ��ڵ�</th>
					<th>�μ���</th>
					<th>ȸ���</th>
					<th>��뱸��</th>
					<th>���</th>
				</tr> 
			</thead>	
			<tbody id="deptListTbody">
				<c:forEach items="${deptList }" var="vo">	
					 <tr>
						<td><input type="checkbox" name="checkRow" value="${vo.deptCode }" ></td>
						<td><a class="bttn-stretch bttn-md bttn-warning detailView" href="#deptDetail" data-upd_deptcode="${vo.deptCode }" 
																	 data-upd_deptname="${vo.deptName }"
																	 data-upd_companycode="${vo.companyCode }"
																	 data-upd_usestatus="${vo.useStatus }"
																	 data-toggle="modal">${vo.deptCode}
																	 </a></td>
   														
						<td>${vo.deptName }</td>
						<td>${vo.companyCode }</td>
						<c:choose>
							<c:when test="${vo.useStatus == 1}">
								<td>���</td>
							</c:when>
							<c:otherwise>
								<td><font color="red"> �̻��</font></td>
							</c:otherwise>
						</c:choose>
						<td></td>
				 	</tr>		 
				
				</c:forEach>
			</tbody>
		</table>
	<!--------------(����,���) ��ư ------------------->
	
	<div class="modal-footer">
		<input name="delect_btn" class="bttn-jelly bttn-md bttn-warning"  id="delect_btn" type="button" value="���û���" onclick="myclick()" />
		<button type="button" class="bttn-jelly bttn-md bttn-warning" data-toggle="modal" data-target="#my80sizeCenterModal">���</button>
	</div>
	</div>
</div>
			
	<!-------------- ��� ���â ����  ------------>

	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
				<div class="modal-header">
				<label>| �μ����</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
					<!-- ������� �����ۼ� -->
						<label>�μ��ڵ�(*)</label> 
						<input type="text" id="deptCode" placeholder="�ڵ带 �Է��ϼ���"> 
						<input type="button" class="btn btn-default" value="�ߺ�üũ" id="duplCheckbtn" name="duplCheckbtn"/> 
						<div id="dupleCode"></div>
					</div>
						<div class="form-group">
						<label>�μ���(*) &nbsp;&nbsp;&nbsp;</label> 
						<input style="width: 180px;" type="text" name="deptName" id="deptName" placeholder="�μ����� �Է��ϼ���"> 
						
					</div>	
					<div class="form-group">
						<label>ȸ�� �ڵ� &nbsp;</label> 
						<input style="width: 200px;" type="text" name="companyCode" id="companyCode" placeholder="ȸ���ڵ带 �Է��ϼ���"> 
						<input type="button" class="btn btn-default" data-toggle="modal" data-target="#my80sizeModal2" value="�˻�" >
					</div>
					
					</div>	
					<div class="modal-footer">
						<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">���</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
					</div>
				</div>
			</div>
		</div>
	<!-----------------�󼼺���(����) ���â ---------------->	
	
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
	   					<input type="button" class="btn btn-default" data-toggle="modal" data-target="#my80sizeModal3" value="�˻�" >
	   				</div>
	   			<div class="modal-footer">
					<button id="yes_Btn" name="yes_Btn" class="btn btn-default" data-dismiss="modal" style="background: #486068; color: #ffffff"></button>
	   				<!-- <input type="hidden" id="no_Btn" name="no_Btn" class="btn btn-default" data-dismiss="modal" value="0" style="background: #ff8e77; color: #ffffff"> -->
	   				
	   				<button type="button" id="modalUpdateBtn" class="btn btn-default" data-dismiss="modal" >����</button>
	   			
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>


<!-----------------ȸ�� �ڵ� �˻� ���â ---------------->	
	 	<!-- 80% size Modal -->
<div class="modal fade" id="my80sizeModal2" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h6>| �������� ��ȸ</h6>
			</div>
			<div class="modal-body">
				<div class="form-group"></div>
				<table>
					<thead>
						<tr>
							<th>ȸ���&nbsp;</th>
							<th><input style="width: 150px;" type="text" class="form-control" id="companyName" name="companyName"></th>
							<th><button type="button" class="btn btn-inverse" id="searchC_Btn">�˻�</button><th>
						</tr>
						<tr>
							<th>���õ� ȸ���</th>
							<th><input type="text" style="width: 150px;" type="text" class="form-control" id="selcompany" name="selcompany"></th>
							<th><button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">Ȯ��</button></th>
						</tr>
						
				</table>  <br>
				<table class="table table-sm">
					<thead class="thead">
						<tr>
							<th>ȸ�� �ڵ�</th>
							<th>ȸ���</th>
					</thead>
					<tbody id="companyListTbody">
						<c:forEach items="${companyList }" var="vo">
							<tr class="companyTr" data-selcompanycode="${vo.companyCode }">
								<td>${vo.companyCode}</td>
								<td>${vo.companyName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
		</div>
	</div>
</div>


<!-----------------ȸ�� �ڵ� ���� �˻� ���â ---------------->	
	 	<!-- 80% size Modal -->
<div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h6>| �������� ��ȸ</h6>
			</div>
			<div class="modal-body">
				<div class="form-group"></div>
				<table>
					<thead>
						<tr>
							<th>ȸ���&nbsp;</th>
							<th><input style="width: 150px;" type="text" class="form-control" id="u_companyName" name="u_companyName"></th>
							<th><button type="button" class="btn btn-inverse" id="upd_Search">�˻�</button><th>
						</tr>
						<tr>
							<th>���õ� ȸ���</th>
							<th><input type="text" style="width: 150px;" type="text" class="form-control" id="selcompany2" name="selcompany2"></th>
							<th><button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">Ȯ��</button></th>
						</tr>
						
				</table>  <br>
				<table class="table table-sm">
					<thead class="thead">
						<tr>
							<th>ȸ�� �ڵ�</th>
							<th>ȸ���</th>
					</thead>
					<tbody id="upd_companyListTbody">
						<c:forEach items="${companyList }" var="vo">
							<tr class="upd_companyTr" data-upd_selcompanycode="${vo.companyCode }">
								<td>${vo.companyCode}</td>
								<td>${vo.companyName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
		</div>
	</div>
</div>
	<!---------------���, �˻�, ����  ---------------->
	
	<form id="insertFrm" action="${pageContext.request.contextPath }/insertDept">
		<input type="hidden" id="frmdeptCode" name="frmdeptCode" />
		<input type="hidden" id="frmdeptName" name="frmdeptName" />
		<input type="hidden" id="frmcompanyCode" name="frmcompanyCode" />
	</form>
	
	<form id="updateFrm" action="${pageContext.request.contextPath }/updDept">
		<input type="hidden" id="frmdeptCode1" name="frmdeptCode1" />
		<input type="hidden" id="frmdeptName1" name="frmdeptName1" />
		<input type="hidden" id="frmcompanyCode1" name="frmcompanyCode1" />
	</form>

 	<form id="del_frm" action="${pageContext.request.contextPath }/deleteDept">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		
 	
 	<form id="useFrm" action="${pageConext.request.contextPath }/useDept">
		<input type="hidden"  id="frm_usestatus" name="frm_usestatus">
		<input type="hidden"  id="frm_deptCode" name="frm_deptCode" >
	</form>
    <!---------------------------------------------->
	<script>
	
	$(document).ready(function() {
		/* �󼼺���  */
		$(".detailView").on("click", function(){
			$("#upd_deptCode").val($(this).data().upd_deptcode);
			$("#upd_deptName").val($(this).data().upd_deptname);
			$("#upd_companyCode").val($(this).data().upd_companycode);
			if($(this).data().upd_usestatus==1){
				$("#yes_Btn").html("�̻��");
				$("#yes_Btn").val('0');
				
			}
			else if($(this).data().upd_usestatus==0){
				$("#yes_Btn").html("���");
				$("#yes_Btn").val('1');
				$("#yes_btn").attr("style","background: #ff8e77; color: #ffffff");
			}
			
		});
		
		/*��뿩�� ����  */
		 $("#yes_Btn").on("click", function(){
	
			var deptcode = $("#upd_deptCode").val();
			var status 	 = $("#yes_Btn").val();
	
			alert(status);
			$("#frm_deptCode").val(deptcode);
			$("#frm_usestatus").val(status);
			
			$("#useFrm").submit();
		});  
		
		/* ���� */
		$("#modalUpdateBtn").on("click", function(){ 
			
			$("#frmdeptCode1").val($("#upd_deptCode").val());
			$("#frmdeptName1").val($("#upd_deptName").val());
			$("#frmcompanyCode1").val($("#upd_companyCode").val());
			
			if($("#upd_deptName").val().trim()==""){
				alert("�μ����� �Է��ϼ���");
				$("#upd_deptName").focus();
				return false;
			}
		 	
			if($("#upd_companyCode").val().trim()==""){
				alert("ȸ���ڵ带 �����ϼ���");
				$("#upd_companyCode").focus();
				return false;
		}  
	 	
 		$("#updateFrm").submit();
    });
});	
	
	
    /* ���  */
	$("#insertBtn").on("click", function(){
		
		$("#frmdeptCode").val($("#deptCode").val());
		$("#frmdeptName").val($("#deptName").val());
		$("#frmcompanyCode").val($("#companyCode").val());
		
		if($("#deptName").val().trim()==""){
			alert("�μ����� �Է��ϼ���");
			$("#deptName").focus();
			return false;
		}
	 	if($("#companyCode").val().trim()==""){
			alert("ȸ���ڵ带 �����ϼ���");
			$("#companyCode").focus();
			return false;
		} 
	// 	companyTr();
	 	$("#insertFrm").submit();
	
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
    
 	 /*����ȸ���̸� �˻�  */
 	$("#upd_Search").on("click", function(){
 		if($("#u_companyName").val().trim()==""){
 			alert("ȸ����� �Է��ϼ���.");
 			$("u_companyName").focus();
 			return false;
 		}
		$.ajax({
    		url 	: "${pageContext.request.contextPath }/companyUpdSearchAjax",
    		data 	:"u_companyName=" + $("#u_companyName").val(),
    		success : function(data){
    			$("#u_companyName").val("");
				$("#upd_companyListTbody").html(data);
    			
    		}
    	});
    }); 
 	 
	$(".companyTr").on("click", function(){
		var companyCode1 = $(this).data().selcompanycode;
		$("#selcompany").val(companyCode1);
		$("#companyCode").val(companyCode1);
	});
	$(".upd_companyTr").on("click", function(){
		
		var companyCode1 = $(this).data().upd_selcompanycode;
		$("#selcompany2").val(companyCode1);
		$("#upd_companyCode").val(companyCode1);
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
 	
 	/* ī���ڵ� �ߺ�üũ ajax */
	    $("#duplCheckbtn").on("click", function(){
    	
    	$.ajax({
    		url 	: "${pageContext.request.contextPath }/DupleDept",
    		method  : "post",
    		data 	: "deptCode="+$("#deptCode").val(),
    		success : function(dupleCode){
    			transDupl(dupleCode);
    		}
    	});
    
    }); 
    
		var dupleCode ="";
		
	    function transDupl(){
	    	if(dupleCode == "0"){
	    		dupleCode ="<b><font color='blue'>��밡���� ī�� �ڵ��Դϴ�.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "1"){
	    		dupleCode="<b><font color='red'>�ߺ��� ī�� �ڵ��Դϴ�.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>�μ� �ڵ带 �Է��ϼ���.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}
	    }  
	    
		 function allCheck() {
			if ($("#th_allCheck").is(':checked')) {
					$("input[name=checkRow]").prop("checked", true);
				} else {
					$("input[name=checkRow]").prop("checked", false);
				}
			}
		
		/* ��ü���û��� */
		function allCheck() {
			if ($("#th_allCheck").is(':checked')) {
					$("input[name=checkRow]").prop("checked", true);
				} else {
					$("input[name=checkRow]").prop("checked", false);
				}
			}

		/* ���û�ü*/
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
 				$("#del_frm").submit();
		}
    

	
	</script>
	

 	
