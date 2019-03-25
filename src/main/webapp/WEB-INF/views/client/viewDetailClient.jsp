<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<h2>거래처 상세정보</h2>
	<hr><br />
	
	<div style="width: 30%; float:left;">
		<div class="table-responsive">
	         <table class="table table-striped">
					<tr> 
						<td><label class="detail_name">거래처코드 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).clientCode}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">대 &nbsp;&nbsp;표 &nbsp;&nbsp;자 :</label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).manager}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">이 &nbsp;&nbsp;메 &nbsp;&nbsp;일 :</label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).managerEmail}" readonly /></td>
					</tr>
					
			</table>
		</div>
	</div>
	
	
	<div style="width: 30%; float: left;">
		<div class="table-responsive">
	         <table class="table table-striped">
					<tr> 
						<td><label class="detail_name">거래처이름 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).clientName}" readonly /></td>
					</tr>
						
					<tr>
						<td><label class="detail_name">전 화 번 호 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).telephone}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">업종 / 업태 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).business}" readonly /></td>
					</tr>
			</table>
		</div>
	</div>
	
	
	<div style="width: 30%; float: left;">
		<div class="table-responsive">
	         <table class="table table-striped">
					<tr> 
						<td><label class="detail_name">사업자번호 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).salesNumber}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">팩 스 번 호 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).faxNumber}" readonly /></td>
					</tr>
					
					<tr>
						<td><label class="detail_name">과 세 유 형 : </label></td>
						<td><input type="text" class="detail_val" value="${vo.get(0).businessType}" readonly /></td>
					</tr>
			</table>
		</div>
	</div>
	
	
	
	<br /> <br /> <br /> <br />
	<br /> <br /> <hr>
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">소 &nbsp;&nbsp;재 &nbsp;&nbsp;지 :</label></td>
				<td><input style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).place}" readonly /></td>
			</tr>
		</table>
	</div>
	
	
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">메 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 모&nbsp; : </label></td>
				<td><input style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).relate}" readonly /></td>
			</tr>
		</table>
	</div>
	
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">은 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 행&nbsp; : </label></td>
				<td><input style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).bankName}" readonly /></td>
			</tr>
		</table>
	</div>
	
	
	<div class="table-responsive">
         <table class="table table-striped">
         	<tr>
				<td><label class="detail_name">계 좌 번 호 :</label></td>
				<td><input style="width: 1000px;" type="text" class="detail_val" value="${vo.get(0).accountNumber}" readonly /></td>
			</tr>	
		</table>
	</div>
	
	<div class="container">
		<button type="button" class="btn btn-primary" onclick="history.back(-1);">뒤로가기</button>
		<button type="button" id="" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">수정</button>
	</div>
	
	
	