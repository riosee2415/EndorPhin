<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>공제항목 등록</h3>
<form action="/addDeduct" id="searchFrm">
   <input type="hidden" name="deprostatus" value="2"/>
   <table>
      <tr>
         <td>공제명 검색 :</td>
         <td><input type="text" class="search-query form-control"
            id="searchPay" name="searchDeductName" placeholder="Search" /></td>
         <td>
            <button class="btn btn-primary" type="button" id="searchBtn">
               <span class=" glyphicon glyphicon-search">검색</span>
            </button>
         </td>
      </tr>
   </table>
</form>
<form action="/delDeproduct" id="deleteFrm">
   <input type="hidden" name="deprostatus" value="2"/>
   <div class="table-responsive">
      <table class="table table-striped">
         <thead>
            <tr>
               <th><input type="checkbox" id="checkAll" /></th>
               <th>공제코드</th>
               <th>항목명</th>
               <th>계정과목명</th>
               <th>사용구분</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${allDe_product_div}" var="vo">
               <tr class="payTr" data-decd="${vo.deductCode }">
                  <td><input type="checkbox" class="check" /><input
                     type="hidden" class="valPay"></td>
                  <td><a href="#detailLayer" class="deductDetail">${vo.deductCode }</a></td>
                  <td>${vo.deductName}</td>
                  <c:if test="${vo.establishcode!=null}">
                     <td>${vo.establishName}</td>
                  </c:if>
                  <c:if test="${vo.useStatus==1}">
                     <td>사용</td>
                  </c:if>
                  <c:if test="${vo.useStatus==2}">
                     <td>미사용</td>
                  </c:if>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>
   
   <div class="btn_btm">
      <input class="btn btn-info btn-lg" type="button" id="delPayBtn"
         value="선택 삭제">
      <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
         data-target="#my80sizeModal">신규등록</button>
   </div>
</form>


<div id="content23">
</div>


<!-- 상세조회 모달창 -->

<form action="/delDeproduct" id="dialogFrm">
   <div class="dialog">
      <input type="hidden" name="deprostatus" value="2"/>
      <span class="dialog__close">&#x2715;</span> 
      <label for="inputName">급여/공제코드</label>
      <input type="hidden" name="deductCode" id="dialog_deductCode"/>
      <label for="inputName" class="dialog_deductCode"></label><br/> 
      <label for="InputEmail">공제명</label>
      <input type="text" id="dialog_deductName" name="deductName" class="form-control" placeholder="공제명을 입력해주세요"><br/>
      <label for="inputPassword">걔정과목명</label><br/>
         <input type="text" class="form-control" name="establishcode"  id="dialogEstablishCode" readonly="readonly"/>
         <input type="button" class="btn btn-info btn-lg" value="검색" id="dialogSearchBtn"/><br/>
         <label for="inputPassword">사용여부</label> <select name="useStatus"
         class="form-control" id="dialog_useStatus">
         <option value="1">예</option>
         <option>아니오</option>
      </select>
      <button id="updDeduct" class="dialog__action">수정</button>
      <button id="dialog_delBtn" class="dialog__action">삭제</button>
   </div>
</form>


<script type="text/javascript" src="/js/deduct.js" >
</script>
<script>
	$(document).ready(function(){
		$("#content23").load("/temporaryFile/lee.html");
	});
</script>
