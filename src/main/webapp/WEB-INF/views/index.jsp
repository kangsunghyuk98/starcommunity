<%@ page import="com.example.security.MemberUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%

%>
<html>
<head>
    <title>인덱스</title>
</head>
<body>
    인덱스 입니다.
    <sec:authorize access="isAnonymous()">
        <a href="/guest/logintest">로그인</a>
    </sec:authorize>

    <sec:authorize access="isAuthenticated()">
        <a href="/guest/logouttest">로그아웃</a>
    </sec:authorize>
</body>
</html>
