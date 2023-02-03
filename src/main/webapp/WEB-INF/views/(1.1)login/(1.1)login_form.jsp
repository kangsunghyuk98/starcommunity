<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/(1.1)login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>

<body>
<div class="p_div">
	<div class="container col-lg-4 col-md-6 col-sm-8 col-12 my-auto c_div">
	    <form class="login">
	    	<div class="logo mb-5">
				<a href="./Index">Logo</a>
			</div>
	        <span>ID</span>
	        <input type="text" placeholder="ID">
	        <span>Password</span>
	        <input type="password" placeholder="Password">
			<div class="row justify-content-center">
	        <button id="btn1" class="col-4 my-2" onclick="">로그인</button>
	        </div>
	        <div class="row justify-content-center social_login">
	            <div class="col-sm-6 mx-auto my-2"><img id="kakao" src="img/(1.1)kakao.png" class="img-fluid"></div>
	            <div class="col-sm-6 mx-auto my-2"><img id="google" src="img/(1.1)google.png" class="img-fluid"></div>
	        </div>
	        <!--
	        <button id="btn2" onclick="">카카오 로그인</button>
	        <button id="btn3" onclick="">구글 로그인</button>
	        -->
	        <div class="row justify-content-center mt-2">
		        <div id="d1" class="col-sm-4">
		            <a style="text-decoration: inherit; color: black; "href="./FindID">아이디 찾기</a>
		        </div>
		        <div id="d2" class="col-sm-4">
		            <a style="text-decoration: inherit; color: black;" href="./FindPW">비밀번호 찾기</a>
		        </div>
		        <div id="d3" class="col-sm-4">
		            <a style="text-decoration: inherit; color: black;" href="./SignUp">회원가입</a>
		        </div>
	        </div>
	    </form>
    </div>
</div>
</body>
</html>