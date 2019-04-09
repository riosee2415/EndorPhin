<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 분개유형 데이터 로드 -->
<input id="loadSlipType" type="hidden" value="${slipType }" />
<input id="loadSalesStatus" type="hidden" value="${salesStatus }" />
<input id="loadSupplyValue" type="hidden" value="${supplyValue }" />
<input id="loadSurtax" type="hidden" value="${surtax }" />
<input id="loadSumValue" type="hidden" value="${sumValue }" />
<input id="loadClientCode" type="hidden" value="${clientCode }" />
<input id="loadClientName" type="hidden" value="${clientName }" />
<input id="loadSlipDate" type="hidden" value="${slipDate }" />
<input id="loadDeptCode" type="hidden" value="${deptCode }" />
<input id="loadOrderCode" type="hidden" value="${orderCode }" />
<input id="loadAuto" type="hidden" value="${auto }" />

    
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
			<td><input id="detail_clientCode1" style="width: 40px;" type="text" /></td> <!-- 거래처코드 -->
			<td><input id="detail_clientName1" style="width: 130px;" type="text" /></td><!-- 거래처이름 -->
			<td><input id="detail_slipLeft1" style="width: 130px;" type="text" /></td>
			<td><input id="detail_slipRight1" style="width: 130px;" class="rightStatus" type="text" /></td>
		</tr>
		
		<tr>
			<td><input id="detail_slipStatus2" style="width: 80px;" type="text" /></td>
			<td><input id="detail_slipEstabilshCode2" style="width: 40px;" type="text" /></td>
			<td><input id="detail_slipEstabilshName2" style="width: 130px;" type="text" /></td>
			<td><input style="width: 170px;" type="text" /></td>
			<td><input id="detail_clientCode2" style="width: 40px;" type="text" /></td>
			<td><input id="detail_clientName2" style="width: 130px;" type="text" /></td>
			<td><input id="detail_slipLeft2" style="width: 130px;" type="text" /></td>
			<td><input id="detail_slipRight2" style="width: 130px;" class="rightStatus" type="text" /></td>
		</tr>
		
		<tr>
			<td><input id="detail_slipStatus3" style="width: 80px;" type="text" /></td>
			<td><input id="detail_slipEstabilshCode3" style="width: 40px;" type="text" /></td>
			<td><input id="detail_slipEstabilshName3" style="width: 130px;" type="text" /></td>
			<td><input style="width: 170px;" type="text" /></td>
			<td><input id="detail_clientCode3" style="width: 40px;" type="text" /></td>
			<td><input id="detail_clientName3" style="width: 130px;" type="text" /></td>
			<td><input id="detail_slipLeft3" style="width: 130px;" type="text" /></td>
			<td><input id="detail_slipRight3" style="width: 130px;" class="rightStatus" type="text" /></td>
		</tr>
	</tbody>
</table>

<!-- 세부전표 내용 끝-->

<!-- 등록 시작 -->
<br />
<input type="button" class="btn btn-primary" id="insertTaxcalBtn" name="insertTaxcalBtn" value="전표등록" />
<!-- 등록 끝 -->



