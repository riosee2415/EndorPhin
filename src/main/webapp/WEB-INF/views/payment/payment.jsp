<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<link href="css/payment.css" rel="stylesheet" />
<h2>급여 조정</h2>


<div class="rgHeaderWrapper">
	<div id="ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_GridHeader"
		class="rgHeaderDiv" style="overflow: hidden;">

		<table class="rgMasterTable rgClipCells"
			id="ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00_Header"
			style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
			<colgroup>
				<col style="width: 5%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 14%">
				<col style="width: 18%">
				<col style="width: 18%">
				<col style="width: 15%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="rgHeader" style="white-space: nowrap;">&nbsp;</th>
					<th scope="col" class="rgHeader" style="white-space: nowrap;"><a
						onclick="Telerik.Web.UI.Grid.Sort($find('ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00'), 'ApplyYear'); return false;"
						title="Click here to sort"
						href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl02$ctl00$ctl00','')">년도</a></th>
					<th scope="col" class="rgHeader" style="white-space: nowrap;"><a
						onclick="Telerik.Web.UI.Grid.Sort($find('ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00'), 'ApplyMonth'); return false;"
						title="Click here to sort"
						href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl02$ctl00$ctl01','')">월</a></th>
					<th scope="col" class="rgHeader" style="white-space: nowrap;"><a
						onclick="Telerik.Web.UI.Grid.Sort($find('ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00'), 'PayCheckSequence'); return false;"
						title="Click here to sort"
						href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl02$ctl00$ctl02','')">차수</a></th>
					<th scope="col" class="rgHeader" style="white-space: nowrap;"><a
						onclick="Telerik.Web.UI.Grid.Sort($find('ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00'), 'SalaryType'); return false;"
						title="Click here to sort"
						href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl02$ctl00$ctl03','')">급여구분</a></th>
					<th scope="col" class="rgHeader" style="white-space: nowrap;"><a
						onclick="Telerik.Web.UI.Grid.Sort($find('ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00'), 'IncomeAmount'); return false;"
						title="Click here to sort"
						href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl02$ctl00$ctl04','')">급여조정</a></th>
					<th scope="col" class="rgHeader" style="white-space: nowrap;"><a
						onclick="Telerik.Web.UI.Grid.Sort($find('ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00'), 'DeductAmount'); return false;"
						title="Click here to sort"
						href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl02$ctl00$ctl05','')">공제조정</a></th>
					<th scope="col" class="rgHeader" style="white-space: nowrap;">등록관리</th>
				</tr>
			</thead>
			<tbody style="display: none;">
				<tr>
					<td colspan="8"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_GridData"
	class="rgDataDiv"
	style="overflow-x: auto; overflow-y: auto; width: 100%; height: 481px;">

	<table class="rgMasterTable rgClipCells"
		id="ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00"
		style="width: 100%; table-layout: fixed; overflow: hidden; empty-cells: show;">
		<colgroup>
			<col style="width: 5%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 14%">
			<col style="width: 18%">
			<col style="width: 18%">
			<col style="width: 15%">
		</colgroup>
		<thead style="display: none;">
			<tr>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<tr class="rgRow"
				id="ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00__0"
				style="white-space: nowrap;">
				<td><input
					id="ctl00_ContentPlaceHolder1_RadGridPayCheckAdjust_ctl00_ctl04_chkline"
					type="checkbox"
					name="ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl04$chkline"
					onclick="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$RadGridPayCheckAdjust$ctl00$ctl04$chkline\',\'\')', 0)">
				</td>
				<td class="col_ct">2019</td>
				<td class="col_ct">03</td>
				<td class="col_ct">1</td>
				<td>급여</td>
				<td class="col_rg">0</td>
				<td class="col_rg">5,000</td>
				<td class="col_ct"><a href="#"
					onclick="openRadWindow('11'); return false;">등록</a></td>
			</tr>
		</tbody>

	</table>
</div>

