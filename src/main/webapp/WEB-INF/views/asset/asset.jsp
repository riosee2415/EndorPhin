<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

.modal-content {
  height: auto;
  min-height: 70%;
  border-radius: 0;
  width: 180%;
  right: 100px;    
  top:60px; 
}

</style>

	<h2>�����ڻ� ���</h2>	
	<br>
	<br>
	�����ڻ����� <input name="deptCode1" id="deptCode1" type="text" />
	&nbsp<input type="button" id="seachBtn" value="ã��" />&nbsp&nbsp
	<input type="button" id="seachBtn" value="�˻�" /><br>
	<br>
	<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th> 
					<th>�ڻ��ڵ�</th>
					<th>������</th>
					<th>�ڻ��</th>
					<th>�μ���</th>
					<th>�����</th>
					<th>����</th>
					<th>����</th>
					<th>��氡��</th>
				</tr>
			</thead>	
			<tbody id="deptListTbody">
				<c:forEach items="${assetList }" var="vo">	
					 <tr>
						<td><input type="checkbox" name="checkRow" value="${vo.assetCode }" ></td>
						<td><a class="detailView" href="#deptDetail" data-upd_accountName="${vo.accountName }" 
																	 data-upd_assetName="${vo.assetName }"
																	 data-upd_assetName="${vo.assetName }"
																	 data-upd_acquisitionDate="${vo.acquisitionDate }"
																	 data-upd_unit="${vo.unit }"
																	 data-upd_quantity="${vo.quantity }"
																	 data-upd_acquisitionPrice="${vo.acquisitionPrice }"  
																	 data-toggle="modal">${vo.assetCode }</a></td>
   						<c:set var = "sum" value = "${sum+vo.acquisitionPrice/1.1 }" />

   						<td>${vo.assetName }</td>	
   						<td>${vo.accountName }</td>								
						<td>${vo.assetName }</td>
						<td><fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy-MM-dd"/></td>
						<td>${vo.unit }</td>
						<td>${vo.quantity }</td>
						<td>${vo.acquisitionPrice }</td>
				 	</tr>		 
				</c:forEach>
			</tbody>
			<tfoot align="center" >
				<tr>
					<td colspan="2">�ΰ��� ��ޱ� </td>
					<td colspan="2">${sum}</td>
				</tr>
			</tfoot>
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
				<label>| �����ڻ� ���</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<table>
						<tr>
							<td colspan="2"> �ڻ��ڵ�(*)</td>
							<td><input type="text" id="assetCode">
								<input type="button" value="�ߺ�üũ" id="duplCheckbtn" name="duplCheckbtn"/>
							<div id="dupleCode"></div></td> 
							<td colspan="2">�ڻ��(*)
								<input type="text" id="assetName"></td> 
						</tr>
						<tr>
							<td colspan="2" > ��������(*)
							<td><input type="text" id="accountName">
								<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="�˻�" >&nbsp;&nbsp;</td>
							<td colspan="2" > �����(*)
								<input type="text" id="acquisitionDate" ></td> 
						</tr>
						<tr>
							<td colspan="2" > �ŷ�ó(*)</td>
							<td><input type="text" id="clientName">
								<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="�˻�" >&nbsp;&nbsp;</td>
							
						</tr>
						<tr>
							<td colspan="2" > �󰢹��</td>
							<td><input type="radio" name="sanggakWay" id ="sanggakWay" value="0" checked/>���׹�
								<input type="radio" name="sanggakWay" id ="sanggakWay" value="1"/>������<td>
							<td colspan="2"> �����󰢰����ڵ�(*)
								<input type="text" id="sanggakCode">
								<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="�˻�" >&nbsp;&nbsp;	</td>
						</tr>
						<tr>
							<td colspan="2"> ����</td>
							<td><input type="text" id="unit"></td> 
							<td colspan="2">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="quantity"></td> 
						</tr>
						<tr>
							<td colspan="2"> �ܰ�</td>
							<td><input type="text" id="unitprice"></td> 
							<td colspan="2">���ݾ�(*)
								<input type="text" id="acquisitionPrice"></td> 
						</tr>
						<tr>
							<td colspan="2">����</td>
							<td><input type="text" id="jukyo"></td> 
							<td colspan="2">������ġ(*)
								<input type="text" id="residualvalue"></td> 
						</tr>
						
					</table>
					
					</div>	
					<div class="modal-footer">
						<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">���</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<!-----------------�󼼺���(����) ���â ---------------->	
	
	<div class="modal fade" id="deptDetail" role="deptDetail" aria-hidden="true"aria-labelledby="myLargeModalLabel" tabindex="-1">
   		<div class="modal-dialog"  role="document">
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
	   					<input type="text" id="upd_accountName" name="upd_accountName" readonly>
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">�μ��� (*)&nbsp;&nbsp;</label> 
	   					<input type="text" name="upd_assetName" id="upd_assetName"  > 
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">ȸ�� �ڵ� &nbsp;&nbsp;</label> 
	   					<input type="text" id="upd_companyCode" name="upd_companyCode" />
	   					<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="�˻�" >
	   				</div>
	   				
	   			<div class="modal-footer">
	   			
					<button id="yes_Btn" name="yes_Btn" class="btn btn-default" data-dismiss="modal"  value="1" style="background: #486068; color: #ffffff"></button>
	   				
	   				<button type="button" id="modalUpdateBtn" class="btn btn-default" data-dismiss="modal" >����</button>
	   			
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>

