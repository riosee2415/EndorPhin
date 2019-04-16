<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2>
			<i class="fa fa-calculator"></i>매입매출장
		</h2>



			<table>
				<tr>
					
					<td align="center">유형</td>
					<td><select style="width: 140px;" id="first" onchange="javascript:firstDataRead()">
						<option>-----</option>
						<option>매입</option>
						<option>매출</option>
					</select></td>
					<td align="center">구분</td>
					<td><select style="width: 140px;" id="second"></select></td>
					<td><input class="bttn-fill bttn-warning" id="search_1" type="button" value="검색" /></td>

				</tr>
				
			</table>
			<br />
			<table>
				<tr>
					<td> 날짜 : <input type="text" /></td>
					<td>  ~  </td>
					<td> <input type="text" /></td>
				</tr>
			</table>
			
			<br />

	<table class="table table-hover" style="font-size: small;">
		<thead class="thead">
			<tr>
				<td>날짜</td>
				<td>구분</td>
				<td>공급가액</td>
				<td>부가세</td>
				<td>공급대가</td>
				<td>거래처</td>
			</tr>
		</thead>
		
		<!-- 검색한 데이터 뷰  -->
		<tbody id="searchDataList">
		 
		</tbody>
	</table>
	
	
	
	
	<!-- 합계영역 --> 
	<table class="table table-hover" style="font-size: small;">
		<thead class="thead">
			<tr>
				<td>합계</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>공급가액</td>
				<td>부가세</td>
				<td>공급대가</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</thead>
		
		
		<tbody id ="totalValue">
		</tbody>

		</table>


	</div>
</div>




<script>

	

	$("document").ready(function(){
		
		
	});
	
	
	
// Play Event

	/* 첫번찌 검색버튼 클릭 */
	$("#search_1").on("click", function(){
		var str1 = $("#first").val();
		var str2 = $("#second").val();
		
		if(str2 ==  "undefined" || str2 == null || str2 == ""){
			alert("유형과 구분을 선택하세요.");
		} else {
			searchData_1(str1, str2);
		}
		
		
	});
	
	
	
	
	
	
	
// function
	
	/* select box 데이터 설정 */
	function firstDataRead(){
	
		var purchaseType 	= ["전체", "과세매입", "영세율", "계산서", "불공", "수입분", "금전등록", "카드과세", "카드면세", "카드영세", "무증빙", "현금과세"];
		var sellType		= ["전체","과세매출", "영세율매출", "계산서매출", "과세무증빙", "간이과세", "수출L/C", "카드과세", "카드면세", "카드영세", "면세무증", "전자화폐", "현금과세", "현금면세", "현금영세"];
		
	
		var firstItems = $("#first").val();
		
		var changeItems;
		if(firstItems == "매입"){
			changeItems = purchaseType;
		} else if (firstItems == "매출"){
			changeItems = sellType;
		}
		
		$("#second").empty();
		
		for(var count = 0; count < changeItems.length; count++){                
            var option = $("<option>"+changeItems[count]+"</option>");
            $('#second').append(option);
        }
	}
	
	
	/* 1차 검색 뷰 (전체) */
	function searchData_1(str1, str2){
		$.ajax({
			url : "${pageContext.request.contextPath }/searchAllByType",
			data : "searchData1=" + str1 + "&searchData2=" + str2,
			success : function(data){
				$("#searchDataList").html("");
				$("#totalValue").html("");
				
				
				
				var inputValue = data.split("==");
				
				$("#searchDataList").html(inputValue[0]);
				$("#totalValue").html(inputValue[1]);
				
				
				bringSum();
			}
		});
		
		
	}
	
	
	
	
	/* 합계 구하기 */
	function bringSum(){
		var s1 = 0;
		var s2 = 0;
		var s3 = 0;
	
		$(".searchSupplyValue").each(function(){
			s1 += parseInt($(this).text().replace(/,/g,""));
			
		});
		
		$(".searchSurtax").each(function(){
			s2 += parseInt($(this).text().replace(/,/g,""));
			
		});
		
		$(".searchSumValue").each(function(){
			s3 += parseInt($(this).text().replace(/,/g,""));
			
		});
		
		
		s1 = numberWithCommas(s1 + "");
		s2 = numberWithCommas(s2 + "");
		s3 = numberWithCommas(s3 + "");
		
		
		
		
		$("#setSumSupplyValue").text(s1);
		$("#setSurtax").text(s2);
		$("#setSumSumValue").text(s3);
	}
	
	
	
	
	/* 콤마 찍기 */
	function numberWithCommas(x) {
		
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


	
			
</script>