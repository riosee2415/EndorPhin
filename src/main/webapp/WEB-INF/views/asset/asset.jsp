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
					<th>부서명</th>
					<th>취득일</th>
					<th>단위</th>
					<th>수량</th>
					<th>취득가액</th>
					<th>장부반영</th>
				</tr>
			</thead>	
			<tbody id="deptListTbody">
				<c:forEach items="${assetList }" var="vo">	
					 <tr>
						<td><input type="checkbox" name="checkRow" value="${vo.assetCode }" ></td>
						<td><a class="detailView" onclick="fn_detail_tr();" href="#deptDetail1" data-upd_accountName="${vo.accountName }" 
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
		<!-- <input name="delect_btn"  id="delect_btn" type="button" value="선택삭제" onclick="myclick()" /> -->
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
						<th>계정과목명&nbsp;</th>
						<th><input style="width: 150px;" type="text" class="form-control" id="establishNameKor" name="establishNameKor" onkeydown="Enter_Check();"></th>
						<th><button type="button" class="btn btn-inverse" id="searchE_Btn" >검색</button></th>
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
					<tr class="establishTr" data-establishCode="${vo.establishCode }"
						onclick="establishTr()">
						
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
			<button id="secondAddClose1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		  </div>
			<div class="modal-body">
			<table>
				<thead>
					<tr>
						<th>거래처명&nbsp;</th>
						<th><input style="width: 150px;" type="text" class="form-control" id="establishNameKor" name="establishNameKor"></th>
						<th><button type="button" class="btn btn-inverse" id="searchE_Btn">검색</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>코드</th>
						<th>코드명</th>
				</thead>
				<tbody id="establishTbody">
				<c:forEach items="${clientList }" var="vo">
					<tr class="establishTr" data-establishCode="${vo.clientCode }" onclick="establishTr()">
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
						<th>감가상각계정명&nbsp;</th>
						<th><input style="width: 150px;" type="text" class="form-control" id="sanggakName" name="sanggakName"></th>
						<th><button type="button" class="btn btn-inverse" id="searchE_Btn">검색</button></th>
					</tr>
			</table>  <br>
			<div style="overflow:scroll; width:450px; height:200px;">
			<table class="table table-sm">
				<thead class="thead">
					<tr>
						<th>코드</th>
						<th>코드명</th>
				</thead>
				<tbody id="establishTbody">
				<c:forEach items="${establishList }" var="vo">
					<tr class="establishTr" data-establishCode="${vo.establishCode }"
						onclick="establishTr()">
						
						<td>${vo.establishCode}</td>
						<td>${vo.status}</td>
						<td>${vo.establishNameKor}</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

		
	<!---------------등록, 검색, 삭제  ---------------->
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
  
	/* 등록  */
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
			alert("코드 입력하세요");
			$("#assetCode").focus();
			return false;
		}
	 	
	 	$("#insertFrm").submit();
	
});
	 
	/* 컬럼 클릭했을 때 input에 값 넣어주기  */	
	function companyTr(){
		
		var companyCode1 = $(".companyTr").data("companycode");
		
		$("#companycode").val(companyCode1);
		
		$('.buttons').trigger('click');
		
		$("#companyCode").val($(".companyTr").data().companycode);
		
	}
	
	$("document").ready(function() {
		
		/* 상세보기  */
		$(".detailView").on("click", function(){
			
			$("#upd_deptCode").val($(this).data().upd_deptcode);
			$("#upd_deptName").val($(this).data().upd_deptname);
			$("#upd_companyCode").val($(this).data().upd_companycode);
			
			if($(this).data().upd_usestatus==1){
				$("#yes_Btn").html("미사용");
				
			}
			else if($(this).data().upd_usestatus==0){
				$("#yes_Btn").html("사용");
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
		
		/* 수정 */
		$("#modalUpdateBtn").on("click", function(){ 
			
			var deptcode  	    = $("#upd_deptCode").val();
			var deptName  	    = $("#upd_deptName").val();
			var companyCode		= $("#upd_companyCode").val();
			
			
			$("#frmdeptCode1").val(deptcode);
			$("#frmdeptName1").val(deptName);
			$("#frmcompanyCode1").val(companyCode);
			
			if($("#upd_deptName").val().trim()==""){
				alert("부서명을 입력하세요");
				$("#upd_deptName").focus();
				return false;
			}
		 	
			if($("#upd_companyCode").val().trim()==""){
				alert("회사코드를 선택하세요");
				$("#upd_companyCode").focus();
				return false;
		}  
	 	
 		$("#updateFrm").submit();
    });
});	

	function Enter_Check(){
	        // 엔터키의 코드는 13입니다.
	    if(event.keyCode == 13){
	    	$("#searchE_Btn").click();  // 실행할 이벤트
	    }
	}
    /*계정과목 검색  */
 	$("#searchE_Btn").on("click", function(){
 		if($("#establishNameKor").val().trim()==""){
 			alert("회사명을 입력하세요.");
 			$("establishNameKor").focus();
 			return false;
 		}
 		$.ajax({
 			url : "${pageContext.request.contextPath }/establishSearch",
 			data : "establishNameKor="+$("#establishNameKor").val(),
 			success : function(data){
 				$("#establishNameKor").val("");
 				$("#establishTbody").html(data);
 			}
  		});
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
    
	/* 테이블 코드 클릭했을 때 */
	
	var insertFlag = 0;
	function fn_detail(){
		if (insertFlag === 0) {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/getAssetInsertBtn",
				success : function(data){
					$("#insertArea").html(data);					
				}
			});
			insertFlag = 1;
			
		} else if(insertFlag == 1){
			$("#insertArea").html("");
			insertFlag = 0;
		}
	}
	
	</script>
	

 	
