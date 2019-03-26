<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





<!-- Page Content -->
<div class="container">

  <!-- Portfolio Item Heading -->
  <h1 class="my-4">사원 상세 조회
  </h1>
  
   <!-- Portfolio Item Row -->
  <div class="row">

    <div class="col-md-6">
      <img class="img-fluid" src="${cp}/employee/profileImg?userId=${userVo.userId}" alt="">
    </div>

    <div class="col-md-6">
    <table border="1">
    <tr>
     <td> <h3 class="my-3">사원 번호</h3></td>
      <td><p>${userVo.userId}</p></td>
   </tr>
   <tr>
     <td> <h3 class="my-3">사원 이름</h3></td>
      <td><p>${userVo.userNm}</p></td>
   </tr>
    <tr>
     <td> <h3 class="my-3">직책</h3></td>
      <td><p>${userVo.positionCode}</p></td>
   </tr>
  <tr>
     <td> <h3 class="my-3">직급</h3></td>
      <td><p>${userVo.rankCode}</p></td>
   </tr>
   <tr>
     <td> <h3 class="my-3">근속년수</h3></td>
      <td><p>${userVo.continuousYear}</p></td>
   </tr>
    <tr>
     <td> <h3 class="my-3">비고</h3></td>
      <td><p>${userVo.relate}</p></td>
   </tr>
  <tr>
     <td> <h3 class="my-3">입사일</h3></td>
      <td><p>${userVo.joinCompany}</p></td>
   </tr>
    <tr>
     <td> <h3 class="my-3">생년월일</h3></td>
      <td><p>${userVo.birthDate}</p></td>
   </tr>  
   
   
   
   
   </table>
    </div>

  </div>
  </div>




