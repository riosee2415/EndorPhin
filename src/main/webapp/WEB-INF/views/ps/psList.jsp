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
						<option>매입</option>
						<option>매출</option>
					</select></td>
					<td align="center">구분</td>
					<td><select style="width: 140px;" id="second"></select></td>

				</tr>
			</table>







	</div>
</div>




<script>

	

	$("document").ready(function(){
		
	});
	
	
	
// function
	
	/* 첫번째 데이터 설정 */
	function firstDataRead(){
		var firstItems = $("#first").val();
		
		
	}
			
</script>