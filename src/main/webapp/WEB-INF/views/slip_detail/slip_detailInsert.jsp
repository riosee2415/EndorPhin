<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	
	<table>
		<tr>
			<td><input type="text" value="${slipDate }" readonly/></td>
			<td style="width: 50px;">
				<c:choose>
					<c:when test="${status == 0 }">
						<input  type="text" value="차변" readonly />
					</c:when>
					<c:otherwise>
						<input type="text" value="대변" readonly />
					</c:otherwise>
				</c:choose>
			</td>
			
				<td><input type="text" value="${establish }" readonly/></td>
				<td><input type="text" value="${client }" readonly/></td>
				<td><input type="text" value="${dept }" readonly/></td>
				<td><input type="text" value="${juckyo }" readonly/></td>
			
			<td>
				<c:choose>
					<c:when test="${status == 0 }">
						<input class="left" type="text" value="${price }" readonly/>
						<input type="text" value="" readonly/>
					</c:when>
					<c:otherwise>
						<input type="text" value="" readonly/>
						<input class="right" type="text" value="${price }" readonly/>
					</c:otherwise>
				</c:choose>
			</Td>
		<tr>
	</table>
	
	
	<script>
		$("document").ready(function(){
			var leftSum = 0;
			var rightSum = 0;
			
			
			//차변합계
			$(".left").each(function(){
				leftSum += parseInt($(this).val());
			});
			$("#leftVale").text(leftSum);
		
		
			//대변합계
			$(".right").each(function(){
				rightSum += parseInt($(this).val());
			});
		
			$("#rightVale").text(rightSum);
		});
		
		
		
		
	</script>
	

