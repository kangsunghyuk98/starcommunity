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
    인덱스 입니다. <br>
    <sec:authorize access="isAnonymous()">
        <a href="/guest/logintest">로그인</a>
    </sec:authorize>

    <sec:authorize access="isAuthenticated()">
        <b><sec:authentication property="principal.nickname"/></b>>(<sec:authentication property="principal.id"/>) 안녕하세요 <br><br>
        <a href="/guest/logouttest">로그아웃</a>
    </sec:authorize>
</body>
</html>
