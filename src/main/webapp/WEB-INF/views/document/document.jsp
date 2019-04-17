<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
 <div class="col-md-1"></div>
	<div class="col-md-10">
		<h2>
			<i class="fa fa-calculator"></i>고정자산 매각
		</h2>
		<div class="container">
			<div class="bootstrap-iso">
				<div class="container-fluid">
					<table>
						<tr>
						<td ><label for="date">작성일&nbsp;<span
								class="asteriskField">*</span></label></td>
						<td ><div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text" style="width: 150px" />&nbsp;~ &nbsp;
							</div></td>
						<td><div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
								&nbsp;<input class="form-control" id="date" name="date"placeholder="MM/DD/YYYY" type="text" style="width: 150px" />
							</div>
						</td>
						</tr>
						<tr>
							<td><label>문서종류&nbsp;&nbsp;</label> </td>
							<td><input type="text" id="documenttyp"  class="form-control-sm"readonly></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	$(document).ready(function(){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'mm/dd/yyyy',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})
</script>

</body>

</html>
    