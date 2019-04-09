<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h2>고정자산 등록</h2>	
	<br>
	<br>
<table class="table table-striped">
	<thead class="thead">
	</thead>
		<tr>
			<td> 고정자산종류
			<input name="deptCode1" id="deptCode1" type="text" /> &nbsp
			<input type="button" id="seachBtn" value="검색" /></td>
		</tr>
</table>
<br>
	<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th> 
					<th>자산코드</th>
					<th>계정명</th>
					<th>자산명</th>
					<th>취득일</th>
					<th>취득가액</th>
					<th>장부반영</th>
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
						<td><input type="button" value="장부반영" id="applybtn" name="applybtn"/></td>
				 	</tr>
				 	<div id="insertArea"></div>
				</c:forEach>
			</tbody>
			
			<tfoot align="center" >
				<tr>
					<td colspan="2">부가세 대급금 </td>
					<td colspan="2">${sum}</td>
				</tr>
			</tfoot>
		</table>
  
	</div>
</div>
	<!--------------(삭제,등록) 버튼 ------------------->
	<div class="modal-footer">
		<button type="button" class="btn btn-primary"  onclick="fn_detail();">등록</button>
	</div>

<!-----------------계정과목 검색 모달창 ---------------->	
<div class="modal fade" id="my80sizeModal2" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header">
			<h6>| 계정과목 조회</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		  </div>
			<div class="modal-body">
			<table>
				<thead>
					<tr>
						<th>계정과목명&nbsp;&nbsp;&nbsp;
							<input type="text" id="establishNameKor" name="establishNameKor" onkeydown="Enter_Check();">
							<button type="button" class="btn btn-inverse" id="searchE_Btn" >검색</button></th>
					</tr>
					<tr>
						<th>선택된 계정과목명
							<input type="text" id="sel_account" >
							<button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">닫기</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>계정코드</th>
						<th>중분류명</th>
						<th>계정과목명</th>
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
			  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
			</div>
		</div>
	</div>
</div>
<!----------------- 거래처명 검색 모달창 ---------------->	
  <div class="modal fade" id="my80sizeModal3" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header">
			<h6>| 거래처 조회</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true" >×</button>
		  </div>
			<div class="modal-body">
			<table>
				<thead>
					<tr>
						<th>거래처명&nbsp;&nbsp;&nbsp;
						<input  type="text" id="cName" name="cName" onkeydown="Enter_Check();">
						<button type="button" class="btn btn-inverse" id="searchC_Btn">검색</button></th>
					</tr>
					<tr>
						<th>선택된 거래처명
						<input type="text" id="clientN" >
						<button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">닫기</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>코드</th>
						<th>코드명</th>
			
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
			  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<!----------------- 감가상각계정 검색 모달창 ---------------->	
   <div class="modal fade" id="my80sizeModal4" tabindex="-1" role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
          <div class="modal-header">
			<h6>| 감가상각계정 조회</h6>
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		  </div>
			<div class="modal-body">
			<table>
				<thead>
					<tr>
						<th>감가상각계정명&nbsp;&nbsp;&nbsp;
							<input type="text" id="sanggakName" name="sanggakName" onkeydown="Enter_Check();">
							<button type="button" class="btn btn-inverse" id="searchS_Btn" >검색</button></th>
					</tr>
					<tr>
						<th>선택된 감가상각계정코드
							<input type="text"  id="sanggakName_s" name="sanggakName_s" onkeydown="Enter_Check();">
							<button type="button" class="buttons"class="btn btn-default" data-dismiss="modal">닫기</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>계정코드</th>
						<th>중분류명</th>
						<th>계정과목명</th>
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
			  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
	        // 엔터키의 코드는 13입니다.
	    if(event.keyCode == 13){
	    	$("#searchE_Btn").click();  // 실행할 이벤트
	    }
	    if(event.keyCode == 13){
	    	$("#searchC_Btn").click();  // 실행할 이벤트
	    }
	    if(event.keyCode == 13){
	    	$("#searchS_Btn").click();  // 실행할 이벤트
	    }
	}
    /*계정과목 검색  */
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
    
    /* 거래처검색  */
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
    /* 감가상각계정 검색  */
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
 
     /*계정과목선택 */
	$(".establishTr").on("click", function(){
		
		var establishnamekor = $(this).data("establishnmkor");
		
		$("#sel_account").val(establishnamekor);
		$("#accountName").val(establishnamekor);
	});
	
  	/*거래처선택 */
	$(".clientTr").on("click", function() {
		var clientName = $(this).data("clientnm");

		$("#clientN").val(clientName);
		$("#clientName").val(clientName);
	});
	
 	/*감가 상각선택 */
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
	
	/* 전체선택삭제 */
	function allCheck() {
		if ($("#th_allCheck").is(':checked')) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}

	/* 선택삭체*/
	function myclick() {
		var checkRow = '';
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val()+",";
		});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
			$("#checkRow").val(checkRow);
			
		if(checkRow === ""){		
			alert("삭제할 대상을 선택하세요");
			return false;
		}
				$("#del_frm").submit();
	}
   
	/* 등록 클릭했을 때 */
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
	

 	
