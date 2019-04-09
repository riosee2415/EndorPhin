<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h2>�����ڻ� ���</h2>	
	<br>
	<br>
<table class="table table-striped">
	<thead class="thead">
	</thead>
		<tr>
			<td> �����ڻ�����
			<input name="deptCode1" id="deptCode1" type="text" /> &nbsp
			<input type="button" id="seachBtn" value="�˻�" /></td>
		</tr>
</table>
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
					<th>�����</th>
					<th>��氡��</th>
					<th>��ιݿ�</th>
				</tr>
			</thead>	
			<tbody id="deptListTbody">
				<c:forEach items="${assetList }" var="vo">	
					 <tr>
						<td><input type="checkbox" name="checkRow"  value="${vo.assetCode }" ></td>
						<td><a class="detailView" href="#deptDetail" data-assetcode="${vo.assetCode }" 
																	 data-acquisitiondate="${vo.acquisitionDate }"
																	 data-purchasecode="${vo.purchaseCode }"
																	 data-sanggakway="${vo.sanggakWay }"
																	 data-acquisitionprice="${vo.acquisitionPrice }"
																	 data-accountname="${vo.accountName }"
																	 data-clientname="${vo.clientName }"  
																	 data-assetname="${vo.assetName }"
																	 data-residualvalue="${vo.residualvalue }"
																	 data-jukyo="${vo.jukyo }"
																	 data-sanggakcode="${vo.sanggakCode }"
																	 data-depreciation="${vo.depreciation }"
																	 data-accumulated="${vo.accumulated }" 
																	 data-toggle="modal">${vo.assetCode }</a></td>
   						<c:set var = "sum" value = "${sum+vo.acquisitionPrice/1.1 }" />
   						<td>${vo.assetName }</td>	
   						<td>${vo.accountName }</td>								
						<td><fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy-MM-dd"/></td>
						<td>${vo.acquisitionPrice }</td>
						<td><input type="button" value="��ιݿ�" id="applybtn" name="applybtn"/></td>
				 	</tr>
				 	<div id="insertArea"></div>
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
		<button type="button" class="btn btn-primary"  onclick="fn_detail();">���</button>
	</div>

<!-----------------�������� �˻� ���â ---------------->	
<div class="modal fade" id="my80sizeModal2" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header">
			<h6>| �������� ��ȸ</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
		  </div>
			<div class="modal-body">
			<table>
				<thead>
					<tr>
						<th>���������&nbsp;&nbsp;&nbsp;
							<input type="text" id="establishNameKor" name="establishNameKor" onkeydown="Enter_Check();">
							<button type="button" class="btn btn-inverse" id="searchE_Btn" >�˻�</button></th>
					</tr>
					<tr>
						<th>���õ� ���������
							<input type="text" id="sel_account" >
							<button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">�ݱ�</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>�����ڵ�</th>
						<th>�ߺз���</th>
						<th>���������</th>
				</thead>
				<tbody id="establishTbody">
				<c:forEach items="${establishList }" var="vo">
					<tr class="establishTr" data-establishnmkor="${vo.establishNameKor }">
						<td>${vo.establishCode}</td>
						<td>${vo.status}</td>
						<td>${vo.establishNameKor}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			  <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
		</div>
	</div>
</div>
<!----------------- �ŷ�ó�� �˻� ���â ---------------->	
  <div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header">
			<h6>| �ŷ�ó ��ȸ</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true" >��</button>
		  </div>
			<div class="modal-body">
			<table>
				<thead>
					<tr>
						<th>�ŷ�ó��&nbsp;&nbsp;&nbsp;
						<input  type="text" id="cName" name="cName" onkeydown="Enter_Check();">
						<button type="button" class="btn btn-inverse" id="searchC_Btn">�˻�</button></th>
					</tr>
					<tr>
						<th>���õ� �ŷ�ó��
						<input type="text" id="clientN" >
						<button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">�ݱ�</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>�ڵ�</th>
						<th>�ڵ��</th>
			
				</thead>
				<tbody id="clinetTbody">
				<c:forEach items="${clientList }" var="vo">
					<tr class="clientTr" data-clientnm="${vo.clientName }">
						<td>${vo.clientCode}</td>
						<td>${vo.clientName}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			  <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
			</div>
		</div>
	</div>
</div>


