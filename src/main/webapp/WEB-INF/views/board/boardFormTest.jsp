<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board1</title>
</head>
<body>
    <form name="form" action="boardSave">
        <table border="1" style="width:600px">
            <caption>게시글 등록</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
                <tr>
                    <td>작성자</td> 
                    <td><input type="text" name="userId" size="20" maxlength="20"></td> 
                </tr>
                <tr>
                    <td>제목</td> 
                    <td><input type="text" name="title" size="70" maxlength="250"></td> 
                </tr>
                <tr>
                    <td>내용</td> 
                    <td><textarea name="contents" rows="5" cols="60"></textarea></td> 
                </tr>
            </tbody>
        </table>    
        <a href="#" onclick="form.submit()">저장</a>
        <input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
    </form>    
</body>
</html>
