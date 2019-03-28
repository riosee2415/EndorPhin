<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--���̺� ����Ʈ���  -->
	<h2>�μ� ���</h2>	
	<br>
	<br>
	�μ��ڵ� &nbsp <input name="deptCode1" id="deptCode1" type="text" />
	&nbsp �μ��� &nbsp<input name="deptName1" id="deptName1" type="text" />
	&nbsp<input type="button" id="seachBtn" value="�˻�" onclick="seachBtn()" /><br>
	<br>
	<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<td><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></td> 
					<th>�μ��ڵ�</th>
					<th>�μ���</th>
					<th>ȸ���</th>
					<th>��뱸��</th>
					<th>���</th>
				</tr>
			</thead>	
			<tbody id="deptListTbody">
				<c:forEach items="${deptList }" var="vo">	
<%-- 					<input type="hidden" class="deptCode" name="deptCode" value="${vo.deptCode }"/>
 --%>					 <tr>
						<td><input type="checkbox" name="checkRow" value="${vo.deptCode }" ></td>
						<td><a class="detailView" href="#deptDetail" data-upd_deptcode="${vo.deptCode }" 
																	 data-upd_deptname="${vo.deptName }"
																	 data-upd_companycode="${vo.companyCode }"
																	 data-upd_usestatus="${vo.useStatus }"
																	 data-toggle="modal">${vo.deptCode}</a></td>
   														
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
	</div>
</div>
	<!--------------(����,���) ��ư ------------------->
	
	<div class="modal-footer">
		<input name="delect_btn"  id="delect_btn" type="button" value="���û���" onclick="myclick()" />
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">���</button>
	</div>
			
	<!-------------- ��� ���â ����  ------------>

	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
				<div class="modal-header">
				<label>�μ����</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
					<!-- ������� �����ۼ� -->
						<label>�μ��ڵ�(*)</label> 
						<input type="text" id="deptCode" placeholder="�ڵ带 �Է��ϼ���"> 
						<input type="button" value="�ߺ�üũ" id="duplCheckbtn" name="duplCheckbtn"/> 
						<div id="dupleCode"></div>
					</div>
						<div class="form-group">
						<label>�μ���(*) </label> 
						<input style="width: 388px;" type="text" name="deptName" id="deptName" placeholder="�μ����� �Է��ϼ���"> 
					</div>	
					<div class="form-group">
						<label>ȸ�� �ڵ� </label> 
						<input style="width: 388px;" type="text" name="companyCode" id="companyCode" placeholder="ȸ���ڵ带 �Է��ϼ���"> 
					</div>
					
					</div>	
					<div class="modal-footer">
						<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">���</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
					</div>
				</div>
			</div>
		</div>
	<!-----------------�󼼺��� ���â ---------------->	
	
	<div class="modal fade" id="deptDetail" role="deptDetail" aria-hidden="true"> 
   		<div class="modal-dialog">
   			 <div class="modal-content"> 
	   			<div class="modal-header"> 
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
	   				</div>
	   			<div class="modal-footer">
	   				<c:if test="${useStatus == 0}">
						<button id="yes_Btn" name="yes_Btn" class="btn btn-default" data-dismiss="modal" value="1"  style="background: #486068; color: #ffffff">���</button>
					</c:if>	
					<c:if test="${useStatus == 1}">
						<button id="no_btn" name="no_btn"  class="btn btn-default" data-dismiss="modal" value="0" style="background: #ff8e77; color: #ffffff">�̻��</button>
					</c:if>	
	   				<button type="button" id="modalUpdateBtn" class="btn btn-default" data-dismiss="modal" >����</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
   				</div> 
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
	
	<form id="frm1" action="${pageContext.request.contextPath }/serachCards" >
		<input type="hidden" name="card_num" id="card_num" />
		<input type="hidden" name="card_name" id="card_name" />
	</form>
 	<form id="del_frm" action="${pageContext.request.contextPath }/deleteDept">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		
    <!---------------------------------------------->
	
	<script>
    /* ���  */
	$("#insertBtn").on("click", function(){
		
		var deptCode 		= $("#deptCode").val();
		var deptName  	    = $("#deptName").val();
		var companyCode		= $("#companyCode").val();
		
		$("#frmdeptCode").val(deptCode);
		$("#frmdeptName").val(deptName);
		$("#frmcompanyCode").val(companyCode);
		
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
		$("#insertFrm").submit();
	
});
	 
	$("document").ready(function() {
		
		/* �󼼺���  */
		$(".detailView").on("click", function(){
			
			$("#upd_deptCode").val($(this).data().upd_deptcode);
			$("#upd_deptName").val($(this).data().upd_deptname);
			$("#upd_companyCode").val($(this).data().upd_companycode);
			$("#upd_useStatus").val($(this).data().upd_usestatus);
		
		});
		 
		/* ���� */
		$("#modalUpdateBtn").on("click", function(){ 
			
			var deptcode  	    = $("#upd_deptCode").val();
			var deptName  	    = $("#upd_deptName").val();
			var companyCode		= $("#upd_companyCode").val();
			
			$("#frmdeptCode1").val(deptcode);
			$("#frmdeptName1").val(deptName);
			$("#frmcompanyCode1").val(companyCode);
			
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
		
	    function transDupl(dupleCode){
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
	    
	    /* �˻�  */
		function seachBtn(){
			var cardNumber = $("#cardNumber1").val();
			var cardName   = $("#cardName1").val();
			
			$("#card_num").val(cardNumber);
			$("#card_name").val(cardName);
			
			if(cardNumber === "" && cardName === ""){
				alert("ī���ȣ�� ī����� �Է��ϼ���.");
				$("card_num1").focus();
			
			}else if(cardName !== "" && cardNumber !== ""){
				$("#cardNumber1").val(cardNumber);
				$("#cardName1").val(cardName);

				$("#frm1").submit();		
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
	

 	