<!----------------- �����󰢰��� �˻� ���â ---------------->	
   <div class="modal fade" id="my80sizeModal4" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header">
			<h6>| �����󰢰��� ��ȸ</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
		  </div>
			<div class="modal-body">
			<table>
				<thead>
					<tr>
						<th>�����󰢰�����&nbsp;&nbsp;&nbsp;
							<input type="text" id="sanggakName" name="sanggakName" onkeydown="Enter_Check();">
							<button type="button" class="btn btn-inverse" id="searchS_Btn" >�˻�</button></th>
					</tr>
					<tr>
						<th>���õ� �����󰢰����ڵ�
							<input type="text"  id="sanggakName_s" name="sanggakName_s" onkeydown="Enter_Check();">
							<button type="button" class="buttons"class="btn btn-default" data-dismiss="modal">�ݱ�</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>�����ڵ�</th>
						<th>�ߺз���</th>
						<th>���������</th>
				</thead>
					<tbody id="sanggakTbody">
				<c:forEach items="${establishList }" var="vo">
					<tr class="sanggakTr" data-establishcode="${vo.establishCode }">
						<td>${vo.establishCode}</td>
						<td>${vo.status}</td>
						<td>${vo.establishNameKor}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			  <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
		</div>
	</div>
</div>

	<script>
	
	$("document").ready(function() {
	
		 $("#yes_Btn").on("click", function(){
	
			var deptcode = $("#upd_deptCode").val();
			var status 	 = $("#yes_Btn").val();
			
			alert(deptcode);
			alert($("#yes_Btn").val());
	
			$("#frm_deptCode").val(deptcode);
			$("#frm_usestatus").val(status);
			
			$("#useFrm").submit();
		});  
	});	
	
	function Enter_Check(){
	        // ����Ű�� �ڵ�� 13�Դϴ�.
	    if(event.keyCode == 13){
	    	$("#searchE_Btn").click();  // ������ �̺�Ʈ
	    }
	    if(event.keyCode == 13){
	    	$("#searchC_Btn").click();  // ������ �̺�Ʈ
	    }
	    if(event.keyCode == 13){
	    	$("#searchS_Btn").click();  // ������ �̺�Ʈ
	    }
	}
    /*�������� �˻�  */
 	$("#searchE_Btn").on("click", function(){
 		$.ajax({
 			url : "${pageContext.request.contextPath }/establishSearch",
 			data : "establishNameKor="+$("#establishNameKor").val(),
 			success : function(data){
 				$("#establishNameKor").val("");
 				$("#establishTbody").html(data);
 			}
  		});
 	});
    
    /* �ŷ�ó�˻�  */
 	$("#searchC_Btn").on("click", function(){
 		$.ajax({
 			url : "${pageContext.request.contextPath }/clientSearch",
 			data : "cName="+$("#cName").val(),
 			success : function(data){
 				$("#cName").val("");
 				$("#clinetTbody").html(data);
 			}
  		});
 	});
    /* �����󰢰��� �˻�  */
 	$("#searchS_Btn").on("click", function(){
 		$.ajax({
 			url : "${pageContext.request.contextPath }/sanggakSearch",
 			data : "sanggakName="+$("#sanggakName").val(),
 			success : function(data){
 				$("#sanggakName").val("");
 				$("#sanggakTbody").html(data);
 			}
  		});
 	});
 
     /*���������� */
	$(".establishTr").on("click", function(){
		
		var establishnamekor = $(this).data("establishnmkor");
		
		$("#sel_account").val(establishnamekor);
		$("#accountName").val(establishnamekor);
	});
	
  	/*�ŷ�ó���� */
	$(".clientTr").on("click", function() {
		var clientName = $(this).data("clientnm");

		$("#clientN").val(clientName);
		$("#clientName").val(clientName);
	});
	
 	/*���� �󰢼��� */
 	$(".sanggakTr").on("click", function() {
 		var sanggakCode = $(this).data("establishcode");

 		$("#sanggakName_s").val(sanggakCode);
		$("#sanggakCode").val(sanggakCode);
 	});
     
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
   
	/* ��� Ŭ������ �� */
	var insertFlag = 0;
	function fn_detail(){
		if (insertFlag === 0) {
			$.ajax({
				url : "${pageContext.request.contextPath}/getAssetInsertBtn",
				success : function(data){
					$("#insertArea").html(data);	
					$("#assetCode").focus();
				}
			});
		
			insertFlag = 1;
			
		} else if(insertFlag == 1){
			$("#insertArea").html("");
			insertFlag = 0;
		}
	}
	

	$(".detailView").on("click", function(){
		
		if (insertFlag === 0) {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getAssetModifyBtn",
				data : "assetCode="+ $(this).data().assetcode,
						
				
				success : function(data){
					$("#insertArea").html(data);	
					$("#assetCode").focus();
					$("#assetCode").val($(this).data().assetcode);
					$("#purchaseCode").val($(this).data().purchasecode);
					$("#sanggakWay").val($(this).data().sanggakway);
					$("#acquisitionPrice").val($(this).data().acquisitionprice);
					$("#acquisitionDate").val($(this).data().acquisitiondate);
				}
			});
		
			insertFlag = 1;
			
		} else if(insertFlag == 1){
			$("#insertArea").html("");
			insertFlag = 0;
		}
		
		
		
	});

	</script>
	

 	
