<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
정률법
<table class="table table-sm">
	<thead class="thead">
		<tr>
			<td colspan="5" width="80%">| 고정자산등록  </td>
			<td></td>
		</tr>
	</thead>
		<tr>
			<td colspan="2">자산명(*)</td>
			<td><input type="text" id="assetName" name="assetName" value="${asset.assetName }"></td> 
			<tr>
		</tr>
		<tr>
			<td colspan="2" > 계정과목(*)
			<td><input type="text" id="accountName" name="accountName"  value="${asset.accountName }">
				<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="검색"></td>
		</tr>
		<tr>
			<td colspan="2" > 거래처(*)</td>
			<td><input type="text" id="clientName" name="clientName" value="${asset.clientName }">
				<input type="button" data-toggle="modal" data-target="#my80sizeModal3" value="검색" ></td>
			
		</tr>
		<tr>
			<td colspan="2"> 감가상각계정코드(*)</td>
			<td><input type="text" id="sanggakCode" name="sanggakCode" value="${asset.sanggakCode }">
				<input type="button" data-toggle="modal" data-target="#my80sizeModal4" value="검색" >	</td>
				
		</tr>
		<tr>
		<td colspan="2">내용연수/상각률(원수) </td>
			<td><input type="text" id="serviceLife" style="width: 50px;" value="${asset.serviceLife }" >
				<input type="button" data-toggle="modal" class="serviceBtn" data-target="#my80sizeModal5" value="▦">
			<input type="text" id="depreciationRate" name="depreciationRate" style="width: 65px;" >
				(&nbsp;<input type="text" id="month" style="width: 50px;">&nbsp;)
				<input onclick="myClick();" type="button" data-toggle="modal" data-target="#my80sizeModal6" value="년수별상각율">
			</td>
		</tr>
		<tr>
			<td colspan="2">감가상각누계액(*)</td>
			<td colspan="2"><input type="text" id="accumulated" name="accumulated" value="${asset.accumulated }"></td> 
		</tr>
		<tr>
			<td colspan="2">감가상각비(*)</td>
			<td colspan="2"><input type="text" id="depreciation" name="depreciation" ></td> 
		</tr>
		<tr>
			<td colspan="2">잔존가치(*)</td>
			<td colspan="2"><input type="text" id="residualvalue" name="residualvalue" value="0"  value="${asset.residualvalue }"></td> 
		</tr>
		<tr>
			<td colspan="2"> 적요  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><input type="text" id="jukyo" name="jukyo"   value="${asset.jukyo }"></td> 
		</tr>
		<tr>
			<td><button type="button" class="btn btn-primary" onclick="delete_fn();">취소 </button>
				<button type="button" class="btn btn-primary" onclick="insertBtn_fn();">등록 </button></td>
		</tr>
    </table>
    
<!--내용연수 표   -->
<div class="modal fade" id="my80sizeModal5" tabindex="-1" role="dialog" aria-labelledby="my80sizeModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content modal-lg">
			<div class="modal-header">
				<h6>| 기준내용년수도움표</h6>
			</div>
			<center>
				<div class="modal-body">
					<div class="form-group"></div>
					
						<table border="1">
						
							<thead>
						     <tr>
						        <td colspan="5" align="center">[별표 5] 건축물등의 기준내용연수 및 내용연수 범위표(제15제3항관련)</td>
						    </tr>
						    <tr >
						     	<td align="center">대분류</td>
						    	<td colspan="3" style="width: 50%" align="center" >중분류</td>
						    	<td colspan="1" align="center">내용년수 </td>
						    </tr>
						    </thead>
						    <tbody>
						      <tr class="classTr" data-value="5" >
							        <td >차량, 공구, 비품</td>
							        <td colspan="2">&nbsp;&nbsp;1&nbsp;&nbsp;</td>
							        <td colspan="1">차량운반구 (운수업등 사용시 제외), 공구, 기구 및 비품</td>
							        <td>&nbsp;&nbsp;5&nbsp;&nbsp;</td>
						      </tr>
						       <tr class="classTr" data-value="20" >
							        <td>건축물</td>
							        <td>&nbsp;&nbsp;2&nbsp;&nbsp;</td>
							        <td colspan="2">연와조, 블럭조, 콘크리트조, 토조, 토벽조, 목조, 목골목탈조, 기타조의
							        				모든 건물 (부속설비 포함과 구축물)</td>
							        <td>&nbsp;&nbsp;20&nbsp;&nbsp;</td>
						      </tr>
						       <tr  class="classTr" data-value="40"  >
							        <td>건축물</td>
							        <td>&nbsp;&nbsp;3&nbsp;&nbsp;</td>
							        <td colspan="2">철골·철근콘크리트조, 철근콘크리트조, 석조, 연와석조, 
							        				철골조의 모든건물 (부속설비 포함)과 구축물</td>
							         
							        <td>&nbsp;&nbsp;40&nbsp;&nbsp;</td>
						      </tr>
						            <tr class="classTr" data-value="12" >
							        <td>선박 및 항공기</td>
							        <td>&nbsp;&nbsp;1&nbsp;&nbsp;</td>
							        <td colspan="2">선박 및 항공기 (어업, 운수업등 사용시 제외)</td>
							        <td>&nbsp;&nbsp;12&nbsp;&nbsp;</td>
						      </tr>
						    </tbody>
						</tbody>
						 <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
					</table>
				  <button type="button" class="buttons" class="btn btn-default" data-dismiss="modal">닫기</button>
				  <input type="hidden" class="buttons" data-dismiss="modal" value=""/>
				</div>
			</div>
		</center>
	</div>
