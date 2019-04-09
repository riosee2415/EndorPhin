<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 분개유형 데이터 로드 -->
<input id="loadSlipType" type="hidden" value="${slipType }" />
<input id="loadSalesStatus" type="hidden" value="${salesStatus }" />
    
    <!-- 세부전표 내용 시작-->

<table border="1" style="text-align: center;">
	
	<thead class="thead">
		<tr>
			<td style="width: 50px;">차/대</td>
			<td style="width: 150px;"colspan="2">계정과목</td>
			<td style="width: 170px;">적요</td>
			<td style="width: 170px;" colspan="2">거래처</td>
			<td style="width: 130px;">차변</td>
			<td style="width: 130px;">대변</td>
		</tr>
	</thead>
	 
	<tbody id="tbody">
		<tr>
			<td><input id="detail_slipStatus1" style="width: 80px;" type="text" /></td>
			<td><input id="detail_slipEstabilshCode1" style="width: 40px;" type="text" /></td>
			<td><input id="detail_slipEstabilshName1" style="width: 130px;" type="text" /></td>
			<td><input style="width: 170px;" type="text" /></td>
			<td><input style="width: 40px;" type="text" /></td>
			<td><input style="width: 130px;" type="text" /></td>
			<td><input style="width: 130px;" type="text" /></td>
			<td><input style="width: 130px;" class="rightStatus" type="text" /></td>
		</tr>
		
		<tr>
			<td><input id="detail_slipStatus2" style="width: 80px;" type="text" /></td>
			<td><input id="detail_slipEstabilshCode2" style="width: 40px;" type="text" /></td>
			<td><input id="detail_slipEstabilshName2" style="width: 130px;" type="text" /></td>
			<td><input style="width: 170px;" type="text" /></td>
			<td><input style="width: 40px;" type="text" /></td>
			<td><input style="width: 130px;" type="text" /></td>
			<td><input style="width: 130px;" type="text" /></td>
			<td><input style="width: 130px;" class="rightStatus" type="text" /></td>
		</tr>
		
		<tr>
			<td><input id="detail_slipStatus3" style="width: 80px;" type="text" /></td>
			<td><input id="detail_slipEstabilshCode3" style="width: 40px;" type="text" /></td>
			<td><input id="detail_slipEstabilshName3" style="width: 130px;" type="text" /></td>
			<td><input style="width: 170px;" type="text" /></td>
			<td><input style="width: 40px;" type="text" /></td>
			<td><input style="width: 130px;" type="text" /></td>
			<td><input style="width: 130px;" type="text" /></td>
			<td><input style="width: 130px;" class="rightStatus" type="text" /></td>
		</tr>
	</tbody>
</table>

<!-- 세부전표 내용 끝-->



<script>
	var tbodyData = "";
	
	
	$("document").ready(function(){
		
		var dist = $("#loadSalesStatus").val();
		
		
		if(dist == "과세매입"){
			if($("#loadSlipType").val() == "현금"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				
				$("#detail_slipStatus2").val("차변");
				$("#detail_slipEstabilshCode2").val("135");
				$("#detail_slipEstabilshName2").val("부가세대급금");
				
				$("#detail_slipStatus3").val("대변");
				$("#detail_slipEstabilshCode3").val("101");
				$("#detail_slipEstabilshName3").val("현금");
				
			} 
			
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
			} 
			
			else if ($("#loadSlipType").val() == "혼합"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
			}

			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
			}
		}
		
		
		
	
		tbodyData		+= "<tr>";
		tbodyData		+=  	"<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
		tbodyData		+=  	"<td style='width: 40px;'><input style='width: 80px;' type='text' /></td>";
		tbodyData		+=  	"<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
		tbodyData		+=  	"<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
		tbodyData		+=  	"<td style='width: 40px;'><input style='width: 80px;' type='text' /></td>";
		tbodyData		+=  	"<td style='width: 80px;'><input style='width: 80px;' type='text' /></td>";
		tbodyData		+= 		"<td style='width: 100px;'><input style='width: 100px;' type='text' /></td>";
		tbodyData		+=  	"<td style='width: 100px;'><input style='width: 100px;' type='text' /></td>";
		tbodyData		+= "</tr>";
		
		
	});
	
	
	//키다운 엔터
	$(".rightStatus").keypress(function(e){
		fn_appendTbodyData(e);
	});
	
	
	
	function fn_appendTbodyData(e){
		if(e.which == 13){
			$("#tbody").append(tbodyData);
		}
	}
	
	
	

</script>
