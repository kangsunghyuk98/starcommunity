<%@ page import="com.example.security.MemberUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%

%>
<html>
<head>
    <title>인덱스</title>
</head>
<body>
    인덱스 입니다. <br>
    <sec:authorize access="isAnonymous()">
        <a href="/guest/login">로그인</a>
        <a href="/oauth2/authorization/google">구글 로그인</a>
    	<a href="/oauth2/authorization/kakao">카카오 로그인</a>
        <a href="/oauth2/authorization/naver">네이버 로그인</a>
    </sec:authorize>

    <sec:authorize access="isAuthenticated()">
        <p><sec:authentication property="principal.to.nickname" />님 안녕하세요 </p>
        <br><br>
        <a href="/guest/logout">로그아웃</a>
    </sec:authorize>
</body>
</html>