<!-----------------�������� �˻� ���â ---------------->	
	 	<!-- 80% size Modal -->
<div class="modal fade" id="my80sizeModal2" tabindex="-1"
	role="dialog" aria-labelledby="my100sizeModalLabel">
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
							<th><button type="button" class="btn btn-inverse" id="searchC_Btn">�˻�</button></th>
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
							<tr class="companyTr" data-companycode="${vo.companyCode }"
								onclick="companyTr()">
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
	
	<form id="insertFrm" action="${pageContext.request.contextPath }/insertAsset">
		<input type="hidden" id="frmAssetCode" 		 name="frmAssetCode" />
		<input type="hidden" id="frmAssetName" 		 name="frmAssetName" />
		<input type="hidden" id="frmAcquisitionDate" name="frmAcquisitionDate" />
		<input type="hidden" id="frmAccountName"  	 name="frmAccountName" />
		<input type="hidden" id="frmClientName" 	 name="frmClientName" />
		<input type="hidden" id="frmSanggakWay" 	 name="frmSanggakWay" />
		<input type="hidden" id="frmAcquisitionPrice" name="frmAcquisitionPrice" />
		
		<input type="hidden" id="frmResidualvalue"   name="frmResidualvalue" />
		<input type="hidden" id="frmUnit"	     	 name="frmUnit" />
		<input type="hidden" id="frmJukyo" 		 	 name="frmJukyo" />
		<input type="hidden" id="frmUnitprice" 		 name="frmUnitprice" />
		<input type="hidden" id="frmQuantity" 		 name="frmQuantity" />
		<input type="hidden" id="frmSanggakCode" 	 name="frmSanggakCode" />
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
    /* ���  */
	$("#insertBtn").on("click", function(){
		
		var assetCode 		 = $("#assetCode").val();
		var assetName  	     = $("#assetName").val();
		var acquisitionDate  = $("#acquisitionDate").val();
		var accountName		 = $("#accountName").val();
		var clientName		 = $("#clientName").val();
		var sanggakWay		 = $("#sanggakWay").val();
		
		var acquisitionPrice = $("#acquisitionPrice").val();
		var residualvalue	 = $("#residualvalue").val();
		var unit			 = $("#unit").val();
		var jukyo			 = $("#jukyo").val();
		var unitprice		 = $("#unitprice").val();
		var quantity		 = $("#quantity").val();
		var sanggakCode		 = $("#sanggakCode").val();
		
		$("#frmAssetCode").val(assetCode);
		$("#frmAssetName").val(assetName);
		$("#frmAcquisitionDate").val(acquisitionDate);
		$("#frmAccountName").val(accountName);
		$("#frmClientName").val(clientName);
		$("#frmSanggakWay").val(sanggakWay);
		$("#frmAcquisitionPrice").val(acquisitionPrice);
		
		$("#frmResidualvalue").val(residualvalue);
		$("#frmUnit").val(unit);
		$("#frmJukyo").val(jukyo);
		$("#frmUnitprice").val(unitprice);
		$("#frmQuantity").val(quantity);
		$("#frmSanggakCode").val(sanggakCode);
		
		
		if($("#assetCode").val().trim()==""){
			alert("�ڵ� �Է��ϼ���");
			$("#assetCode").focus();
			return false;
		}
	 
	 	
	 	$("#insertFrm").submit();
	
});
	 
	/* �÷� Ŭ������ �� input�� �� �־��ֱ�  */	
	function companyTr(){
		
		var companyCode1 = $(".companyTr").data("companycode");
		
		$("#companycode").val(companyCode1);
		
		$('.buttons').trigger('click');
		
		$("#companyCode").val($(".companyTr").data().companycode);
		
	}
	
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
	
		 $("#yes_Btn").on("click", function(){
	
			var deptcode = $("#upd_deptCode").val();
			var status 	 = $("#yes_Btn").val();
			
			alert(deptcode);
			alert($("#yes_Btn").val());
	
			$("#frm_deptCode").val(deptcode);
			$("#frm_usestatus").val(status);
			
			$("#useFrm").submit();
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
    
 	
 	/* ī���ڵ� �ߺ�üũ ajax */
	    $("#duplCheckbtn").on("click", function(){
    	
    	$.ajax({
    		url 	: "${pageContext.request.contextPath }/DupleAsset",
    		method  : "post",
    		data 	: "assetCode="+$("#assetCode").val(),
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
	    		dupleCode="<b><font color='red'>�ߺ��� �ڻ� �ڵ��Դϴ�.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>�ڻ� �ڵ带 �Է��ϼ���.</font><br>"
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
	

 	
