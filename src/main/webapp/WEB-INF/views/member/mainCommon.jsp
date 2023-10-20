<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>개인 회원가입 성공</title>
</head>
<body>
<h2>개인 회원가입 성공, 로그인시 보여지는 메인페이지</h2>
<form action="<c:url value='/logout'/>" method="post">
    <input type="submit" value="로그아웃"/>
</form>
</body>
</html>