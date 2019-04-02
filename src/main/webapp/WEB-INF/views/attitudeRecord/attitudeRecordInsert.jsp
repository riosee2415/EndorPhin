<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>

.inputCla{
width: 100px;
}


</style>
	

      
      
<div class="modal" id="myModal" aria-hidden="true" style="display: none; z-index: 1050;">
       <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">근태이력 신규등록</h4>
            </div><div class="container"></div>
            <div class="modal-body">
      
       
        	<form action="${cp}/attitudeRecord/attitudeRecordInsert" method="post"> 
						
						
						<div class="row-0">
						<div class="col-0-0">
						<ul style="border-spacing:5 px;">
						<li>
							근태 항목
								<select id="paidStatus" name="attitudecode">
										<option value="1">연차휴가</option>
										<option value="2">예비군훈련</option>
										<option value="3">여름휴가</option>
								</select>
							</li>		
							<li id="hiddenUser" style="margin-top: 20px">
									 <input class="inputCla" type="text"  id="startDateInsert" name="startday">~
								
									<input class="inputCla" type="text"  id="endDateInsert" name="endday" onchange="call()">
											
									<input style="margin-left: 60px;" type="text" id="basedays" name="basedays">일수
								</li>	
								</ul>
								</div>
								</div>
								<input type="hidden" name="">
					
						<!--  사원 불러오기 -->
						<div class="row-1" style="margin-top: 50px">
						<div class="col-1-0">
						
																		
							<a id="attitudeRecordInsert" data-toggle="modal" href="#myModal2"  class="btn btn-primary">사원 불러오기</a>
	
								</div>
								</div>
								
								<!--  사원 불러오기 종료-->
					
								<!-- 불러온 사원 목록창 -->
						<div class="row-2" style="margin-top: 50px">
						<div class="col-2-0">
						
						
						<table class="table table-striped" style="text-align: center;" border="1">
						<thead class="thead" >
							<tr >
								<th>사번</th>
								<th>사원명</th>
								<th>부서명</th>
								<th>메모</th>
							</tr>
						</thead>
						
					 <tbody id="recordUserList">
						</tbody> 

					</table>
						
								</div>
								</div>
								<!-- 불러온 사원 목록창 종료 -->
								
	
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary" >저장</button>
							</form>	
              <a href="#" data-dismiss="modal" class="btn">취소</a>
            </div>
          </div>
        </div>
    </div>




<script>
	$(function() {
        $("#startDateInsert").datepicker(   // inputbox 의 id 가 startDate 이겠죠.
                {dateFormat:'yy-mm-dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
                 , showOn: 'button' // 우측에 달력 icon 을 보인다.
                 , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"  // 우측 달력 icon 의 이미지 패스 
                 , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
                 , changeMonth: true // 월선택 select box 표시 (기본은 false)
                 ,changeYear: true  // 년선택 selectbox 표시 (기본은 false)
                 ,showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
               });

        $("#endDateInsert").datepicker({dateFormat:'yy-mm-dd',showOn: 'button'
                , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", buttonImageOnly: true
                , changeMonth: true,changeYear: true,showButtonPanel: true});
        
        
      //초기값을 오늘 날짜로 설정
        $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
        $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  

    });
	
	function call() {
		
		var sdd = document.getElementById("startDateInsert").value;
	    var edd = document.getElementById("endDateInsert").value;
	    
	    
	    var arr1 = sdd.split('-');
	    var arr2 = edd.split('-');
	    
	    var dt1 = new Date(arr1[0],arr1[1],arr1[2]);
	    var dt2 = new Date(arr2[0],arr2[1],arr2[2]);
	    console.log("dt1 : " + dt1);
	    
	    var diff = dt2 - dt1;
	    
	    
	    
	    var day = 1000 * 60 * 60 * 24;
	    
	    
	    $("#basedays").val((parseInt(diff/day)));
	    
	}
    
	
	
	</script>




