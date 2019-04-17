<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[등록화면 ]
1. 자산코드, 취득일 , 상각방법, 정률법 ,정액법을 등록한다.
2. 정류법과 정액법선택을 저장하고 화면을 분류함.-->
<table>
	<thead >
		<tr>
			<td colspan="2" >자산코드(*)
			<input type="text" id="assetCode" name="assetCode" >
				<input type="button" value="중복체크" id="duplCheckbtn" name="duplCheckbtn"/></td>
				<td colspan="6"><div id="dupleCode"></div></td>
			<td><br><br></td>
		<tr>
			<td colspan="2" > 취득일(*) &nbsp;&nbsp;&nbsp; 
				<input id="acquisitionDate" name="acquisitionDate" type="text" style="width: 200px;" id="acquisitionDate" >
			<td> &nbsp;&nbsp;* 유형 : 
				<select id ="purchaseCode" name="purchaseCode">
								<option value="과세메입" selected="selected">51 과세매입</option>
								<option value="불공" >54 불공</option>
				</select>
			</td>
			<td>  &nbsp;&nbsp;* 상각방법: 
				<select id ="sanggakWay" name="sanggakWay">
								<option value="1" selected="selected">정액법</option>
								<option value="0" >정률법</option>
				</select>
			</td>
			<td colspan="2">&nbsp;&nbsp;취득금액(*)
				<input type="text" id="acquisitionPrice" name="acquisitionPrice"></td> 
			<td>
				<button  id="insertBtn" name="insertBtn" class="btn btn-primary btn-sm">저장</button>
			</td>	
			<td>
			<button class="btn btn-primary btn-sm" onclick="fn_close();">닫기</button>
			</td>
		</tr>
	</thead>
</table>
<br>
<div id="serviceLife_div"></div>

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

$("#acquisitionPrice").keypress(function(e){
	
	fn_insertSet(e);
});
	function fn_insertSet(e){
		if(e.which == 13){
		var comma = fn_numberWithCommas($("#acquisitionPrice").val());
		
		$("#acquisitionPrice").val(comma);
	}
	}
	
	/* 내용연수표로 이동 */
	function myClick(){
		$.ajax({
			url  : "${pageContext.request.contextPath }/serviceLife",
			success : function(data){
				console.log(data);
				$("#tbody").html(data);
			}	   
		});
	}
	
	/*원단위 콤마 변환*/
	function fn_numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function removeComma(str){
		return parseInt(str.replace(/,/g,""));
	}
	
	$("#insertBtn").on("click", function(){

		if($("#assetCode").val().trim() == "" || $("#acquisitionPrice").val().trim()==""){
			alert("(*)은 필수 사항입니다.");
			return false;
		}
		var price = $("#acquisitionPrice").val();
		price = removeComma(price);
		$("#acquisitionPrice").val(price);
	
		$.ajax({
			url  : "${pageContext.request.contextPath }/insertStatusFrm",
			data : "assetCode="+$("#assetCode").val() + "&"+ "acquisitionDate="+$("#acquisitionDate").val()+ 
					"&" + "purchaseCode="+$("#purchaseCode").val() + "&" + "sanggakWay="+$("#sanggakWay").val()+ 
					"&" + "acquisitionPrice="+$("#acquisitionPrice").val(),
			success : function(data){
				$("#serviceLife_div").html(data);
				$("#serviceLife_div").html(data);
		
				var date  = new Date($("#acquisitionDate").val());
				var month = 12-date.getMonth();
				$("#month").val(month);
				$('#insertBtn').attr('disabled', true);

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
			return false;
		}else if(dupleCode == "empty"){
			dupleCode = "<b><font color='orange'>자산 코드를 입력하세요.</font><br>"
			$("#dupleCode").html(dupleCode);
			return false;
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
	
	function fn_close(){
		$("#insertArea").html("");
	}

</script>