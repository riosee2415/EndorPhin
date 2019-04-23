<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	
		<tr>
			<td><input class="slipdate" type="text" value="${slipDate }" readonly/></td>
			<td style="width: 50px;">
				<c:choose>
					<c:when test="${status == 0 }">
						<input type="text" value="차변" readonly />
					</c:when>
					<c:otherwise>
						<input type="text" value="대변" readonly />
					</c:otherwise>
				</c:choose>
			</td>
			
				<td><input type="text" value="${establish }" readonly/></td>
				<td><input type="text" value="${client }" readonly/></td>
				<td><input class="departmentName" type="text" value="${dept }" readonly/></td>
				<td><input class="slipJukyo" type="text" value="${juckyo }" readonly/></td>
			
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
			</td>
		</tr>
	
	
	
	
	<script>
		$("document").ready(function(){
			var leftSum = 0;
			var rightSum = 0;
			
			
			//차변합계
			$(".left").each(function(){
				leftSum += parseInt($(this).val());
			});
			$("#leftVale").text("차변합게 : " + leftSum);
		
		
			//대변합계
			$(".right").each(function(){
				rightSum += parseInt($(this).val());
			});
		
			$("#rightVale").text("대변합게 : " + rightSum);
		});
		
		
		
		
	</script>
	

