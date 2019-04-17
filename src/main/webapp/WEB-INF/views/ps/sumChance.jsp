<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
	
	<h2>
			<i class="fa fa-calculator"></i>합계잔액시산표1
		</h2>
		
		
					<select id="year" name="year">
						<c:forEach items="${years }" var="year"> 
							<option value="${year }">${year }</option>
						</c:forEach>
					</select>
	
					<select id="month" name="month">
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
					<input id="searchBtn" class="bttn-fill bttn-warning" type="button" value="검색" />
					<br /> <br />

		<table class="table table-hover" style="font-size: small;">
		
			<thead class="thead">
				<tr>
					<td colspan="2">차변</td>
					<td rowspan="2">계정과목</td>
					<td colspan="2">대변</td>
				</tr>
	
				<tr>
					<td>잔액</td>
					<td>합계</td>
					<td>합계</td>
					<td>잔액</td>
				</tr>
			</thead>

			<tbody id="assetsArea">
				<tr>
					<td style="text-align: center; background-color: silver; font-size: medium; font-weight: bold;" colspan="5">자산</td>
				</tr>
			</tbody>

			<tbody id="obligationArea">
				<tr>
					<td style="text-align: center; background-color: silver; font-size: medium; font-weight: bold;" colspan="5">부채</td>
				</tr>
			</tbody>

			<tbody id="capitalArea">
				<tr>
					<td style="text-align: center; background-color: silver; font-size: medium; font-weight: bold;" colspan="5">자본</td>
				</tr>
			</tbody>

			<tbody id="costArea">
				<tr>
					<td style="text-align: center; background-color: silver; font-size: medium; font-weight: bold;" colspan="5">비용</td>
				</tr>
			</tbody>

			<tbody id="revenueArea">
				<tr>
					<td style="text-align: center; background-color: silver; font-size: medium; font-weight: bold;" colspan="5">수익</td>
				</tr>
			</tbody>

		</table>

	</div>
</div>


<script>


// Action
	$("#searchBtn").on("click",function(){
		
		var year = $("select[name=year]").val();
		var month = $("select[name=month]").val();
		
		callAssetData(year, month);
		
	}); 
	
	
	
	
	
	
	
// Function

	/* 년월 데이터로 자산 불러오기*/
	function callAssetData(year, month){
		$.ajax({
			url : "${pageContext.request.contextPath }/callAssetData",
			data : "year=" + year + "&month=" + month,
			success : function(data){
				$("#assetsArea").html("<tr>	<td style='text-align: center; background-color: silver; font-size: medium; font-weight: bold;' colspan='5'>자산</td></tr>");
				$("#assetsArea").append(data);
			}
			
		});
	
	}
	
	
	
	
	
	
	
	
	
</script>






