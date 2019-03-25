<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	

<!-- Sidebar -->
    <ul class="sidebar navbar-nav">
	<li id="account">
		<h3>ȸ��</h3>
		<ul>
			<li>
				<span>��������</span>
				<ul  style="display:none">
					<li><a href="">�ŷ�ó ���</a></li>
					<li><a href="">�ſ�ī�� ���</a></li>
					<li><a href="">�������� ���</a></li>
					<li><a href="">�μ� ���</a></li>
				</ul>
			</li>
		</ul>
	</li>
	<li id="humanResource">
		<h3>�λ�</h3>
		<ul>
			<li>
				<span>��������</span>
				<ul  style="display:none">
					<li><a href="">�ŷ�ó ���</a></li>
					<li><a href="">�ſ�ī�� ���</a></li>
					<li><a href="">�������� ���</a></li>
					<li><a href="">�μ� ���</a></li>
				</ul>
			</li>
		</ul>
	</li>
	<li id="distribution">
		<h3>����/����</h3>
		<ul>
			<li>
				<span>��������</span>
				<ul  style="display:none">
					<li><a href="">�ŷ�ó ���</a></li>
					<li><a href="">�ſ�ī�� ���</a></li>
					<li><a href="">�������� ���</a></li>
					<li><a href="">�μ� ���</a></li>
				</ul>
			</li>
		</ul>
	</li>
</ul>


<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
	var li_check=false;
	$("#account").on("click",function(){
		console.log("haha");
		if(li_check==true){
			$("#account").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","none");
			$("#account").children("ul").children("li").children("ul").css("display","block");
		}
		else{
			$("#account").children("ul").children("li").children("ul").css("display","block");
			li_check=true;
		}
	})
	$("#humanResource").on("click",function(){
		console.log("haha");
		if(li_check==true){
			$("#account").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","block");
		}
		else{
			$("#humanResource").children("ul").children("li").children("ul").css("display","block");
			li_check=true;
		}
	})
	$("#distribution").on("click",function(){
		console.log("haha");
		if(li_check==true){
			$("#account").children("ul").children("li").children("ul").css("display","none");
			$("#humanResource").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","none");
			$("#distribution").children("ul").children("li").children("ul").css("display","block");
		}
		else{
			$("#distribution").children("ul").children("li").children("ul").css("display","block");
			li_check=true;
		}
	})
</script>

