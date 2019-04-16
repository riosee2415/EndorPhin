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
				<td><input class="btn btn-warning" type="button" id="seachBtn" value="검색" /></td>
			</tr>
		</table>
		</div>
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th>자산코드</th>
					<th>계정명</th>
					<th>자산명</th>
					<th>매각/폐기일</th>
					<th>장부반영</th>
				</tr>
			</thead>	
			<tbody id="deptListTbody">
				<c:forEach items="${assetSellList }" var="vo">
					 <tr>
						<td><a class="bttn-stretch bttn-warning disposalView" href="#disposalDetail" data-assetcode_d="${vo.assetCode }"
									   								data-toggle="modal">${vo.assetCode }</a></td>
   						<td>${vo.assetName }</td>	
   						<td>${vo.accountName}</td>								
						<td><fmt:formatDate value="${vo.disposalDate  }"	pattern="yyyy-MM-dd" /></td>
						
						<c:set var="dates">
							<fmt:formatDate value="${vo.disposalDate  }"	pattern="yyyy/MM/dd" />
						</c:set>
						<td><a class="bttn-stretch bttn-warning detailView" 
																data-assetcode="${vo.assetCode }"
																data-acquisitiondate="${dates }"
																data-purchasecode="${vo.purchaseCode }"
																data-sanggakway="${vo.sanggakWay }"
																data-acquisitionprice="${vo.acquisitionPrice }"
																data-accountname="${vo.accountName }"
																data-clientname="${vo.clientName }"
																data-assetname="${vo.assetName }"
																data-residualvalue="${vo.residualvalue }"
																data-jukyo="${vo.jukyo }" data-sanggakcode="${vo.sanggakCode }"
																data-depreciation="${vo.depreciation }"
																data-accumulated="${vo.accumulated }">매각 등록</a></td>
				 	</tr>
				 	<div id="insertArea"></div>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="modal fade" id="disposalDetail" role="disposalDetail" aria-hidden="true"> 
 		<div class="modal-dialog">
 		 <div class="modal-content"> 
  			<div class="modal-header">
				<label>| 매각등록</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
					<span aria-hidden="true">&times;</span>
					</button>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<td><label>자산코드(*)&nbsp;&nbsp;&nbsp;</label></td> 
						<td><input type="text" id="assetCode" name="assetCode"  readonly="readonly"> </td>
					</tr>
					<tr> 
						<td><label>매각 금액(*)&nbsp;&nbsp;&nbsp;</label></td> 
						<td><input type="text" id="disposalPrice" name="disposalPrice" > </td>
					</tr>
					<tr> 
						<td><label>매각/폐기일&nbsp;&nbsp;</label></td> 
						<td><input type="text" id="disposalDate" name="disposalDate"> </td>
						<td><input type="button"class="btn btn-warning btn-sm" id="disposal_ok" name="disposal_ok" value="확인 "> </td>
					</tr>
					<tr> 
						<td><label>손실/이익 확인 &nbsp;&nbsp;</label></td> 
						<td><div id="ok"></div></td>
					</tr>
					<tr> 
						<td><label>잔존가치&nbsp;&nbsp;</label> </td> 
						<td><input type="text" id="disposal"></td>
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

	<script>
	
	function Enter_Check(){
	    if(event.keyCode == 13){
	    	$("#seachBtn").click(); 
	    }
	}
	/*장부반영 */
	$(".detailView").on("click",function() {
		$.ajax({
			url : "${pageContext.request.contextPath }/insertApply",
			data : "acquisitionDate="+ $(this).data().acquisitiondate+"&" 
					+ "acquisitionPrice="+ $(this).data().acquisitionprice + "&"
					+ "depreciation="+ $(this).data().depreciation,
			success : function(data) {
				location.reload();
				return false;
			}
		});
	});
	$(".disposalView").on("click",function() {
		$("#assetCode").val($(this).data("assetcode_d"));
	});
	
	/*1. 매각 금액, 날짜 등록  */
	$("#disposal_ok").on("click",function() {
		if($("#disposalPrice").val().trim()=="" || $("#disposalDate").val().trim()==""){
			alert("(*)는 필 수 입니다.");
			return false;
		}
		$.ajax({
			url : "${pageContext.request.contextPath }/insertCheck",
			data : "assetCode="+ $("#assetCode").val()+"&" +
					"disposalPrice="+ $("#disposalPrice").val()+"&" 
				  + "disposalDate="+ $("#disposalDate").val(),
			success : function(data) {
				location.reload();
				alert("확인");
			}
		});
	});

	
	
	
	
	
	
	
    $(function() {
        //input을 datepicker로 선언
        $("#disposalDate").datepicker({
            dateFormat: 'yy/mm/dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
        });                    
        
        //초기값을 오늘 날짜로 설정
        $('#disposalDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    });
	</script>

 	
    