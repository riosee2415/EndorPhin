<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2>
			<i class="fa fa-calculator"></i>부가세신고서
		</h2>
		
		<input id="t1Btn" class="bttn-fill bttn-warning" type="button" value="1기 예정" />
		<input id="c1Btn" class="bttn-fill bttn-warning" type="button" value="1기 확정" />
		<input id="t2Btn" class="bttn-fill bttn-warning" type="button" value="2기 예정" />
		<input id="c2Btn" class="bttn-fill bttn-warning" type="button" value="2기 확정" />


<div id="view"></div>



	</div>
</div>


<Script>

// 버튼 입력 시 Action

	/*1기 예정*/
	$("#t1Btn").on("click", function(){
		searchTax_report_t1("19/01/01", "19/03/31");
	});

	/*1기 확정*/
	$("#c1Btn").on("click", function(){
		searchTax_report_t1("19/04/01", "19/06/30");
	});

	/*2기 예정*/
	$("#t2Btn").on("click", function(){
		searchTax_report_t1("19/07/01", "19/09/30");
	});
	
	/*2기 확정*/
	$("#c2Btn").on("click", function(){
		searchTax_report_t1("19/10/01", "19/12/31");
	});
	
	
	
	
//function

	/*1기 예정 조회*/
	function searchTax_report_t1(startDate, endDate){
		$.ajax({
			url : "${pageContext.request.contextPath }/searchTax_report",
			data : "startDate=" + startDate + "&endDate=" + endDate,
			success : function(data){
				console.log(data);
				$("#view").html(data);
			}
				
				
		});
	}
</Script>

