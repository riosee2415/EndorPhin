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

	<h2>고정자산 등록</h2>	
	<br>
	<br>
	고정자산종류 <input name="deptCode1" id="deptCode1" type="text" />
	&nbsp<input type="button" id="seachBtn" value="찾기" />&nbsp&nbsp
	<input type="button" id="seachBtn" value="검색" /><br>
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
					<td colspan="2">부가세 대급금 </td>
					<td colspan="2">${sum}</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
	<!--------------(삭제,등록) 버튼 ------------------->
	
	<div class="modal-footer">
		<input name="delect_btn"  id="delect_btn" type="button" value="선택삭제" onclick="myclick()" />
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">등록</button>
	</div>
			
	<!-------------- 등록 모달창 띄우기  ------------>

	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
				<div class="modal-header">
				<label>| 고정자산 등록</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<table>
						<tr>
							<td colspan="2"> 자산코드(*)</td>
							<td><input type="text" id="assetCode">
								<input type="button" value="중복체크" id="duplCheckbtn" name="duplCheckbtn"/>
							<div id="dupleCode"></div></td> 
							<td colspan="2">자산명(*)
								<input type="text" id="assetName"></td> 
						</tr>
						<tr>
							<td colspan="2" > 계정과목(*)
							<td><input type="text" id="accountName">
								<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="검색" >&nbsp;&nbsp;</td>
							<td colspan="2" > 취득일(*)
								<input type="text" id="acquisitionDate" ></td> 
						</tr>
						<tr>
							<td colspan="2" > 거래처(*)</td>
							<td><input type="text" id="clientName">
								<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="검색" >&nbsp;&nbsp;</td>
							
						</tr>
						<tr>
							<td colspan="2" > 상각방법</td>
							<td><input type="radio" name="sanggakWay" id ="sanggakWay" value="0" checked/>정액법
								<input type="radio" name="sanggakWay" id ="sanggakWay" value="1"/>정률법<td>
							<td colspan="2"> 감가상각계정코드(*)
								<input type="text" id="sanggakCode">
								<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="검색" >&nbsp;&nbsp;	</td>
						</tr>
						<tr>
							<td colspan="2"> 단위</td>
							<td><input type="text" id="unit"></td> 
							<td colspan="2">수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="quantity"></td> 
						</tr>
						<tr>
							<td colspan="2"> 단가</td>
							<td><input type="text" id="unitprice"></td> 
							<td colspan="2">취득금액(*)
								<input type="text" id="acquisitionPrice"></td> 
						</tr>
						<tr>
							<td colspan="2">적요</td>
							<td><input type="text" id="jukyo"></td> 
							<td colspan="2">잔존가치(*)
								<input type="text" id="residualvalue"></td> 
						</tr>
						
					</table>
					
					</div>	
					<div class="modal-footer">
						<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<!-----------------상세보기(수정) 모달창 ---------------->	
	
	<div class="modal fade" id="deptDetail" role="deptDetail" aria-hidden="true"aria-labelledby="myLargeModalLabel" tabindex="-1">
   		<div class="modal-dialog"  role="document">
   			 <div class="modal-content"> 
	   			<div class="modal-header"> 
	   				<label>| 부서등록</label>
	   				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	   				<h4 class="modal-title" id="myModalLabel"></h4>
	   			</div> 
	   			<div class="modal-body"> 
	   				<div class="form-group">
	   					<label for="InputEmail">부서코드(*)</label> 
	   					<input type="text" id="upd_accountName" name="upd_accountName" readonly>
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">부서명 (*)&nbsp;&nbsp;</label> 
	   					<input type="text" name="upd_assetName" id="upd_assetName"  > 
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">회사 코드 &nbsp;&nbsp;</label> 
	   					<input type="text" id="upd_companyCode" name="upd_companyCode" />
	   					<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="검색" >
	   				</div>
	   				
	   			<div class="modal-footer">
	   			
					<button id="yes_Btn" name="yes_Btn" class="btn btn-default" data-dismiss="modal"  value="1" style="background: #486068; color: #ffffff"></button>
	   				
	   				<button type="button" id="modalUpdateBtn" class="btn btn-default" data-dismiss="modal" >수정</button>
	   			
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>

<!-----------------계정과목 검색 모달창 ---------------->	
	 	<!-- 80% size Modal -->
<div class="modal fade" id="my80sizeModal2" tabindex="-1"
	role="dialog" aria-labelledby="my100sizeModalLabel">
	<div class="modal-dialog modal-80size" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<h6>| 계정과목 조회</h6>
			</div>
			<div class="modal-body">
				<div class="form-group"></div>
				<table>
					<thead>
						<tr>
							<th>회사명&nbsp;</th>
							<th><input style="width: 150px;" type="text" class="form-control" id="companyName" name="companyName"></th>
							<th><button type="button" class="btn btn-inverse" id="searchC_Btn">검색</button></th>
						</tr>
						
				</table>  <br>
				<table class="table table-sm">
					<thead class="thead">
						<tr>
							<th>회사 코드</th>
							<th>회사명</th>
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
			  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
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
	
    /*회사이름 검색  */
 	$("#searchC_Btn").on("click", function(){
 		if($("#companyName").val().trim()==""){
 			alert("회사명을 입력하세요.");
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
    
 	
 	/* 카드코드 중복체크 ajax */
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
	    		dupleCode ="<b><font color='blue'>사용가능한 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "1"){
	    		dupleCode="<b><font color='red'>중복된 자산 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>자산 코드를 입력하세요.</font><br>"
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
    

	
	</script>
	

 	
