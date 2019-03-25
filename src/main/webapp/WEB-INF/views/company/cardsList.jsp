<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<!--테이블 리스트출력  -->
	<h2>신용카드 등록</h2>	
	<br>
	<br>
	카드번호 &nbsp <input name="cardNumber1" id="cardNumber1" type="text" />
	&nbsp 카드명  &nbsp<input name="cardName1" id="cardName1" type="text" />
	&nbsp<input type="button" id="seachBtn" value="검색" onclick="seachBtn()" /><br>
	<br>
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
	</div>

	<!--------------(삭제,등록) 버튼 ------------------->
	
	<div class="modal-footer">
		<input name="delect_btn"  id="delect_btn" type="button" value="선택삭제" onclick="myclick()" />
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#my80sizeCenterModal">등록</button>
	</div>
				
	<!-------------- 신용카드 등록 모달창 띄우기  ------------>
	
	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
		<div class="modal-dialog modal-80size modal-center" role="document" >
			<div class="modal-content modal-80size">
				<div class="modal-header">
				<label>거래처 등록</label>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<!-- 여기부터 로직작성 -->
				<div class="modal-body">
					<div class="form-group">
					<!-- 여기부터 로직작성 -->
						<label>신용카드코드(*)</label> 
						<input type="text" id="cardCode" placeholder="코드를 입력하세요"> 
						<input type="button" value="중복체크" id="duplCheckbtn" name="duplCheckbtn"/> 
						<div id="dupleCode"></div>
					</div>
					<div class="form-group">
						<label>법인/개인카드</label>
						<input type="radio" name="cardSortation" value="0" checked="checked" />법인 
						<input type="radio" name="cardSortation" value="1"/>개인
					</div>				
					<div class="form-group">
						<label>카드번호(*) </label> 
						<input style="width: 388px;" type="text" name="cardNumber" id="cardNumber" placeholder="카드번호를 입력하세요"> 
					</div>	
						<div class="form-group">
						<label>카 드 명 (*) </label> 
						<input style="width: 388px;" type="text" name="cardName" id="cardName" placeholder="카드명을 입력하세요"> 
					</div>	
						<div class="form-group">
						<label>메 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 모&nbsp;</label> 
						<textarea style="width: 388px" id="memo" placeholder="메모">
						</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-------------------------------------------->
	
	<form id="insertFrm" action="${pageContext.request.contextPath }/insertCards">
		<input type="hidden" id="frmcardCode" name="frmcardCode" />
		<input type="hidden" id="frmcardSortation" name="frmcardSortation" />
		<input type="hidden" id="frmcardNumber" name="frmcardNumber" />
		<input type="hidden" id="frmcardName" name="frmcardName" />
		<input type="hidden" id="frmmemo" name="frmmemo" />
	</form>
	
	<!-------------------------------------------->
			
	<script>
	    /* 등록  */
	    
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
				alert("카드번호을 입력하세요");
				$("#cardNumber").focus();
				return false;
			}
			if($("#cardName").val().trim()==""){
				alert("카드이름을 입력하세요");
				$("#cardName").focus();
				return false;
			}
		     
			$("#insertFrm").submit();
		
	});
	/*     /* 카드코드 중복체크 ajax */
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
	    		dupleCode ="<b><font color='blue'>사용가능한 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "1"){
	    		dupleCode="<b><font color='red'>중복된 카드 코드입니다.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}else if(dupleCode == "empty"){
	    		dupleCode = "<b><font color='orange'>카드 코드를 입력하세요.</font><br>"
	    		$("#dupleCode").html(dupleCode);
	    	}
	    }  
	    
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
				
			if(checkRow === ""){		
				alert("삭제할 대상을 선택하세요");
				return false;
			}
 				$("#del_frm").submit();
		}
		
		/* 상세보기로 넘어가기 */
  	   $(document).ready(function(){
  	
         $(".cardsTr").on("click",function(){
              var cardCode = $(this).data("cardCode");
          
              $("#cardCode").val(cardCode);
          	  $("#detail_frm").submit();
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
 	
 	<form id="detail_frm" action="${pageContext.request.contextPath }/cardsDetail" >
 		<input type="hidden" id="cardCode" name="cardCode" >
 	</form>
</body>
</html>