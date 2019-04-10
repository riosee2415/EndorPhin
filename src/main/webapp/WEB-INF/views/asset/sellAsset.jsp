<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
	<h2><i class="fa fa-calculator"></i>고정자산 매각</h2>
		<div class="container">	
		<table class="table">
			<tr>
				<td><h4><strong>계정명</strong></h4></td>
				<td colspan="3"><input class="form-control" name="deptCode1" id="deptCode1" type="text" placeholder="Search"/></td>
				<td><input class="bttn-fill bttn-warning" type="button" id="seachBtn" value="검색" /></td>
			</tr>
		</table>
		</div>
		<table class="table table-hover">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th> 
					<th>자산코드</th>
					<th>유형</th>
					<th>계정명</th>
					<th>자산명</th>
					<th>매각/폐기일</th>
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
  
		<button type="button" class="bttn-jelly bttn-warning"  onclick="fn_detail();">등록</button>
	</div>
</div>
	<!--------------(삭제,등록) 버튼 ------------------->


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
					<tr>
						<th><input type="text" id="clientN" ></th>
						<th><button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">닫기</button></th>
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
					<tr class="clientTr" data-client="${vo.clientCode }" onclick="clientTr()">
						<td>${vo.clientCode}</td>
						<td>${vo.clientName}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			  <button type="button" class="btn btn-default" data-dismiss="modal">장부반영</button>
			</div>
		</div>
	</div>
</div>

	<script>

	
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
   
	</script>

 	
    