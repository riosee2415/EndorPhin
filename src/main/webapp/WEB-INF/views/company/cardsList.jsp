<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<h2>신용카드 등록</h2>	
		<br>
		카드번호 &nbsp <input name="cardNumber" id="cardNumber" type="text" />
		&nbsp 카드명  &nbsp<input name="cardName" id="cardName" type="text" />
		&nbsp<input type="button" id="seachBtn" value="검색" onclick="seachBtn()" /><br>
	
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<td><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></td> 
						<th>카드 코드</th>
						<th>카드번호</th>
						<th>카드명</th>
						<th>카드구분</th>
						<th>메모</th>
						<th>사용구분</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cardsList }" var="vo">
						<input type="hidden" class="cardCode" name="cardCode" value="${vo.cardCode }"/>
						<tr class="cardsTr" data-cardCode="${vo.cardCode }">
						
							<td><input type="checkbox" name="checkRow" value="${vo.cardCode }" ></td>
							<td>${vo.cardCode }</td>
							<td>${vo.cardNumber }</td>
							<td>${vo.cardName }</td>
							<c:choose>
								<c:when test="${vo.cardSortation == 1 }">
									<td>개인</td>
								</c:when>
								<c:otherwise>
									<td>법인</td>
								</c:otherwise>
							</c:choose>
							<td>${vo.memo }</td>
							<c:choose>
								<c:when test="${vo.status == 1}">
									<td>사용</td>
								</c:when>
								
								<c:otherwise>
									<td><font color="red"> 미사용</font></td>
								</c:otherwise>
							</c:choose>
						</tr>		
					</c:forEach>
				</tbody>
			</table>
		    <input name="delect_btn" id="delect_btn" type="button" value="선택삭제" onclick="myclick()" />
			<input name="insert_btn" id="insert_btn" type="button" value="신규등록" onclick="insert_btn()" />
		</div>
	
	
	<script>
		/* 검색  아직안됨 */
		function seachBtn(){
			var cardNumber = $("#cardNumber").val();
			var cardName = $("#cardName").val();
			
			if(cardNumber === "" && cardName === ""){
				alert("카드번호와 카드명을 입력하세요.");
				$("cardNumber").focus();
			
			}else if(cardName !== "" && cardNumber !== ""){
				$("#card_num").val(cardNumber);
				$("#card_name").val(cardName);

				$("#frm1").submit();		
			}
		}
		
		/* 전체체크 */
		function allCheck() {
			if ($("#th_allCheck").is(':checked')) {
					$("input[name=checkRow]").prop("checked", true);
				} else {
					$("input[name=checkRow]").prop("checked", false);
				}
			}

		/* 선택체크 */
		function myclick() {
			var checkRow = '';
			$("input[name=checkRow]:checked").each(function() {
				checkRow += $(this).val()+",";
			});
				checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
				$("#checkRow").val(checkRow);
				
			//	alert(checkRow);
			
			if(checkRow === ""){		
				alert("삭제할 대상을 선택하세요");
				return false;
			}
 				$("#del_frm").submit();
		}
		
  	   $(document).ready(function(){
  	
         $(".cardsTr").on("click",function(){
              var cardCode = $(this).data("cardCode");
          
              $("#cardCode").val(cardCode);
          	  $("#frm").submit();
          });
       });
	</script>
	
	<form id="frm1" action="${pageContext.request.contextPath }/serachCards" >
		<input type="hidden" name="card_num" id="card_num" />
		<input type="hidden" name="card_name" id="card_name" />
	</form>
 	
 	<form id="del_frm" action="${pageContext.request.contextPath }/deleteCards">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>
 	
 	<form id="frm" action="${pageContext.request.contextPath }/cardsDetail" >
 		<input type="hidden" id="cardCode" name="cardCode"value="${cardCode }">
 	</form>
</body>
</html>