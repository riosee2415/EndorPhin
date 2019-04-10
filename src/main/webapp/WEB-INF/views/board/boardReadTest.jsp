<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board1</title>
</head>
<body>
        <table class="table table-striped">
           <h2><strong><i class="fas fa-pen-alt"></i>게시글 상세조회</strong></h2>
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
        <br>
        <a href="#" onclick="history.back(-1)"><button class="bttn-jelly bttn-warning">돌아가기</button></a>
        <a href="boardDelete?boardNo=${boardInfo.boardNo}"><button class="bttn-jelly bttn-warning">삭제</button></a>
        <a href="boardForm?boardNo=${boardInfo.boardNo}&boardTypeCode=${boardTypeCode}"><button class="bttn-jelly bttn-warning">저장</button></a>
</body>
</html>
