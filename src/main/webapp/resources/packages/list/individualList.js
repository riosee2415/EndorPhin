
 document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar2');

    var calendar = new FullCalendar.Calendar(calendarEl, {
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
      
      
      
      
    //============================================타이틀 수정 시작
	  
      eventClick: function(event, element) {
   		
   		var title = prompt('Event Title:');
   		
   	    event.event.setProp = title;
   	    
   	    
   	    console.log(event);
   	    
   	 var id =  event.event.id;
   	 var title = event.event.setProp;
   	    
   	    $.ajax({
   	          url         : "/schedule/scheduleUpdateAjax" ,
   	          method      : "get",
   	          traditional : true,
   	           data      : {  schedule_no: id,
   	                          schedule_title: title
   	           }, 
   	          success      : function(data) {
   	             calendar.refetchEvents();
   	          } 
   	       });  
   	   
   	  },
   	  
      //===========================================================타이틀 수정 종료
     
      
      
      
      
      
      //============================================일정 이동하기 시작
      eventDrop: function(info) {
          console.log(info);
          
          if(info.event.end != null){
       	   var id =  info.event.id;
              var title = info.event.title;
              var start = getFormatDate(info.event.start);
              var end = getFormatDate(info.event.end); 
          }else if(info.event.end == null){
       	   var id =  info.event.id;
              var title = info.event.title;
              var start = getFormatDate(info.event.start);
              var end = getFormatDate(info.event.start); 
          }
          
              
          
          
   	   $.ajax({
   	          url         : "/schedule/scheduleUpdateAjax" ,
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
    //============================================일정 이동하기 종료
      
      
      
      
      
      
      eventDragStop: function(event) {
          
          var trashEl = jQuery('#calendar2');
          var ofs = trashEl.offset();

          var x1 = ofs.left;
          var x2 = ofs.left + trashEl.outerWidth(true);
          var y1 = ofs.top;
          var y2 = ofs.top + trashEl.outerHeight(true);
          
          if (!(event.jsEvent.pageX >= x1 && event.jsEvent.pageX<= x2 &&
               event.jsEvent.pageY >= y1 && event.jsEvent.pageY <= y2)) {
                event.el.remove();
             $.ajax({
                url         : "/schedule/scheduleDeleteAjax" ,
                method      : "get",
                traditional : true,
                 data      : {  scNo: event.event.id}, 
                success      : function(allSchedule) {
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
                                        
             $.ajax({
                 url         : "/schedule/scheduleInsertAjax" ,
                 method      : "get",
                 traditional : true,
                  data      : {     title: title,
                	  				userid: userid,
                                    start: arg.startStr,
                                    end: arg.endStr,
                                    allDay: arg.allDay}, 
                 success      : function(data) {
                       calendar.refetchEvents();
                       
                 } 
              }); 
         calendar.unselect()
       },
       
       
       
       
       
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: function(t , s , f){
    	  
    	         
    	                                 
    	  
    	  
    	  $.ajax({
              url         : "/schedule/getAllSchedule" ,
              method      : "get",
              async: false,
              success      : function(allSchedule) {
           		
                 var datas2=[];
                 
                 

				 for (var i = 0; i < allSchedule.length; i++) {
						var temp = allSchedule[i];
						if (temp.userid == userid) {

							datas2.push({
								id : temp.schedule_no,
								title : temp.schedule_title,
								start : temp.schedule_start,
								end : temp.schedule_end
							});
						}
					}   
                 s(datas2);
     
                 
              }                 
           }); 
    	  
      }
      
    });
 
                            
    
    calendar.render();
    calendar.refetchEvents();
  });
 
 
