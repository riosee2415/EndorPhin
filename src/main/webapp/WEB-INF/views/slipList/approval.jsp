<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--���̺� ����Ʈ���  -->
<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2><i class="fa fa-calculator"></i>���� ��ǥ </h2>
		<table>
			<tr>
				<td><h4>��ǥ����</h4></td>
				<td><input class="search-query form-control" name="before_slipDate" id="before_slipDate" type="text" /></td>
				<td><h4>~</h4></td>
				<td><input class="search-query form-control" name="after_slipDate" id="after_slipDate" type="text"/></td>
				<td><input class="bttn-fill bttn-warning" type="button" id="serachBtn" value="�˻�" /></td>
			</tr>
		</table>
		<br>
		<table class="table table-hover">
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

<!--------------(����,���) ��ư ------------------->
		
		<button class="bttn-jelly bttn-md bttn-warning" name="upd_btn"  id="upd_btn" type="button" value="0" onclick="myclick()">���� ��� </button>
	</div>
</div>
			
	<!-----------------�󼼺���  ���â ---------------->	
	
	<div class="modal fade" id="approvalDetail" role="approvalDetail" aria-hidden="true"> 
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
	   					<input type="text" style="width: 200px;" id="slipnumber_d" name="slipnumber_d" readonly>
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">��ǥ����</label> 
	   					<input type="text" style="width: 250px;" name="slipdate_d" id="slipdate_d"  > 
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
	   					<input type="text" style="width: 250px;" id="jukyo_d" name="jukyo_d" />
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">��ǥ�ݾ�</label> 
	   					<input type="text" style="width: 250px;" name="total_d" id="total_d"  > 
	   				</div>
	   				<div class="form-group">
	   					<label for="InputEmail">��ǥ����</label> 
	   					<input type="text" style="width: 250px;" name="departmentname_d" id="departmentname_d"  > 
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
 	
	/* ����¡ ajax */
	$("document").ready(function(){
 		approvalPageList(1);
 	});
 	function approvalPageList(page){
 		
 		$.ajax({
 			url : "${pageContext.request.contextPath }/approvalPageList",
 			data : "page=" + page,
 			success : function(data){
 				var htmlArr = data.split("================seperator================");
 				$("#deptListTbody").html(htmlArr[0]);
 				$("#pagination").html(htmlArr[1]);
 			}
 		});
 	}

	/* ��ü���� */
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
	
	/* �󼼺���  */
	 $("document").ready(function() {
			
			$("#deptListTbody").on("click", ".detailView1", function(){
				
				$("#slipnumber_d").val($(this).data().detail_slipnumber);
				$("#slipdate_d").val($(this).data().detail_slipdate_d);
				$("#jukyo_d").val($(this).data().detail_jukyo);
				$("#total_d").val($(this).data().detail_total);
				$("#departmentname_d").val($(this).data().detail_departmentname);
				
			});
	 	});
	 
	
	/* ��¥  */
 	 $("document").ready(function(){
 	
       $(function() {
           //input�� datepicker�� ����
           $("#before_slipDate").datepicker({
               dateFormat: 'yy/mm/dd' //Input Display Format ����
               ,showOtherMonths: true //�� ������ ������� �յڿ��� ��¥�� ǥ��
               ,showMonthAfterYear:true //�⵵ ���� ������, �ڿ� �� ǥ��
               ,changeYear: true //�޺��ڽ����� �� ���� ����
               ,changeMonth: true //�޺��ڽ����� �� ���� ����                
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
 	
 	/* ��¥�˻�*/ 
 	$("#serachBtn").on("click", function(){
   	 	$.ajax({
       		url 	: "${pageContext.request.contextPath }/searchAjax",
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
	</script>
	

 	
