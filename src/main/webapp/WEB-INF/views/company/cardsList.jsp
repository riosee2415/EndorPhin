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
		<h2>�ſ�ī�� ���</h2>	
		<br>
		ī���ȣ &nbsp <input name="cardNumber" id="cardNumber" type="text" />
		&nbsp ī���  &nbsp<input name="cardName" id="cardName" type="text" />
		&nbsp<input type="button" id="seachBtn" value="�˻�" onclick="seachBtn()" /><br>
	
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<td><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></td> 
						<th>ī�� �ڵ�</th>
						<th>ī���ȣ</th>
						<th>ī���</th>
						<th>ī�屸��</th>
						<th>�޸�</th>
						<th>��뱸��</th>
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
									<td>����</td>
								</c:when>
								<c:otherwise>
									<td>����</td>
								</c:otherwise>
							</c:choose>
							<td>${vo.memo }</td>
							<c:choose>
								<c:when test="${vo.status == 1}">
									<td>���</td>
								</c:when>
								
								<c:otherwise>
									<td><font color="red"> �̻��</font></td>
								</c:otherwise>
							</c:choose>
						</tr>		
					</c:forEach>
				</tbody>
			</table>
		    <input name="delect_btn" id="delect_btn" type="button" value="���û���" onclick="myclick()" />
			<input name="insert_btn" id="insert_btn" type="button" value="�űԵ��" onclick="insert_btn()" />
		</div>
	
	
	<script>
		/* �˻�  �����ȵ� */
		function seachBtn(){
			var cardNumber = $("#cardNumber").val();
			var cardName = $("#cardName").val();
			
			if(cardNumber === "" && cardName === ""){
				alert("ī���ȣ�� ī����� �Է��ϼ���.");
				$("cardNumber").focus();
			
			}else if(cardName !== "" && cardNumber !== ""){
				$("#card_num").val(cardNumber);
				$("#card_name").val(cardName);

				$("#frm1").submit();		
			}
		}
		
		/* ��üüũ */
		function allCheck() {
			if ($("#th_allCheck").is(':checked')) {
					$("input[name=checkRow]").prop("checked", true);
				} else {
					$("input[name=checkRow]").prop("checked", false);
				}
			}

		/* ����üũ */
		function myclick() {
			var checkRow = '';
			$("input[name=checkRow]:checked").each(function() {
				checkRow += $(this).val()+",";
			});
				checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //�ǳ� �޸� �����  
				$("#checkRow").val(checkRow);
				
			//	alert(checkRow);
			
			if(checkRow === ""){		
				alert("������ ����� �����ϼ���");
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