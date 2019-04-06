<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board1</title>
</head>
<body>
        <table border="1" style="width:600px">
            <caption>게시판 상세조회</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
                <tr>
                    <td>작성자</td> 
                    <td>${boardInfo.userId}</td> 
                </tr>
                <tr>
                    <td>제목</td> 
                    <td>${boardInfo.title}</td> 
                </tr>
                <tr>
                    <td>내용</td> 
                    <td>${boardInfo.contents}</td> 
                </tr>
            </tbody>
        </table>    
        <a href="#" onclick="history.back(-1)">돌아가기</a>
        <a href="boardDelete?boardNo=${boardInfo.boardNo}">삭제</a>
        <a href="boardUpdate?boardNo=${boardInfo.boardNo}">수정</a>
</body>
</html>
