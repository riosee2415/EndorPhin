<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>매입매출전표 관리3</h2>
<hr>

<!-- 키 값으로 하나만 출력하기
	<c:out value="${scCode['11'] }" />
 -->

<center>
<!-- 뷰 폼 시작-->
<table class="table table-striped">
		<tr>
			<td style="width: 150px;">ddaa24</td>
			<td style="width: 300px;"><input type="text" /></td>

			<td style="width: 150px;">dd</td>
			<td style="width: 300px;"><input type="text" /></td>
		</tr>
	</table>
	
	
<div>
	<table>
		<thead class="thead">
			<tr style="text-align: center;">
				<td style="width: 150px;">날짜</td>
				<td style="width: 100px;">구분</td>
				<td style="width: 120px;">공급가액</td>
				<td style="width: 120px;">부가세</td>
				<td style="width: 150px;">공급대가</td>
				<td style="width: 150px;">거래처</td>
				<td style="width: 150px;">사용부서</td>
				<td style="width: 150px;">발주번호</td>
				<td style="width: 80px;">전자</td>
				<td style="width: 80px;">분개</td>
			</tr>
		</thead>
		<tbody id="establishListTbody">
		</tbody>
	</table>

	<c:set var="lastPage"
		value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

	<nav style="text-align: center;">
		<ul id="pagination" class="pagination">
		</ul>
	</nav>
</div>
<hr>
<!-- 뷰 폼 끝-->


<!-- 입력 폼 시작-->
<table>
		<thead class="thead2">
			<tr style="text-align: center;">
				<td style="width: 100px;">날짜</td>
				<td style="width: 80px;">구분</td>
				<td style="width: 100px;">공급가액</td>
				<td style="width: 100px;">부가세</td>
				<td style="width: 100px;">공급대가</td>
				<td style="width: 100px;">거래처</td>
				<td style="width: 110px;">사용부서</td>
				<td style="width: 100px;">발주번호</td>
				<td style="width: 65px;">전자</td>
				<td style="width: 65px;">분개</td>
			</tr>
		</thead>
			<tr>
				<td><input style="width: 100px;" type="text" /></td> <!-- 날짜 -->
				<td><input id="insertSalesStatus" style="width: 80px;" type="text" /></td> <!-- 구분 -->
				<td><input id="insertSupplyValue" style="width: 100px;" type="text" readonly/></td>  <!-- 공급가액 -->
				<td><input id="insertSurTax" style="width: 100px;" type="text" readonly/></td>  <!-- 부가세 -->
				<td><input id="insertSumValue" style="width: 100px;" type="text" /></td>  <!-- 공급대가 -->
				<td><input id="insertClient" style="width: 100px;" type="text" /></td> <!-- 거래처 -->
				<td><input id="insertDept" style="width: 100px;" type="text" placeholder="미등록"/></td> <!-- 사용부서 -->
				<td><input id="insertOrderCode" style="width: 100px;" type="text" /></td>  <!-- 발주번호 -->
				<td><input id="insertAuto" style="width: 60px;" type="text" /></td> <!-- 전자 -->
				<td><input id="insertSlipType" style="width: 60px;" type="text" /></td> <!-- 분개 -->
			</tr>
</table>
<!-- 입력 폼 끝 -->

</center>


<!-- 매입매출코드 시작 -->
<hr>
<b>매입코드</b> 
<table border="1">
	<tr> 
		<td style="font-size: 12px;">
			<c:forEach var="ph" items="${phCode}" varStatus="status"> 
					<b><font class="phKey" color="blue">${ph.key}</font></b> = 
					<span class="phValue">${ph.value}</span>||
			</c:forEach>
		</td> 
	</tr> 
</table>




<br /> <br />
<b>매출코드</b> <br />
<table border="1">
	<tr> 
		<td style="font-size: 12px;">
			<c:forEach var="sc" items="${scCode}" varStatus="status"> 
					<b><font class="scKey" color="red">${sc.key}</font></b>  =
					<span class="scValue">${sc.value}</span> ||
			</c:forEach>
		</td> 
	</tr> 
</table>
<!-- 매입매출코드 끝 -->


<!-- 전자여부 시작-->
<br /> <br />
<b>전자여부</b> <br />
<table border="1">
	<tr>
		<td style="font-size: 12px;"><b><font color="green">0</font></b> = 일반 || <b><font color="green">1</font></b> = 전자</td>
	</tr>
</table>
<!-- 전자여부 끝-->


<!-- 분개유형 시작-->
<br /> <br />
<b>분개유형</b> <br />
<table border="1">
	<tr>
		<td style="font-size: 12px;"><b><font color="orange">1</font></b> =  현금 || <b><font color="orange">2</font></b> = 외상 || <b><font color="orange">3</font></b> = 혼합 || <b><font color="orange">4</font></b> = 카드</td>
	</tr>
</table>
<!-- 분개유형 끝-->






