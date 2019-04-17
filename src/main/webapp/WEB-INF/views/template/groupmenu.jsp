<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="container" class="container-fluid"
	style="background-color: #4981F2 !important; max-height: 50px;">
	<div id="group_menu_container" class="row row-sys">

		<div class="col-md-2" style="background-color: #3266CC;">
			<button onchange="Lmenu()" type="button" id="sidebarCollapse"
				class="btn btn-link">
				<h4>
					<i class="fas fa-list">&nbsp;Menu</i>
				</h4>
			</button>
		</div>
		<ul id="main-menu">
			<li class="parent"><a href="#">전자결제</a>
				<ul class="sub-menu">
					<li><a href="#"><i class="icon-wrench"></i> 기안함</a></li>
					<li><a href="#"><i class="icon-wrench"></i> 결재함</a></li>
					<li><a href="#"><i class="icon-wrench"></i> 수신함</a></li>
					<li><a class="parent" href="#"><i class="icon-file-alt"></i>
							Pages</a>
						<ul class="sub-menu">
							<li><a href="#">Full Width</a></li>
							<li><a href="#">Left Sidebar</a></li>
							<li><a href="#">Right Sidebar</a></li>
							<li><a href="#">Double Sidebar</a></li>
						</ul></li>
				</ul></li>
			<li class="parent"><a href="#">게시판</a>
				<ul class="sub-menu">
					<li><a href="/boardList?boardTypeCode=7">공지사항</a></li>
					<li><a href="/boardList?boardTypeCode=5">자유 게시판</a></li>
					<li><a href="/boardList?boardTypeCode=8">Q&A 게시판</a></li>
				</ul></li>
			<li><a href="/schedule/view">일정 관리</a></li>
			<li class="parent"><a href="#">총무지원</a>
				<ul class="sub-menu">
					<li><a href="#"><i class="icon-wrench"></i> 기안함</a></li>
					<li><a href="#"><i class="icon-wrench"></i> 결재함</a></li>
					<li><a href="#"><i class="icon-wrench"></i> 수신함</a></li>
					<li><a class="parent" href="#"><i class="icon-file-alt"></i>
							Pages</a>
						<ul class="sub-menu">
							<li><a href="#">Full Width</a></li>
							<li><a href="#">Left Sidebar</a></li>
							<li><a href="#">Right Sidebar</a></li>
							<li><a href="#">Double Sidebar</a></li>
						</ul></li>
				</ul></li>
		</ul>
	</div>
</div>