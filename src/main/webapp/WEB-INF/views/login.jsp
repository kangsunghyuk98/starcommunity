<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logintest</title>
</head>
<body>

    <h3>로그인 테스트</h3>

    <form action="/logintest_ok" method="post">
        ID <input type="text" name="id" />
        PW <input type="password" name="password" />
        <input type="submit" value="로그인" />
    </form>

</body>
</html>