<!-- hidden input Area 시작-->
<input type="hidden" id="client_hidden" data-toggle="modal" data-target="#client_search"/>
<input type="hidden" id="dept_hidden" data-toggle="modal" data-target="#dept_search"/>
<input type="hidden" id="orderCode_hidden" data-toggle="modal" data-target="#orderCode_search"/>

<!-- hidden input Area 끝-->






<!-- Modal Area 시작-->
	<!-- 거래처 검색 modal window -->
  	<div class="modal modal-center fade" id="client_search" tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel"> 
	   		<div class="modal-dialog modal-80size modal-center" role="document">
	   			 <div class="modal-content modal-80size"> 
		   			<div class="modal-header"> 
		   				<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
		   				<h4 class="modal-title" id="myModalLabel">거래처 검색</h4>
		   			</div> 
		   			
		   			<div class="modal-body"> 
		   				<div class="form-group">
		   					<label for="InputEmail">거래처 이름&nbsp;&nbsp;&nbsp;</label> 
		   					<input type="text" id="client_searchArea" name="client_searchArea" />
		   					<input type="button" id="client_searchAreaBtn" name="client_searchAreaBtn" value="검색"/>
		   				</div>
		   				
		   				<div class="form-group">
		   					<label for="InputEmail">현재선택된 거래처&nbsp;&nbsp;&nbsp;</label> 
		   					<input type="text" id="client_valuehArea" name="client_valuehArea" readonly/>
		   					<button type="button" class="btn btn-primary" id="client_valuehAreaBtn" class="btn valuehAreaBtn" data-dismiss="modal" >확인</button>
		   				</div>
		   				
		   				<div id="client_searchDataArea">
		   				</div>
		   				
		   			</div> 
		   			
		   			<div class="modal-footer">
	   				</div> 
	   				
	   			</div> 
	   		</div> 
	   </div>
	   
	   
	   
	<!-- 부서 검색 modal window -->
  	<div class="modal modal-center fade" id="dept_search" tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel"> 
	   		<div class="modal-dialog modal-80size modal-center" role="document">
	   			 <div class="modal-content modal-80size"> 
		   			<div class="modal-header"> 
		   				<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
		   				<h4 class="modal-title" id="myModalLabel">부서 검색</h4>
		   			</div> 
		   			
		   			<div class="modal-body"> 
		   				<div class="form-group">
		   					<label for="InputEmail">부서명&nbsp;&nbsp;&nbsp;</label> 
		   					<input type="text" id="dept_searchArea" name="dept_searchArea" />
		   					<input type="button" id="dept_searchAreaBtn" name="dept_searchAreaBtn" value="검색"/>
		   				</div>
		   				
		   				<div class="form-group">
		   					<label for="InputEmail">선택부서&nbsp;&nbsp;</label> 
		   					<input type="text" id="dept_valuehArea" name="dept_valuehArea" readonly/>
		   					<button type="button" class="btn btn-primary" id="dept_valuehAreaBtn" class="btn valuehAreaBtn" data-dismiss="modal" >확인</button>
		   				</div>
		   				
		   				<div id="dept_searchDataArea">
		   				</div>
		   				
		   			</div> 
		   			
		   			<div class="modal-footer">
	   				</div> 
	   				
	   			</div> 
	   		</div> 
	   </div>
	   
	   
	   
	   
	<!-- 발주번호 검색 modal window -->
  	<div class="modal modal-center fade" id="orderCode_search" tabindex="4" role="dialog" aria-labelledby="my80sizeCenterModalLabel"> 
	   		<div class="modal-dialog modal-80size modal-center" role="document">
	   			 <div class="modal-content modal-80size"> 
		   			<div class="modal-header"> 
		   				<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
		   				<h4 class="modal-title" id="myModalLabel">발주번호 검색</h4>
		   			</div> 
		   			
		   			<div class="modal-body"> 
		   				<div class="form-group">
		   					<label for="InputEmail">발주번호&nbsp;&nbsp;&nbsp;</label> 
		   					<input type="text" id="orderCode_searchArea" name="orderCode_searchArea" />
		   					<input type="button" id="orderCode_searchAreaBtn" name="orderCode_searchAreaBtn" value="검색"/>
		   				</div>
		   				
		   				<div class="form-group">
		   					<label for="InputEmail">선택부서&nbsp;&nbsp;</label> 
		   					<input type="text" id="orderCode_valuehArea" name="orderCode_valuehArea" readonly/>
		   					<button type="button" class="btn btn-primary" id="orderCode_valuehAreaBtn" class="btn valuehAreaBtn" data-dismiss="modal" >확인</button>
		   				</div>
		   				
		   				<div id="orderCode_searchDataArea">
		   				</div>
		   				
		   			</div> 
		   			
		   			<div class="modal-footer">
	   				</div> 
	   				
	   			</div> 
	   		</div> 
	   </div>
	   
	   
	   
<!-- Modal Area 끝-->









