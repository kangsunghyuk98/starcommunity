<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="/css/(1.1.2)findID.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

<div class="p_div">
    <div class="container col-lg-4 col-md-6 col-sm-6 col-12 my-auto c_div">

    <form action="/guest/findid_ok" method="post" class="signup">
        <span>이름</span>
        <input class="form-control" type="text" placeholder="name" name="name" required>

        <span>이메일</span>
        <input class="form-control" type="email" placeholder="email address" name="email" required>

        <div class="row justify-content-center mt-3">
            <button type="submit" id="btn1">아이디 찾기</button>
        </div>
    </form>
    </div>
</div>
</body>
</html>