<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach items="${assetList }" var="vo">	
	 <tr>
		<td><input type="checkbox" name="checkRow"  value="${vo.assetCode }" ></td>
		<td><a class="bttn-stretch bttn-warning detailView" href="#deptDetail" data-assetcode="${vo.assetCode }" 
													 data-acquisitiondate="${vo.acquisitionDate }"
													 data-purchasecode="${vo.purchaseCode }"
													 data-sanggakway="${vo.sanggakWay }"
													 data-acquisitionprice="${vo.acquisitionPrice }"
													 data-accountname="${vo.accountName }"
													 data-clientname="${vo.clientName }"  
													 data-assetname="${vo.assetName }"
													 data-residualvalue="${vo.residualvalue }"
													 data-jukyo="${vo.jukyo }"
													 data-sanggakcode="${vo.sanggakCode }"
													 data-depreciation="${vo.depreciation }"
													 data-accumulated="${vo.accumulated }" 
													 data-toggle="modal">${vo.assetCode }</a></td>
					<c:set var = "sum" value = "${sum+vo.acquisitionPrice/1.1 }" />
					<td>${vo.assetName }</td>	
					<td>${vo.accountName }</td>								
		<td><fmt:formatDate value="${vo.acquisitionDate  }" pattern="yyyy-MM-dd"/></td>
		<td>${vo.acquisitionPrice }</td>
		<td><input type="button" value="장부반영" id="applybtn" name="applybtn"/></td>
 	</tr>
 	<div id="insertArea"></div>
</c:forEach>