<script>
	var tbodyData = "";
	
	
	$("document").ready(function(){
		
		var dist = $("#loadSalesStatus").val();
		
		/*분개유형 선택 시 자동분개 시스템*/

		// 과세매입
		if(dist == "과세매입"){
			
			// 현금
			if($("#loadSlipType").val() == "현금"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSupplyValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("차변");
				$("#detail_slipEstabilshCode2").val("135");
				$("#detail_slipEstabilshName2").val("부가세대급금");
				$("#detail_slipLeft2").val($("#loadSurtax").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus3").val("대변");
				$("#detail_slipEstabilshCode3").val("101");
				$("#detail_slipEstabilshName3").val("현금");
				$("#detail_slipRight3").val($("#loadSumValue").val());
				
			} 
			
			// 외상
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSupplyValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("차변");
				$("#detail_slipEstabilshCode2").val("135");
				$("#detail_slipEstabilshName2").val("부가세대급금");
				$("#detail_slipLeft2").val($("#loadSurtax").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				$("#detail_slipStatus3").val("대변");
				$("#detail_slipEstabilshCode3").val("251");
				$("#detail_slipEstabilshName3").val("외상매입금");
				$("#detail_slipRight3").val($("#loadSumValue").val());
				$("#detail_clientCode3").val($("#loadClientCode").val());
				$("#detail_clientName3").val($("#loadClientName").val());
				
			} 
			
			// 혼합
			else if ($("#loadSlipType").val() == "혼합"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSupplyValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("차변");
				$("#detail_slipEstabilshCode2").val("135");
				$("#detail_slipEstabilshName2").val("부가세대급금");
				$("#detail_slipLeft2").val($("#loadSurtax").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
			}
			
			// 카드
			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSupplyValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("차변");
				$("#detail_slipEstabilshCode2").val("135");
				$("#detail_slipEstabilshName2").val("부가세대급금");
				$("#detail_slipLeft2").val($("#loadSurtax").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				$("#detail_slipStatus3").val("대변");
				$("#detail_slipEstabilshCode3").val("253");
				$("#detail_slipEstabilshName3").val("미지급금");
				$("#detail_slipRight3").val($("#loadSumValue").val());
				
			}
			
			
			
		} else if (dist == "영세율"){
			// 현금
			if($("#loadSlipType").val() == "현금"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("101");
				$("#detail_slipEstabilshName2").val("현금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				
			} 
			
			// 외상
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("251");
				$("#detail_slipEstabilshName2").val("외상매입금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
			} 
			
			// 혼합
			else if ($("#loadSlipType").val() == "혼합"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
			}
			
			// 카드
			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("253");
				$("#detail_slipEstabilshName2").val("미지급금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
			}
			
			
		} else if (dist == "계산서"){
			// 현금
			if($("#loadSlipType").val() == "현금"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("101");
				$("#detail_slipEstabilshName2").val("현금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				
			} 
			
			// 외상
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("251");
				$("#detail_slipEstabilshName2").val("외상매입금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
			} 
			
			// 혼합
			else if ($("#loadSlipType").val() == "혼합"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
			}
			
			// 카드
			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("253");
				$("#detail_slipEstabilshName2").val("미지급금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
			}
			
		}else if (dist == "불공"){
			// 현금
			if($("#loadSlipType").val() == "현금"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("101");
				$("#detail_slipEstabilshName2").val("현금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				
			} 
			
			// 외상
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("251");
				$("#detail_slipEstabilshName2").val("외상매입금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
			} 
			
			// 혼합
			else if ($("#loadSlipType").val() == "혼합"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
			}
			
			// 카드
			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("146");
				$("#detail_slipEstabilshName1").val("상품");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("253");
				$("#detail_slipEstabilshName2").val("미지급금");
				$("#detail_slipRight2").val($("#loadSumValue").val());
			}
			
		} else if(dist == "과세매출"){
			// 현금
			if($("#loadSlipType").val() == "현금"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("101");
				$("#detail_slipEstabilshName1").val("현금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSupplyValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus3").val("대변");
				$("#detail_slipEstabilshCode3").val("255");
				$("#detail_slipEstabilshName3").val("부가세예수금");
				$("#detail_slipRight3").val($("#loadSurtax").val());
				$("#detail_clientCode3").val($("#loadClientCode").val());
				$("#detail_clientName3").val($("#loadClientName").val());
				
				
			} 
			
			// 외상
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSupplyValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus3").val("대변");
				$("#detail_slipEstabilshCode3").val("255");
				$("#detail_slipEstabilshName3").val("부가세예수금");
				$("#detail_slipRight3").val($("#loadSurtax").val());
				$("#detail_clientCode3").val($("#loadClientCode").val());
				$("#detail_clientName3").val($("#loadClientName").val());
				
				
			} 
			
			// 혼합
			else if ($("#loadSlipType").val() == "혼합"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
			}
			
			// 카드
			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSupplyValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus3").val("대변");
				$("#detail_slipEstabilshCode3").val("253");
				$("#detail_slipEstabilshName3").val("미지급금");
				$("#detail_slipRight3").val($("#loadSurtax").val());
				
				
			}
			
		}  else if(dist == "영세율매출"){
			
			// 현금
			if($("#loadSlipType").val() == "현금"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("101");
				$("#detail_slipEstabilshName1").val("현금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
			} 
			
			// 외상
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
			} 
			
			// 혼합
			else if ($("#loadSlipType").val() == "혼합"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
			}
			
			// 카드
			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
			}
			
		} else if(dist == "계산서매출"){
			// 현금
			if($("#loadSlipType").val() == "현금"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("101");
				$("#detail_slipEstabilshName1").val("현금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
			} 
			
			// 외상
			else if ($("#loadSlipType").val() == "외상"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
			} 
			
			// 혼합
			else if ($("#loadSlipType").val() == "혼합"){
				
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
			}
			
			// 카드
			else if ($("#loadSlipType").val() == "카드"){
				$("#detail_slipStatus1").val("차변");
				$("#detail_slipEstabilshCode1").val("108");
				$("#detail_slipEstabilshName1").val("외상매출금");
				$("#detail_slipLeft1").val($("#loadSumValue").val());
				$("#detail_clientCode1").val($("#loadClientCode").val());
				$("#detail_clientName1").val($("#loadClientName").val());
				
				
				$("#detail_slipStatus2").val("대변");
				$("#detail_slipEstabilshCode2").val("401");
				$("#detail_slipEstabilshName2").val("상품매출");
				$("#detail_slipRight2").val($("#loadSumValue").val());
				$("#detail_clientCode2").val($("#loadClientCode").val());
				$("#detail_clientName2").val($("#loadClientName").val());
				
				
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
	
	
	
	// 전표등록
	var flag;
	
	$("#insertTaxcalBtn").on("click", function(){
		
		var salesStatus = $("#loadSalesStatus").val();
		var sumValue = $("#loadSumValue").val();
		
		
		
		flag = fn_validationSalesStatus(salesStatus);		
		flag = fn_validationSumValue(sumValue);
		
		// validation 통과
		if(flag === 1){
			fn_insertTax_calAndDetail();
		}
		
	});
	
	
	
	
	/* 유효성 검사 파트*/
	
	//매입매출 구분 유효성 체크
	function fn_validationSalesStatus(salesStatus){
	
		if(salesStatus === ""){
			alert("매입매출 코드가 입력되지 않았습니다.");
			return 0;
		} else {
			return 1;
		}
	}
	
	// 공급대가
	function fn_validationSumValue(sumValue){
		if(sumValue === ""){
			alert("공급대가가 없습니다.");
			return 0;
		} else {
			return 1;
		}
	}
	
	
	/* 전표 등록 코드 */
	function fn_insertTax_calAndDetail(){
		
		
		var insertSlipDate = $("#loadSlipDate").val();
		var insertSupplyValue = $("#loadSupplyValue").val();
		var insertSalesStatus = $("#loadSalesStatus").val();
		var insertDeptCode = $("#loadDeptCode").val();
		var insertSurtax = $("#loadSurtax").val();
		var insertOrderCode = $("#loadOrderCode").val();
		var insertClientName = $("#loadClientName").val();
		var insertSumValue_check = $("#loadSumValue").val();
		var insertAuto = $("#loadAuto").val();
		var insertEntryType = $("#loadSlipType").val();
		
		
		
		
		/*tax_cal Insert Query  실행 후, Location을 통해 redirect를 하는 Ajax*/
		$.ajax({
			url : "${pageContext.request.contextPath }/inesrtTax_calAjax",
			data : "insertSlipDate=" + insertSlipDate
				 + "&insertSupplyValue=" + insertSupplyValue
				 + "&insertSalesStatus=" + insertSalesStatus
				 + "&insertDeptCode=" + insertDeptCode
				 + "&insertSurtax=" + insertSurtax
				 + "&insertOrderCode=" + insertOrderCode
				 + "&insertClientName=" + insertClientName
				 + "&insertSumValue=" + insertSumValue_check
				 + "&insertAuto=" + insertAuto
				 + "&insertEntryType=" + insertEntryType,
			success : function(data){
				location.reload();
				
				console.log(data);
			}
		});
		
			
		
	}

</script>

