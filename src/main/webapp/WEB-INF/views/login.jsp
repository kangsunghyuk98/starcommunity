<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logintest</title>
</head>
<body>

    <h3>로그인 테스트</h3>

    <form action="/guest/login_ok" method="post">
        ID <input type="text" name="username" />
        PW <input type="password" name="password" />
        <input type="submit" value="로그인" />
    </form>
    <a href="/guest/register">회원가입</a>

</body>
</html>
