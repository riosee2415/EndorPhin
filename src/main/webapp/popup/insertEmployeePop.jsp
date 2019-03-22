<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>

<!-- Bootstrap -->
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/image/icon/HalfLife.ico" rel="shortcuticon">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="//code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script src="/resources/bootstrap/js/respond.js"></script>
</head>
  <body>
        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입 Form</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form role="form">
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" id="inputName" placeholder="이름을 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소</label>
                        <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPasswordCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputMobile">휴대폰 번호</label>
                        <input type="tel" class="form-control" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputtelNO">사무실 번호</label>
                        <input type="tel" class="form-control" id="inputtelNO" placeholder="사무실번호를 입력해 주세요">
                    </div>

                    <div class="form-group">
                    <label>약관 동의</label>
                    <div data-toggle="buttons">
                    <label class="btn btn-primary active">
                    <span class="fa fa-check"></span>
                    <input id="agree" type="checkbox" autocomplete="off" checked>
                    </label>
                    <a href="#">이용약관</a>에 동의합니다.
                    </div>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                </form>
            </div>

        </article>

        

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

	function initData() {
		<%-- $("#userId").val("<%=request.getParameter("userId")%>"); --%>
		$("#userId").val("${param.userId}");
		$("#userNm").val("${param.userNm}");
		$("#alias").val("${param.alias}");
		$("#addr1").val("${param.addr1}");
		$("#addr2").val("${param.addr2}");
		$("#zipcode").val("${param.zipcode}");
		$("#pass").val("${param.pass}");
		
	}

	
	$(document).ready(function() {
			initData();
			
			//제이쿼리 비교
			/* if("${msg}" != ""){
			alert("${msg}");
			} */

			//server side 에서 비교
			<c:if test="${requestScope.msg != null}">
			alert("${requestScope.msg}");
			</c:if>
			
			
			
			
			
		$("#zipcodeBtn").on("click", function() {

			new daum.Postcode({
				oncomplete : function(data) {
					console.log(data);
				
					//새 우편번호 : data.zonecode
					//우편번호 input select .val (data.zonecode)
					$("#zipcode").val(data.zonecode);
					
					//기본주소(도로주소) : data.roadAddress
					//주소1 input select .val (data.zonecode);
					$("#addr1").val(data.roadAddress);
					
					//상세주소 input focus
					$("#addr2").focus();
				
				
				
				
				}
			}).open();

		});
		//사용자 등록 버튼 클릭 이벤트
		$("#regBtn").on("click",function(){
			//사용자아이디
			if($("#userId").val().trim() == ""){
				alert("사용자 아이디를 입력하세요");
				$("#userId").focus();
				return false;
			}
			//사용자이름
			if($("#userNm").val().trim() == ""){
				alert("사용자 이름을 입력하세요");
				$("#userNm").focus();
				return false;
			}
			
			//별명
			if($("#alias").val().trim() == ""){
				alert("사용자 별명을 입력하세요");
				$("#alias").focus();
				return false;
			}
			
			//주소1
			if($("#addr1").val().trim() == ""){
				alert("사용자 주소를를 입력하세요");
				$("#addr1").focus();
				return false;
			}
			
			//주소2
			if($("#addr2").val().trim() == ""){
				alert("사용자 상세주소를 입력하세요");
				$("#zipcodeBtn").trigger("click");
				return false;
			}
			
			//우편번호
			if($("#zipcode").val().trim() == ""){
				alert("사용자 우편번호를 입력하세요");
				$("#zipcode").focus();
				return false;
			}
			
			//비밀번호
			if($("#pass").val().trim() == ""){
				alert("사용자 비밀번호를 입력하세요");
				$("#pass").focus();
				return false;
			}
			
			//정상적으로 validation 완료 --> form 전송
			$("#frm").submit();
		
		});
		
		
		
	});
</script>
  
  </body>
</html>