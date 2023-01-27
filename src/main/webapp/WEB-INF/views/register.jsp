<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 테스트</title>
</head>
<body>

  <h3>회원가입</h3>
  <form action="/register" method="post">

      아이디<input type="text" name="id"/>
      비밀번호<input type="password" name="password"/>
      닉네임<input type="text" name="nickname"/>
      이름<input type="text" name="name"/>
      이메일<input type="email" name="email1"/>

      <input type="submit" value="가입"/>

  </form>
</body>
</html>
