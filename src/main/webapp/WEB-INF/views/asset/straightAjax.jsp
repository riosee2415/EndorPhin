<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   1일때 ㄴ dsfsdfsfsf
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
    