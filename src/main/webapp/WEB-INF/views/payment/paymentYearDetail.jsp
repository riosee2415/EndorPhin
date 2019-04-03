<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.payment.model.Payment_detailVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css"
	href="${pageContext.request.contextPath }/css/payment_leem.css"
	rel="stylesheet">


<% 
	Map<Integer,List<Payment_detailVo>> paymentDetailList = (Map<Integer,List<Payment_detailVo>>)request.getAttribute("paymentDetailList");
	
%>
<div class="container" style="margin-top: 50px">
	<div class="row">
		<div class="col-md-10" style="width: 100%">
			<div class="form-group">
				<table class="table table-striped">
					<thead class="thead">
						<tr>
							<th>사번</th>
							<th>성명</th>
							<th>직위</th>
							<th>부서명</th>
							<th>지급일</th>
							<c:forEach items="${divList}" var="vo">
								<th>${vo.deductName}</th>
							</c:forEach>	
							<th>총급여액</th>
							<th>총공제액</th>
							<th>총지급액</th>
						</tr>
					</thead>
					<tbody id="mainPaymentListTbody">
						<c:forEach step="1" items="${payList}" varStatus="index" var="payVo">
							<tr>
								<c:set var="divcheck" value="false"/>
								<td>${payVo.userId }</td>
								<td>${payVo.usernm }</td>
								<td>${payVo.positionname }</td>
								<td>${payVo.deptname }</td>
								<td>${payVo.payDay }</td>
								<td>${index.index}</td>
								<c:forEach items="${divList}" var="vo">
<%-- 									<c:forEach items="${paymentDetailList.get(index.index)}" var="pvo"> --%>
<%-- 										<td>${vo.deductCode==pvo.deductCode }1</td> --%>
<%-- 										<c:if test="${vo.deductCode==pvo.deductCode }"> --%>
<%-- 											<td>${pvo.deductPay }</td> --%>
<%-- 											<c:set var="divcheck" value="true"/> --%>
<%-- 										</c:if> --%>
<%-- 									</c:forEach> --%>
									<c:if test="${divcheck==false}">
<!-- 										<td>0</td> -->
									</c:if>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>

