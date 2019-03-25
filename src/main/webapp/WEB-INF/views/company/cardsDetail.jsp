<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">

	<div class="form-group">
		<label for="board_num" class="col-sm-3 control-label">글 번호</label>
		<div class="col-sm-9">
			<label class="control-label">${cardsVo.cardCode }</label> 
			<input type="hidden" id="cardCode" name="cardCode" value="${cardCode }">
		</div>
		<div class="form-group">
			<label for="title" class="col-sm-3 control-label">제목</label>
			<div class="col-sm-9">
				<label class="control-label">${cardsVo.cardNumber }</label>
			</div>
		</div>

		<div class="form-group">
			<label for="title" class="col-sm-3 control-label">제목</label>
			<div class="col-sm-9">
				<label class="control-label">${cardsVo.cardName }</label>
			</div>

	</div>
	</div>
	</div>
	
	
</body>
</html>