<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%> /css/dashboard.css"
	rel="stylesheet">

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
.modal.modal-center {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>


</head>
<body>



	<div class="container">
	<table>
	<tr>
		<td><h2>������</h2></td>
	</tr>
	<tr>
	<td colspan="1"></td>
		<td><h3>����˻�</h3></td>
		<td>
		<input type="text" class="  search-query form-control"
				placeholder="Search" /> <span class="input-group-btn">
				</td>
				<td>
				<button class="btn btn-primary" type="button">
					<span class=" glyphicon glyphicon-search"></span>
				</button>
			</span>
		</td>
		</tr>
		</table>
	</div>

	<div class="container">
		<table class="table table-striped"
			style="font-weight: normal; font-size: 1.3em;">
			<thead>
				<tr>
					<th>����</th>
					<th>�����ȣ</th>
					<th>�����</th>
					<th>�μ��ڵ�</th>
					<th>��å�ڵ�</th>
					<th>�����ڵ�</th>
					<th>�ټӳ��</th>
					<th>���</th>
					<th>�Ի���</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allEmployee}" var="allEmployee">
					<tr>
						<td><input type="checkbox" style="width: 30px; height: 30px;"></td>
						<td>${allEmployee.userId }</td>
						<td>${allEmployee.userNm }</td>
						<td>${allEmployee.deptCode }</td>
						<td>${allEmployee.positionCode }</td>
						<td>${allEmployee.rankCode }</td>
						<td>${allEmployee.continuousYear }</td>
						<td>${allEmployee.relate }</td>
						<td>${allEmployee.joinCompany }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<div class="container">
		<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#my80sizeCenterModal">����</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#my80sizeCenterModal">�űԵ��</button>
	</div>



	<!-- 80%size Modal at Center -->
	<div class="modal modal-center fade" id="my80sizeCenterModal"
		tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
		<div class="modal-dialog modal-80size modal-center" role="document">
			<div class="modal-content modal-80size">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�űԵ��</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<!-- ������� �����ۼ� -->
						<label for="inputName">����</label> <input type="text"
							class="form-control" id="inputName" placeholder="�̸��� �Է��� �ּ���">
					</div>
					<div class="form-group">
						<label for="InputEmail">�̸��� �ּ�</label> <input type="email"
							class="form-control" id="InputEmail" placeholder="�̸��� �ּҸ� �Է����ּ���">
					</div>
					<div class="form-group">
						<label for="inputPassword">��й�ȣ</label> <input type="password"
							class="form-control" id="inputPassword"
							placeholder="��й�ȣ�� �Է����ּ���">
					</div>
					<div class="form-group">
						<label for="inputPasswordCheck">��й�ȣ Ȯ��</label> <input
							type="password" class="form-control" id="inputPasswordCheck"
							placeholder="��й�ȣ Ȯ���� ���� �ٽ��ѹ� �Է� �� �ּ���">
					</div>
					<div class="form-group">
						<label for="inputMobile">�޴��� ��ȣ</label> <input type="tel"
							class="form-control" id="inputMobile"
							placeholder="�޴�����ȣ�� �Է��� �ּ���">
					</div>
					<div class="form-group">
						<label for="inputtelNO">�繫�� ��ȣ</label> <input type="tel"
							class="form-control" id="inputtelNO" placeholder="�繫�ǹ�ȣ�� �Է��� �ּ���">
					</div>
				</div>
				<!-- ������� -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
				</div>
			</div>
		</div>
	</div>




</body>

</html>