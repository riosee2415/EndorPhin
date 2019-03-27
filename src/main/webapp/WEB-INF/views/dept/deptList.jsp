<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--테이블 리스트출력  -->
	<h2>부서 등록</h2>	
	<br>
	<br>
	부서코드 &nbsp <input name="deptCode1" id="deptCode1" type="text" />
	&nbsp 부서명 &nbsp<input name="deptName1" id="deptName1" type="text" />
	&nbsp<input type="button" id="seachBtn" value="검색" onclick="seachBtn()" /><br>
	<br>
	<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<td><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></td> 
					<th>부서코드</th>
					<th>부서명</th>
					<th>회사명</th>
					<th>사용구분</th>
					<th>비고</th>
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
								<td>사용</td>
							</c:when>
							<c:otherwise>
								<td><font color="red"> 미사용</font></td>
							</c:otherwise>
						</c:choose>
						<td></td>
				 	</tr>		 
				</c:forEach>
			</tbody>
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
				<label>부서등록</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
					<!-- 여기부터 로직작성 -->
						<label>부서코드(*)</label> 
						<input type="text" id="deptCode" placeholder="코드를 입력하세요"> 
						<input type="button" value="중복체크" id="duplCheckbtn" name="duplCheckbtn"/> 
						<div id="dupleCode"></div>
					</div>
						<div class="form-group">
						<label>부서명(*) </label> 
						<input style="width: 388px;" type="text" name="deptName" id="deptName" placeholder="부서명을 입력하세요"> 
					</div>	
					<div class="form-group">
						<label>회사 코드 </label> 
						<input style="width: 388px;" type="text" name="companyCode" id="companyCode" placeholder="회사코드를 입력하세요"> 
					</div>
					
					</div>	
					<div class="modal-footer">
						<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	<!-----------------상세보기 모달창 ---------------->	
	
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
	   					<label for="InputEmail">부서코드(*)</label> 
	   					<input type="text" id="upd_deptCode" name="upd_deptCode" readonly>
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">부서명 (*)&nbsp;&nbsp;</label> 
	   					<input type="text" name="upd_deptName" id="upd_deptName"  > 
	   				</div>
	   					<div class="form-group">
	   					<label for="InputEmail">회사 코드 &nbsp;&nbsp;</label> 
	   					<input type="text" id="upd_companyCode" name="upd_companyCode" />
	   				</div>
	   			<div class="modal-footer">
	   				<c:if test="${useStatus == 0}">
						<button id="yes_Btn" name="yes_Btn" class="btn btn-default" data-dismiss="modal" value="1"  style="background: #486068; color: #ffffff">사용</button>
					</c:if>	
					<c:if test="${useStatus == 1}">
						<button id="no_btn" name="no_btn"  class="btn btn-default" data-dismiss="modal" value="0" style="background: #ff8e77; color: #ffffff">미사용</button>
					</c:if>	
	   				<button type="button" id="modalUpdateBtn" class="btn btn-default" data-dismiss="modal" >수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>
	<!---------------등록, 검색, 삭제  ---------------->
	
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
    /* 등록  */
	$("#insertBtn").on("click", function(){
		
		var deptCode 		= $("#deptCode").val();
		var deptName  	    = $("#deptName").val();
		var companyCode		= $("#companyCode").val();
		
		$("#frmdeptCode").val(deptCode);
		$("#frmdeptName").val(deptName);
		$("#frmcompanyCode").val(companyCode);
		
		if($("#deptName").val().trim()==""){
			alert("부서명을 입력하세요");
			$("#deptName").focus();
			return false;
		}
	 	if($("#companyCode").val().trim()==""){
			alert("회사코드를 선택하세요");
			$("#companyCode").focus();
			return false;
		} 
		$("#insertFrm").submit();
	
});
	 
	$("document").ready(function() {
		
		/* 상세보기  */
		$(".detailView").on("click", function(){
			
			$("#upd_deptCode").val($(this).data().upd_deptcode);
			$("#upd_deptName").val($(this).data().upd_deptname);
			$("#upd_companyCode").val($(this).data().upd_companycode);
			$("#upd_useStatus").val($(this).data().upd_usestatus);
		
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
	    
    /* 카드코드 중복체크 ajax */
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
	    		dupleCode ="<b><font color='blue'>사용가능한 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "1"){
	    		dupleCode="<b><font color='red'>중복된 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>부서 코드를 입력하세요.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}
	    }  
	    
	    /* 검색  */
		function seachBtn(){
			var cardNumber = $("#cardNumber1").val();
			var cardName   = $("#cardName1").val();
			
			$("#card_num").val(cardNumber);
			$("#card_name").val(cardName);
			
			if(cardNumber === "" && cardName === ""){
				alert("카드번호와 카드명을 입력하세요.");
				$("card_num1").focus();
			
			}else if(cardName !== "" && cardNumber !== ""){
				$("#cardNumber1").val(cardNumber);
				$("#cardName1").val(cardName);

				$("#frm1").submit();		
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
	

 	
