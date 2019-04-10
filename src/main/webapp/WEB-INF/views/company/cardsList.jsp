<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

.thead{
color : white;
background-color: #6E6867;
}

</style>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2><i class="fa fa-calculator"></i> �ſ�ī�� ���</h2>
		<div class="form-group">
		<!--���̺� ����Ʈ���  -->
		<table>
			<tr>
				<td><strong>ī���ȣ :</strong></td>
				<td> <input class="search-query form-control" name="cardNumber1" id="cardNumber1" type="text" /></td>
				<td><strong>ī��� : </strong> </td>
				<td><input class="search-query form-control" name="cardName1" id="cardName1" type="text" /></td>
				<td><input class="bttn-fill bttn-md bttn-warning" type="button" id="seachBtn" value="�˻�"	onclick="seachBtn()" /><br>
				</td>
			</tr>
		</table>
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<td><input type="checkbox" name="allCheck" id="th_allCheck"
						onclick="allCheck();"></td>
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
					<input type="hidden" class="cardCode" name="cardCode"
						value="${vo.cardCode }" />
					<tr>
						<td><input type="checkbox" name="checkRow"
							value="${vo.cardCode }"></td>
						<td><a class="bttn-stretch bttn-md bttn-warning"
							href="${pageContext.request.contextPath}/cardsDetail?cardCode=${vo.cardCode }">${vo.cardCode }</a></td>
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

		<!--------------(����,���) ��ư ------------------->

		<div class="modal-footer">
			<input name="delect_btn" id="delect_btn" type="button" value="���û���" class="bttn-jelly bttn-warning"
				onclick="myclick()" />
			<button type="button" class="bttn-jelly bttn-warning" data-toggle="modal" 
				data-target="#my80sizeCenterModal">���</button>
		</div>
		</div>
	</div>
</div>				
	<!-------------- �ſ�ī�� ��� ���â ����  ------------>
	
	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
				<div class="modal-header">
				<label>�ŷ�ó ���</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="form-group">
					<!-- ������� �����ۼ� -->
						<label>�ſ�ī���ڵ�(*)</label> 
						<input type="text" id="cardCode" placeholder="�ڵ带 �Է��ϼ���"> 
						<input type="button" value="�ߺ�üũ" class="btn btn-default" id="duplCheckbtn" name="duplCheckbtn"/> 
						<div id="dupleCode"></div>
					</div>
					<div class="form-group">
						<label>����/����ī��</label>
						<input type="radio" name="cardSortation" value="0" checked="checked" />���� 
						<input type="radio" name="cardSortation" value="1"/>����
					</div>				
					<div class="form-group">
						<label>ī���ȣ(*) </label> 
						<input style="width: 388px;" type="text" name="cardNumber" id="cardNumber" placeholder="ī���ȣ�� �Է��ϼ���"> 
					</div>	
						<div class="form-group">
						<label>ī �� �� (*) </label> 
						<input style="width: 388px;" type="text" name="cardName" id="cardName" placeholder="ī����� �Է��ϼ���"> 
					</div>	
						<div class="form-group">
						<label>�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��&nbsp;</label> 
						<textarea style="width: 388px" id="memo" placeholder="�޸�">
						</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">���</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
				</div>
			</div>
		</div>
	</div>
	
	<!----------------���, �˻�, ���� ---------------->
	
	<form id="insertFrm" action="${pageContext.request.contextPath }/insertCards">
		<input type="hidden" id="frmcardCode" name="frmcardCode" />
		<input type="hidden" id="frmcardSortation" name="frmcardSortation" />
		<input type="hidden" id="frmcardNumber" name="frmcardNumber" />
		<input type="hidden" id="frmcardName" name="frmcardName" />
		<input type="hidden" id="frmmemo" name="frmmemo" />
	</form>
	
	<form id="frm1" action="${pageContext.request.contextPath }/serachCards" >
		<input type="hidden" name="card_num" id="card_num" />
		<input type="hidden" name="card_name" id="card_name" />
	</form>
 	
 	<form id="del_frm" action="${pageContext.request.contextPath }/deleteCards">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		
 		
	<!-------------------------------------------->
 	
	<script>
	    /* ���  */
		$("#insertBtn").on("click", function(){
			
			var cardCode 		= $("#cardCode").val();
			var cardSortation   = $("#cardSortation").val();
			var cardNumber		= $("#cardNumber").val();
			var cardName 		= $("#cardName").val();
			var memo 			= $("#memo").val();
			
			$("#frmcardCode").val(cardCode);
			$("#frmcardSortation").val(cardSortation);
			$("#frmcardNumber").val(cardNumber);
			$("#frmcardName").val(cardName);
			$("#frmmemo").val(memo);
			
			if($("#cardNumber").val().trim()==""){
				alert("ī���ȣ�� �Է��ϼ���");
				$("#cardNumber").focus();
				return false;
			}
			if($("#cardName").val().trim()==""){
				alert("ī���̸��� �Է��ϼ���");
				$("#cardName").focus();
				return false;
			}
		     
			$("#insertFrm").submit();
		
	});
	    /* ī���ڵ� �ߺ�üũ ajax */
 	    $("#duplCheckbtn").on("click", function(){
	    	
	    	$.ajax({
	    		url 	: "${pageContext.request.contextPath }/DupleCards",
	    		method  : "post",
	    		data 	: "cardCode="+$("#cardCode").val(),
	    		success : function(dupleCode){
	    			transDupl(dupleCode);
	    		}
	    	});
	    }); 
	
		var dupleCode ="";
	    function transDupl(dupleCode){
	    	if(dupleCode == "0"){
	    		dupleCode ="<b><font color='blue'>��밡���� ī�� �ڵ��Դϴ�.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "1"){
	    		dupleCode="<b><font color='red'>�ߺ��� ī�� �ڵ��Դϴ�.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>ī�� �ڵ带 �Է��ϼ���.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}
	    }  
	    
		/* �˻� */
		function seachBtn(){
			var cardNumber = $("#cardNumber1").val();
			var cardName   = $("#cardName1").val();
			
			$("#card_num").val(cardNumber);
			$("#card_name").val(cardName);
			
			if(cardNumber === "" && cardName === ""){
				alert("ī���ȣ�� ī����� �Է��ϼ���.");
				$("card_num1").focus();
			
			}else if(cardName !== "" && cardNumber !== ""){
				$("#cardNumber1").val(cardNumber);
				$("#cardName1").val(cardName);

				$("#frm1").submit();		
			}
		}
		
		/* ��ü���� ���� */
		function allCheck() {
			if ($("#th_allCheck").is(':checked')) {
					$("input[name=checkRow]").prop("checked", true);
				} else {
					$("input[name=checkRow]").prop("checked", false);
				}
			}

		/* ���û���  */
		function myclick() {
			var checkRow = '';
			$("input[name=checkRow]:checked").each(function() {
				checkRow += $(this).val()+",";
			});
				checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //�ǳ� �޸� �����  
				$("#checkRow").val(checkRow);
				
			if(checkRow === ""){		
				alert("������ ����� �����ϼ���");
				return false;
			}
			
			
 				$("#del_frm").submit();
		}
	
	</script>
	

 	