</div>
    <script>
	var statusCodeMap = new Map();
	
    $("#depreciationRate").keypress(function(e){
    	fn_calSet(e);
	});
    
	function fn_calSet(e){
		if(e.which == 13){
		
		$("#depreciationRate").val(statusCodeMap.get($("#depreciationRate").val()));
		
	}
}
    $(".classTr").on("click", function(){

    	var data    = $(this).data("value"); /* 내용년수  */
		var five    = 0.451;  /*상각률 */
		var twenty  = 0.140;
		var forty   = 0.073;
		var tweenty = 0.221;
		
		if(data === 5){
			$("#depreciationRate").val(five);
		}
		if(data === 20){
			$("#depreciationRate").val(twenty);
		}
		if(data === 40){
			$("#depreciationRate").val(forty);
		}
		if(data === 12){
			$("#depreciationRate").val(five);
		}
		
		var acquisitionPrice  = $("#acquisitionPrice1").val();
		var cal 			  = $("#depreciationRate").val();
		var accumulated 	  = acquisitionPrice*cal /* 감가상각누계액 */
		var depreciation 	  = (acquisitionPrice-accumulated)*cal; /*정률법 = 감가상각비 계산 (취득원가-감가상각누계액) x 상각률 */
		var depre			  = parseInt(depreciation);
		var accumulated_parse = parseInt(accumulated);
		
		depre 			  = fn_numberWithCommas(depre);
		accumulated_parse = fn_numberWithCommas(accumulated_parse);
		
		$("#accumulated").val(accumulated_parse);
		$("#serviceLife").val(data); 
		$("#depreciation").val(depre);
		
		
		$('.buttons').trigger('click');
    	
	});
    
	 /*원단위 콤마 변환*/
	function fn_numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function insertBtn_fn(){
		if($("#assetName").val().trim() == "" || $("#accountName").val().trim()==""
			|| $("#clientName").val().trim() == "" || $("#sanggakCode").val().trim()==""
			|| $("#depreciation").val().trim() == "" || $("#accumulated").val().trim()==""
			|| $("#residualvalue").val().trim()==""){
			alert("(*)은 필수 사항입니다.");
			return false;
		}
		$.ajax({
			url  : "${pageContext.request.contextPath }/insertFrm",
			data : "assetCode="+$("#assetCode1").val() + "&"+ "date="+$("#date").val()+ 
					"&" +"assetName="+$("#assetName").val()+ 
					"&" +"sanggakWay="+$("#sanggakWay1").val() +  "&"+"accountName="+$("#accountName").val()+ 
					"&" + "clientName="+$("#clientName").val() + "&" + "acquisitionPrice="+$("#acquisitionPrice1").val()+ 
					"&" + "residualvalue="+$("#residualvalue").val()+"&" + "jukyo="+$("#jukyo").val() + 
					"&" + "sanggakCode="+$("#sanggakCode").val()+"&" + "depreciation="+$("#depreciation").val()+
					"&" + "accumulated="+$("#accumulated").val()+"&" + "purchaseCode="+$("#purchaseCode1").val()+
					"&" + "serviceLife="+$("#serviceLife").val()+"&" + "depreciationRate="+$("#depreciationRate").val(),
				
		success : function(data){
			$("#serviceLife_div").html("");	
			$("#insertArea").html("");	
		
			alert("성공적으로 등록되었습니다.");
			location.reload();
			
		}
	});
}
	function delete_fn(){
	 	 
       	$("#insertArea").html("");	
	}
    </script>