<script>
	// Status Code Map
	var statusCodeMap = new Map();
	
	
	// 매입매출전표 입력 - 구분 엔터키 실행
	$("#insertSalesStatus").keypress(function(e){
		fn_salesSet(e);
	});
	// 공급대가 금액 입력 - 엔터키 실행
	$("#insertSumValue").keypress(function(e){
		fn_distinguishValue(e);
	});
	
	/********************************************/	
	
	// 거래처 키다운 & 마우스 클릭 : 키다운
	$("#insertClient").keypress(function(e){
		fn_findClient();
	});
	// 거래처 키다운 & 마우스 클릭 : 마우스클릭
	$("#insertClient").click(function(){
		fn_findClient();
	});
	
	/********************************************/	
	
	// 부서 키다운 & 마우스 클릭 : 키다운
	$("#insertDept").keypress(function(e){
		fn_findDept();
	});
	// 부서 키다운 & 마우스 클릭 : 마우스클릭
	$("#insertDept").click(function(){
		fn_findDept();
	});

	/********************************************/	
	
	// 발주번호 키다운 & 마우스 클릭 : 키다운
	$("#insertOrderCode").keypress(function(e){
		fn_findOrderCode();
	});
	// 발주번호 키다운 & 마우스 클릭 : 마우스클릭
	$("#insertOrderCode").click(function(){
		fn_findOrderCode();
	});
	
	/********************************************/	
	
	// 전자여부 자동변경
	$("#insertAuto").keypress(function(e){
		var value = $(this).val();
		fn_setAutoCode(e,value);
	});
	
	/********************************************/	
	
	// 분개유형 자동변경
	$("#insertSlipType").keypress(function(e){
		var value = $(this).val();
		fn_setSlipType(e,value);
	});
	
	
	
	
	
	
	
	
	
	
	
// function
	
	
	
	/*매입매출 구분 셋팅*/
	function fn_salesSet(e){
		if(e.which == 13){
			
			// 파라미터 index, item
			$(".scKey").each(function(i,item){
				statusCodeMap.set($(this).html(), $(".scValue").eq(i).html());
			});
			
			// 파라미터 index, item
			$(".phKey").each(function(i,item){
				statusCodeMap.set($(this).html(), $(".phValue").eq(i).html());
			});
			
		$("#insertSumValue").focus();
		$("#insertSalesStatus").val(statusCodeMap.get($("#insertSalesStatus").val()));
		}
	}
	
	
	/*공급대가 데이터를 활용하여 공급가액과 부가세액 셋팅*/
	function fn_distinguishValue(e){
		if(e.which == 13){
			var supplyValue = parseInt($("#insertSumValue").val() / 1.1);
			var surTax 		= parseInt($("#insertSumValue").val() - supplyValue);
			var sumValue 	= $("#insertSumValue").val();
			
			supplyValue 	= fn_numberWithCommas(supplyValue + "");
			surTax 			= fn_numberWithCommas(surTax + "");
			sumValue 		= fn_numberWithCommas(sumValue + "");
			
			$("#insertSupplyValue").val(supplyValue);
			$("#insertSurTax").val(surTax);
			$("#insertSumValue").val(sumValue);
			$("#insertClient").focus();
			
		}
		
	}
	
	
	/*원단위 콤마 변환*/
	function fn_numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	
	
	
	/*거래처 검색*/
	function fn_findClient(){
		$("#client_hidden").trigger("click");
		
		// Client Data 접근 Ajax
		$.ajax({
			url : "${pageContext.request.contextPath }/findClient",
			success : function(data){
				$("#client_searchDataArea").html(data);
			}
		});
	}
	
	
	/*부서 검색*/
	function fn_findDept(){
		$("#dept_hidden").trigger("click");
		
		// Dept Data 접근 Ajax
		$.ajax({
			url : "${pageContext.request.contextPath }/findDept",
			success : function(data){
				$("#dept_searchDataArea").html(data);
			}
		});
	}
	
	
	/*발주번호 검색*/
	function fn_findOrderCode(){
		$("#orderCode_hidden").trigger("click");
		
		// OrderCode Data 접근 Ajax  [[개발예정]]
		$.ajax({
			url : "${pageContext.request.contextPath }/findOrderCode",
			success : function(data){
				$("#orderCode_searchDataArea").html(data);
			}
		});
	}
	
	
	/*전자여부 셋팅*/
	function fn_setAutoCode(e,value){
		if(e.which == 13){
			if(value == 0){
				$("#insertAuto").val("부");
				$("#insertSlipType").focus();
			} else if (value == 1){
				$("#insertAuto").val("여");
				$("#insertSlipType").focus();
			} else {
				$("#insertAuto").val("");
			}
		} else {
			// 작동 하지 않음
		}
	} 
	
	
	insertSlipType
	
	/*분개유형 셋팅*/
	function fn_setSlipType(e,value){
		if(e.which == 13){
			if(value == 1){
				$("#insertSlipType").val("현금");
			} else if (value == 2){
				$("#insertSlipType").val("외상");
			} else if (value == 3){
				$("#insertSlipType").val("혼합");
			} else if (value == 4){
				$("#insertSlipType").val("카드");
			} else {
				$("#insertAuto").val("");
			}
		} else {
			// 작동 하지 않음
		}
	} 
	
	
	

</script>
