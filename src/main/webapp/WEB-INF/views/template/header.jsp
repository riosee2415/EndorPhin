<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="ddmenu">
    <div class="menu-icon"></div>
    <ul>
        <li class="full-width">
            <span class="top-heading">회계</span>
            <i class="caret"></i>
            <div class="dropdown">
                <div class="dd-inner">
                    <ul class="column">
                        <li><h3>기초 정보</h3></li>
                        <li><a href="${pageContext.request.contextPath }/clientview">거래처 등록</a></li>
                        <li><a href="#">신용카드 등록</a></li>
                        <li><a href="#">계정과목 등록</a></li>
                        <li><a href="#">부서 등록</a></li>
                    </ul>
                    <ul class="column">
                        <li><h3>전표 관리</h3></li>
                        <li><a href="#">미승인 전표</a></li>
                        <li><a href="#">일반 전표</a></li>
                        <li><a href="#">매출세금계산서 입력</a></li>
                        <li><a href="#">매입세금계산서 입력</a></li>
                        <li><a href="#">승인전표</a></li>
                    </ul>
                    <ul class="column mayHide">
                        <li><br /><img src="/temporaryFile/ddmenu/noimg.png" /></li>
                    </ul>
                </div>
            </div>
        </li>
        
        <li>
            <a class="top-heading">인사</a>
            <i class="caret"></i>
            <div class="dropdown offset300">
                <div class="dd-inner">
                    <ul class="column">
                        <li><h3>기초정보</h3></li>
                        <li><a href="#">직급등록</a></li>
                        <li><a href="#">직책등록</a></li>
                        <li><a href="#">급여항목 등록</a></li>
                        <li><a href="#">급여공제항목 등록</a></li>
                    </ul>
                    <ul class="column">
                        <li><h3>사원정보관리</h3></li>
                        <li><a href="#">사원등록</a></li>
                        <li><a href="#">급여등록</a></li>
                        <li><a href="#">퇴직자</a></li>
                    </ul>
                    <ul class="column">
                        <li><h3>급여계산 관리</h3></li>
                        <li><a href="#">급여조정</a></li>
                        <li><a href="#">급여계산</a></li>
                        <li><a href="#">급여명세서</a></li>
                        <li><a href="#">급여명세서 인쇄/발송</a></li>
                    </ul>
                    <ul class="column">
                        <li><h3>근태관리</h3></li>
                        <li><a href="#">근태항목등록</a></li>
                        <li><a href="#">휴가일 수 등록</a></li>
                        <li><a href="#">근태 입력</a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li>
            <span class="top-heading">물류/자재</span>
            <i class="caret"></i>
            <div class="dropdown offset300">
                <div class="dd-inner">
                    <ul class="column">
                        <li><h3>구매관리</h3></li>
                        <li><a href="#">발주 입력</a></li>
                        <li><h3>조회</h3></li>
                        <li><a href="#">발주현황</a></li>
                    </ul>
                    <ul class="column">
                        <li><h3>기초정보</h3></li>
                        <li><a href="#">상품 등록</a></li>
                        <li><h3>자재관리</h3></li>
                        <li><a href="#">입고 입력</a></li>
                    </ul>
                    <ul class="column mayHide">
                        <li><br /><img src="./temporaryFile/ddmenu/img2.jpg" /></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="no-sub">
            <a class="top-heading" href="#"  href="http://www.microsoft.com">microsoft</a>
        </li>
        <li class="no-sub"><a class="top-heading" href="http://www.google.com">google</a></li>
        <li>
            <span class="top-heading">미정</span>
            <i class="caret"></i>
            <div class="dropdown right-aligned">
                <div class="dd-inner">
                    <ul class="column">
                        <li><h3>Nam a leo</h3></li>
                        <li><a href="#">Vel faucibus leo</a></li>
                        <li><a href="#">Duis ut mauris</a></li>
                    </ul>
                    <ul class="column">
                        <li><h3>Proin iaculis</h3></li>
                        <li><a href="#">In tempus semper</a></li>
                        <li><a href="#">Hendrerit tincidunt</a></li>
                    </ul>
                </div>
            </div>
        </li>
    </ul>
</nav>
