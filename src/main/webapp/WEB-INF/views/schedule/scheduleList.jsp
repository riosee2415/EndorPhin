<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>
  body {
   /*  margin: 40px 10px; */
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: auto;
    margin: 0 auto;
  } 
/*============================================================*/
a:hover, a:focus {
	text-decoration: none;
	outline: none;
}

.tab .nav-tabs {
	border: none;
	border-bottom: 2px solid #079fc9;
	margin: 0;
}

.tab .nav-tabs li a {
	padding: 10px 20px;
	font-size: 25px;
	font-weight: 900;
	font-family: 바탕;
	text-transform: uppercase;
	border: 2px solid #e6e5e1;
	border-bottom: none;
	border-radius: 5px 5px 0 0;
	z-index: 1;
	position: relative;
	transition: all 0.3s ease 0s;
}

.tab .nav-tabs li a:hover, .tab .nav-tabs li.active a {
	background: #fff;
	color: #079fc9;
	border: 2px solid #079fc9;
	border-bottom-color: transparent;
}

.tab .nav-tabs li a:before {
	content: "";
	display: block;
	height: 2px;
	background: #fff;
	position: absolute;
	bottom: -2px;
	left: 0;
	right: 0;
	transform: scaleX(0);
	transition: all 0.3s ease-in-out 0s;
}

.tab .nav-tabs li.active a:before, .tab .nav-tabs li a:hover:before {
	transform: scaleX(1);
}
</style>




<body>

	<div class="container-fluid">
		<div class="row" style="margin-top: 50px">
			<div class="col-md-1"></div>

			<div class="col-md-2">
				<h1 style="font-weight: bolder;">
					<i style="color: #4981F2" class="fas fa-calendar-alt"></i>일정 관리
				</h1>
				
			</div>

		</div>

		<div class="row" style="margin-top: 20px">
			<div class="col-md-1"></div>
			<div class="col-md-10">

				<div class="tab" role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a id="frmTap"
							href="#Section1" aria-controls="home" role="tab"
							data-toggle="tab">캘린더 보기</a></li>
						<li role="presentation"><a href="#Section2"
							aria-controls="profile" role="tab" data-toggle="tab">목록 보기</a></li>
					</ul>

				</div>
			</div>
			<div class="col-md-1"></div>
		</div>





		<div class="row" style="margin-top: 50px">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="tab-content tabs">
					<div role="tabpanel" class="tab-pane fade in active" id="Section1">
						<!-- 달력 시작 -->
						<p>
						<div id='calendar'></div>
						</p>
						
						<!-- 달력 종료 -->
					</div>
					<div role="tabpanel" class="tab-pane fade" id="Section2">
						<!-- 목록 시작 -->
						<p>목록</p>
						<!-- 목록 종료 -->
					</div>

				</div>
			</div>
			<div class="col-md-1"></div>
		</div>



	</div>
	
<script>

//========================날짜포멧 시작
function getFormatDate(date){
   var year = date.getFullYear();                                 //yyyy
   var month = (1 + date.getMonth());                     //M
   month = month >= 10 ? month : '0' + month;     // month 두자리로 저장
   var day = date.getDate();                                        //d
   day = day >= 10 ? day : '0' + day;                            //day 두자리로 저장
   return  year + '-' + month + '-' + day;
}
//========================날짜포멧 종료

var calendar;

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      defaultDate: '2019-04-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      
      //============================================캘린더 수정부분 시작 
      
      eventResize : function(event) {
       var id = event.event.id;
        var title = event.event.title;
       var start = getFormatDate(event.event.start);
       var end = getFormatDate(event.event.end);
                                                       
     $.ajax({
           url         : "${cp}/schedule/scheduleUpdateAjax" ,
           method      : "get",
           traditional : true,
            data      : {  schedule_no: id,
                       schedule_title: title,
                       schedule_start: start,
                       schedule_end: end
            }, 
           success      : function(data) {
        	   calendar.refetchEvents();
           } 
        }); 
   
   },
   
   //===========================================================캘린더 수정부분 종료
      
      eventDragStop: function(event) {
		
    	    var trashEl = jQuery('#calendar');
    	    var ofs = trashEl.offset();

    	    var x1 = ofs.left;
    	    var x2 = ofs.left + trashEl.outerWidth(true);
    	    var y1 = ofs.top;
    	    var y2 = ofs.top + trashEl.outerHeight(true);
    	    if (!(event.jsEvent.pageX >= x1 && event.jsEvent.pageX<= x2 &&
    	         event.jsEvent.pageY >= y1 && event.jsEvent.pageY <= y2)) {
     				event.el.remove();
    	    	$.ajax({
        			url			: "${cp}/schedule/scheduleDeleteAjax" ,
        			method		: "get",
        			traditional : true,
        			 data		: {  scNo: event.event.id}, 
        			success		: function(allSchedule) {
        				event.event.remove();
        				calendar.refetchEvents();
        			} 
        		}); 
   	        }
  		},	
      select: function(arg) {
        var title = prompt('Event Title:');
        
    	  console.log(arg);
    	  console.log(title);
    	  if(title==''){
    		  alert('일정을 입력하세요');
    		  return false;
    	  }
    	  if(title!=null){
	    	  $.ajax({
	    			url			: "${cp}/schedule/scheduleInsertAjax" ,
	    			method		: "get",
	    			traditional : true,
	    			 data		: {  title: title,
	    	          			     start: arg.startStr,
	    	                         end: arg.endStr,
	    	                         allDay: arg.allDay}, 
	    			success		: function(data) {
	    				console.log("성공 " + data);
				   	    calendar.refetchEvents();
	    			} 
	    		}); 
    	  }
        calendar.unselect()
      },
              
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events:function (timeStamp,suss,fail){
    	  
  		$.ajax({
  			url			: "${cp}/schedule/getAllSchedule" ,
  			method		: "get",
  			async: false,
  			success		: function(allSchedule) {
  				var datas=[];
				for (var i = 0; i < allSchedule.length; i++) {
	  				var temp = allSchedule[i];
	   				datas.push({id : temp.schedule_no,
  	   						title : temp.schedule_title,
	 		  					start : temp.schedule_start,
	 		  					end : temp.schedule_end});
	  			}   
  				suss(datas);
  			}              	
  		}); 
  		
  	}
      
     });
    calendar.render();
  });

  
  $(document).ready(function() {
	  $("#frmTap").trigger('click');
	  	
	  });
</script>

<%--   --%>



</body>


