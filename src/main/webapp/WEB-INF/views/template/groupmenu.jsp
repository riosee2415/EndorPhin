<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<div id="container" class="container-fluid" style="background-color: #4981F2 !important;">
	<div id="group_menu_container" class="row row-sys">


		<div class="col-md-2" style="background-color: #3266CC;">

			<h4>
				<i class="fa fa-folder-open"></i> <br> 서식모음
			</h4>
		</div>


		<div class="col-md-2 cell-sys">
			<div class="divname">전자결재</div>

			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item"
					href="">기안함</a> <a
					class="dropdown-item"
					href="">결재함</a> <a
					class="dropdown-item"
					href="">수신함</a>
			</div>
		</div>



		<div class="col-md-2 cell-sys">
			<div class="divname">게시판</div>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
			<a class="dropdown-item" href="">공지사항</a>
			<a class="dropdown-item" href="">자유게시판</a>
			<a class="dropdown-item" href="">Q&A게시판</a>
			</div>
		</div>




		<div class="col-md-2 cell-sys">
			<div class="divname">일정관리</div>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
			<a class="dropdown-item" href="">일정관리</a>
			</div>
		</div>




	<div class="col-md-2 cell-sys">
			<div class="divname">총무지원</div>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
			<a class="dropdown-item" href="">차량운행관리</a>
			<a class="dropdown-item" href="">출장관리</a>
			</div>
		</div>


	</div>
</div>