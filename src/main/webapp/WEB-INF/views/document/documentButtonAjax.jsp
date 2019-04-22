<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${selectDocument }" var="vo">
	<c:if test="${sessionScope.employeeVo.userId !=null }">
		<c:if test="${sessionScope.employeeVo.userId == vo.userId}">
			<c:if test="${documentNumber == vo.userId}">
				<div class="modal-footer">
					<button type="button" id="approvalBtn"
						class="btn btn-outline-secondary">승인</button>
					<button type="button" id="backBtn" class="btn btn-secondary">반려</button>
				</div>
			</c:if>
		</c:if>
	</c:if>
</c:forEach>