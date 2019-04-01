<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--���̺� ����Ʈ���  -->
	<h2>�̽��� ��ǥ </h2>	
	<br>
	<br>
	��ǥ���� &nbsp<input name="before_slipDate" id="before_slipDate" type="text" />
	- &nbsp<input name="after_slipDate" id="after_slipDate" type="text"/>
	&nbsp<input type="button" id="serachBtn" value="�˻�" /><br>
	<br>
<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead">
				<tr>
					<th><input type="checkbox" name="allCheck" id="th_allCheck" onclick="allCheck();"></th>
					<th>��ǥ��ȣ</th>
					<th>��ǥ����</th>
					<th>����</th>
					<th>��ǥ�ݾ�</th>
					<th>���μ�</th>
				</tr>
			</thead>
			<tbody id="deptListTbody">
			</tbody>
		</table>

		<c:set var="lastPage"
			value="${Integer(slipCnt/pageSize + (slipCnt%pageSize > 0 ? 1 : 0))}" />

		<nav style="text-align: center;">
			<ul id="pagination" class="pagination">
			</ul>
		</nav>

	</div>
</div>
<!--------------(����,���) ��ư ------------------->
	
	<div class="modal-footer">
		<button name="upd_btn"  id="upd_btn" type="button" value="0" onclick="myclick()">����</button>
	</div>
			
	<!-----------------�󼼺���  ���â ---------------->	
	
	<div class="modal fade" id="deptDetail" role="deptDetail" aria-hidden="true"> 
   		<div class="modal-dialog">
   			 <div class="modal-content"> 
	   			<div class="modal-header"> 
	   				<label>| ���λ󼼺���</label>
	   				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	   				<h4 class="modal-title" id="myModalLabel"></h4>
	   			</div> 
	   			<div class="modal-body"> 
	   				<div class="form-group">
	   					<label for="InputEmail">��ǥ��ȣ</label> 
	   					<input type="text" style="width:200px;" id="slipnumber" name="slipnumber" readonly>
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">��ǥ����</label> 
	   					<input type="text" style="width: 250px;" name="slipdate" id="slipdate"  > 
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
	   					<input type="text" style="width:250px;" id="jukyo" name="jukyo" />
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">��ǥ�ݾ�</label> 
	   					<input type="text" style="width: 250px;" name="total" id="total"  > 
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">��ǥ����</label> 
	   					<input type="text" style="width: 250px;" name="departmentname" id="departmentname"  > 
	   				</div>
	   				
	   			<div class="modal-footer">
	   			
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
   				</div> 
   			</div> 
   		</div> 
	</div>
</div>


	<!---------------����---------------->

 	<form id="update_frm" action="${pageContext.request.contextPath }/updateSlip">
 		<input type="hidden" id="checkRow" name="checkRow">
 	</form>		

 	<form id="useFrm" action="${pageConext.request.contextPath }/useDept">
		<input type="hidden"  id="frm_usestatus" name="frm_usestatus">
		<input type="hidden"  id="frm_deptCode" name="frm_deptCode" >
	</form>
	
    <!---------------------------------------------->
	<script>
    
	 $("document").ready(function() {
			/* �󼼺���  */
			$("#deptListTbody").on("click", ".detailView", function(){
				
				$("#slipnumber").val($(this).data().slipnumber);
				$("#slipdate").val($(this).data().slipdate);
				$("#jukyo").val($(this).data().jukyo);
				$("#total").val($(this).data().total);
				$("#departmentname").val($(this).data().departmentname);
				
			});
	 	});
	 
 
	$("#serachBtn").on("click", function(){
		
   	 	$.ajax({
       		url 	: "${pageContext.request.contextPath }/searchAjax_p",
       		data 	: "before_slipDate=" + $("#before_slipDate").val() +  "&" + "after_slipDate=" + $("#after_slipDate").val(),
       		success : function(data){
       			console.log(data);
       			var htmlArr = data.split("================seperator================");
       			$("#deptListTbody").html("");
       			$("#deptListTbody").html(htmlArr[0]);
       			$("#pagination").html("");
       			$("#pagination").html(htmlArr[1]);
       		
       		}
       	});
	});
 	
	$("document").ready(function(){
 		console.log('���ʽ���');
 		paaprovuarPageList(1);
 	});
 	function paaprovuarPageList(page){
 		
 		$.ajax({
 			url : "${pageContext.request.contextPath }/paaprovuarPageList",
 			data : "page=" + page,
 			success : function(data){
 				console.log('ajaxȣ��');
 				var htmlArr = data.split("================seperator================");
 				
 				$("#deptListTbody").html(htmlArr[0]);
 				$("#pagination").html(htmlArr[1]);
 			}
 		});
 	}
 	

	/* ��ü���� ���� */
	function allCheck() {
		if ($("#th_allCheck").is(':checked')) {
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}

	/* ���� �������*/
	function myclick() {
		var checkRow = '';
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val()+",";
		});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //�ǳ� �޸� �����  
			$("#checkRow").val(checkRow);
		
			if(checkRow === ""){		
			alert("������ ����� �����ϼ���");
			return false;
		}
		
		
		$("#update_frm").submit();
	}

	 
 	 $("document").ready(function(){
 	
       $(function() {
           //input�� datepicker�� ����
           $("#before_slipDate").datepicker({
               dateFormat: 'yy/mm/dd' //Input Display Format ����
               ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
               ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
               ,changeYear: true //�޺��ڽ����� �� ���� ����
               ,changeMonth: true //�޺��ڽ����� �� ���� ����                
               ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
               ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
               ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
               ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
               ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
               ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
               ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
               ,minDate: "-1M" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
               ,maxDate: "+1M" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)                
           });                    
           
           //�ʱⰪ�� ���� ��¥�� ����
           $('#before_slipDate').datepicker('setDate', 'today'); //(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���), (+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)            
       });
       
       $(function() {
           //input�� datepicker�� ����
           $("#after_slipDate").datepicker({
               dateFormat: 'yy/mm/dd' //Input Display Format ����
               ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
               ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
               ,changeYear: true //�޺��ڽ����� �� ���� ����
               ,changeMonth: true //�޺��ڽ����� �� ���� ����                
               ,showOn: "both" //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��  
               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //��ư �̹��� ���
               ,buttonImageOnly: true //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
               ,buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ                
               ,yearSuffix: "��" //�޷��� �⵵ �κ� �ڿ� �ٴ� �ؽ�Ʈ
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //�޷��� �� �κ� �ؽ�Ʈ
               ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] //�޷��� �� �κ� Tooltip �ؽ�Ʈ
               ,dayNamesMin: ['��','��','ȭ','��','��','��','��'] //�޷��� ���� �κ� �ؽ�Ʈ
               ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����'] //�޷��� ���� �κ� Tooltip �ؽ�Ʈ
               ,minDate: "-1M" //�ּ� ��������(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)
               ,maxDate: "+1M" //�ִ� ��������(+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)                
           });                    
           
           //�ʱⰪ�� ���� ��¥�� ����
           $('#after_slipDate').datepicker('setDate', 'today'); //(-1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���), (+1D:�Ϸ���, -1M:�Ѵ���, -1Y:�ϳ���)            
       });
 	 });
	</script>
	

 	
