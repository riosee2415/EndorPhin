<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h3><i class="fa fa-calculator"></i>�����ڻ� ���</h3>	
		<table class="table table-hover">
			<thead class="thead">
			</thead>
				<tr>
					<td><label>�����ڻ����ڵ�</label> 
					<input class="form-control-xm" style="width: 250px;" name="assetCodeS" id="assetCodeS"  onkeydown="Enter_Check();" /> &nbsp
					<input type="button" id="seachBtn" value="�˻�" class="bttn-fill bttn-md bttn-warning " /></td>
				</tr>
		</table>
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th>�ڻ��ڵ�</th>
					<th>������</th>
					<th>�ڻ��</th>
					<th>�����</th>
					<th>��氡��</th>
					<th>��ιݿ�</th>
				</tr>
			</thead>	
			<tbody id="assetListTbody">
				<c:forEach items="${assetList }" var="vo">	
					 <tr>
						 <c:set var="dates" >
							<fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy/MM/dd" />
						</c:set>
						<td><a class="bttn-stretch bttn-warning detailView" href="#deptDetail" data-assetcode="${vo.assetCode }" 
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
						<td><c:if test="${vo.jangbu == null}">
						<a class="bttn-stretch bttn-warning apply" data-assetcode1="${vo.assetCode }" 
																		data-acquisitionprice1="${vo.acquisitionPrice }"
																		data-acquisitiondate1="${dates }"
																		data-clientname1="${vo.clientName }"
																		data-sanggakcode1="${vo.accountName }"
																		data-jukyo1="${vo.jukyo }"
																	    data-purchasecode1="${vo.purchaseCode }">��ιݿ�</a>
																		
						</c:if></td>
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
		<button type="button" class="bttn-jelly bttn-warning"  onclick="fn_detail();">���</button>
	</div>
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
			   <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
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
	
	function Enter_Check(){
	       
	    if(event.keyCode == 13){ // ����Ű�� �ڵ�� 13�Դϴ�.
	    	$("#searchE_Btn").click();  
	    	$("#searchC_Btn").click();  
	    	$("#searchS_Btn").click();  
	    	$("#seachBtn").click();  
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
		$('.buttons').trigger('click');
	});
	
  	/*�ŷ�ó���� */
	$(".clientTr").on("click", function() {
		var clientName = $(this).data("clientnm");

		$("#clientN").val(clientName);
		$("#clientName").val(clientName);
		$('.buttons').trigger('click');
	});
	
 	/*���� �󰢼��� */
 	$(".sanggakTr").on("click", function() {
 		var sanggakCode = $(this).data("establishcode");

 		$("#sanggakName_s").val(sanggakCode);
		$("#sanggakCode").val(sanggakCode);
 	});
     
   
	/* ��� Ŭ������ �� */
	function fn_detail(){
			$.ajax({
				url : "${pageContext.request.contextPath}/getAssetInsertBtn",
				success : function(data){
					$("#insertArea").html(data);	
					$("#assetCode").focus();
				}
			});
		} 
	
	/* �󼼺���  */
	$(".detailView").on("click", function(){
			
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
	});
	/*�ڵ� �˻�  */
	$("#seachBtn").on("click",function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/assetSearch",
			data : "assetCodeS="+$("#assetCodeS").val(),
		
			success : function(data){
				$("#assetCodeS").val("");
				$("#assetListTbody").html(data);
			}
		});
	});
	/* ��ιݿ� */
	$(".apply").on("click",function(){
		var acquisitionPrice = $(this).data().acquisitionprice1;
		
		var supplyValue = parseInt(parseInt(acquisitionPrice)/1.1);
		var surtax 	 	= parseInt(acquisitionPrice - supplyValue);
		
		var sumValue	= supplyValue + surtax;
		$.ajax({
			url:"${pageContext.request.contextPath}/applyTax_cal",
			data : "acquisitionPrice="+supplyValue
					+"&"+"acquisitionDate="+$(this).data().acquisitiondate1
					+"&"+"surtax="+surtax
					+"&"+"sumValue="+sumValue
					+"&"+"jukyo="+$(this).data().jukyo1
					+"&"+"establishCode="+$(this).data().sanggakcode1
					+"&"+"clientName="+$(this).data().clientname1
					+"&"+"purchaseCode="+$(this).data().purchasecode1
					+"&"+"assetCode="+$(this).data().assetcode1,
					
			success:function(data){
				alert("��ιݿ��� �Ϸ�Ǿ����ϴ�.");
				location.reload();
					
			}
		});
	});

	</script>
	

 	
