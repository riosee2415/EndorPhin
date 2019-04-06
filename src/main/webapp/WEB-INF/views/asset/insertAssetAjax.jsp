<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
	<thead >
		<tr>
			<td colspan="2" >자산코드(*)
			<input type="text" id="assetCode" name="assetCode">
				<input type="button" value="중복체크" id="duplCheckbtn" name="duplCheckbtn"/></td>
				<td colspan="6"><div id="dupleCode"></div></td>
			<td><br><br></td>
		<tr>
			<td colspan="2" > 취득일(*) &nbsp;&nbsp;&nbsp;
				<input name="acquisitionDate" type="text" style="width: 200px;" id="acquisitionDate" >
			<td> &nbsp;&nbsp;* 유형 : 
				<select id ="purchaseCode" name="purchaseCode">
								<option value="51" selected="selected">51 과세매입</option>
								<option value="54" >54 불공</option>
				</select>
			</td>
			<td>  &nbsp;&nbsp;* 상각방법: 
				<select id ="sanggakWay" name="sanggakWay">
								<option value="1" selected="selected">정액법</option>
								<option value="0" >정률법</option>
				</select>
			</td>
			<td colspan="2">&nbsp;&nbsp;취득금액(*)
				<input type="text" id="acquisitionPrice"></td> 
			<td>
				&nbsp;&nbsp;<input type="button" id="insertBtn" name="insertBtn" value="저장">
			</td>	
		</tr>
	</thead>
</table>
<br>
<table class="table table-sm">
	<thead class="thead">
		<tr>
			<td colspan="5" width="80%">| 고정자산등록</td>
			<td></td>
		</tr>
	</thead>
		<tr>
			<td colspan="2">자산명(*)</td>
			<td><input type="text" id="assetName"></td> 
			<tr>
		</tr>
		<tr>
			<td colspan="2" > 계정과목(*)
			<td><input type="text" id="accountName" >
				<input type="button" data-toggle="modal" data-target="#my80sizeModal2" value="검색"></td>
		</tr>
		<tr>
			<td colspan="2" > 거래처(*)</td>
			<td><input type="text" id="clientName">
				<input type="button" data-toggle="modal" data-target="#my80sizeModal3" value="검색" ></td>
			
		</tr>
		<tr>
			<td colspan="2"> 감가상각계정코드(*)</td>
			<td><input type="text" id="sanggakCode">
				<input type="button" data-toggle="modal" data-target="#my80sizeModal4" value="검색" >	</td>
				
		</tr>
		<tr>
		
			<td colspan="2">내용연수/상각률(원수) </td>
			<td><input type="text" id="year" style="width: 50px;">
				<input type="button" data-toggle="modal" data-target="#my80sizeModal5" value="▦">
				<input type="text" id="calculate" style="width: 65px;">
				(&nbsp;<input type="text" id="month" style="width: 50px;">&nbsp;)
				<input onclick="myClick();" type="button" data-toggle="modal" data-target="#my80sizeModal6" value="년수별상각율">
			</td>
		</tr>
		<tr>
			<td colspan="2">잔존가치(*)</td>
			<td colspan="2"><input type="text" id="residualvalue"></td> 
		</tr>
		<tr>
			<td colspan="2"> 단위</td>
			<td><input type="text" id="unit"></td> 
			<td colspan="2"> 수량  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="quantity"></td> 
		</tr>
		<tr>
			<td colspan="2"> 단가</td>
			<td><input type="text" id="unitprice"></td> 
			<td colspan="2"> 적요  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="jukyo"></td> 
		</tr>
		<tr>
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
						      <tr class="classTr" data-value="5" onclick="classTr();">
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
<div class="modal modal-center fade" id="my80sizeModal6" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
			<div class="modal-header">
				<h6>| 년수별상각율</h6>
			</div>
			<center>
				<div class="modal-body">
					<div class="form-group"></div>
					
					<div style="overflow:scroll; width:450px; height:200px;">
						<table border="1">
							<thead >
						     <tr class="thead">
						        <td>내용연수</td>
						        <td>정액법</td>
						        <td>정률법</td>
						    </tr>
						    </thead>
						    <tbody id="tbody">
							</tbody>
						</table>
					</div>
				  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</center>
	</div>
</div>

<script>
	function myClick(){
		$.ajax({
			url  : "${pageContext.request.contextPath }/serviceLife",
			success : function(data){
				console.log(data);
				$("#tbody").html(data);
			}	   
		});
	}

	
	$(".classTr").on("click", function(){
		var data = $(this).data("value");
		var cal  = 1/parseInt(data);  
		var fixed = cal.toFixed(3);
		
		$("#year").val(data);
		
	 	$("#calculate").val(fixed); 
		
		$('.buttons').trigger('click');
	});
		

	$("#insertBtn").on("click", function(){
		
		
		if($("#assetCode").val() == 208){
			$("#year").val("5");
		}
		
		$.ajax({
			url  : "${pageContext.request.contextPath }/insertStatusFrm",
			data : "assetCode="+$("#assetCode").val() + "&"+ "acquisitionDate="+$("#acquisitionDate").val()+ 
					"&" + "purchaseCode="+$("#purchaseCode").val() + "&" + "sanggakWay="+$("#sanggakWay").val()+ 
					"&" + "acquisitionPrice="+$("#acquisitionPrice").val(),
			success : function(data){
				console.log(data);
				alert(data);
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
	$(function() {
	    //input을 datepicker로 선언
	    $("#acquisitionDate").datepicker({
	        dateFormat: 'yy/mm/dd' 
	        ,showOtherMonths: true 
	        ,showMonthAfterYear:true 
	        ,changeYear: true
	        ,changeMonth: true                 
	        ,showOn: "both"   
	        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" 
	        ,buttonImageOnly: true 
	        ,buttonText: "선택"                 
	        ,yearSuffix: "년" 
	        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] 
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	        ,minDate: "-1M" 
	        ,maxDate: "+1M"                
	    });                    
	    
	    $('#acquisitionDate').datepicker('setDate', 'today');             
	});
</script>