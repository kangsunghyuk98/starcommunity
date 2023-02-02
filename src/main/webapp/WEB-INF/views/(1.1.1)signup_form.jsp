<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/(1.1.1)signup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
<div class="p_div">
	<div class="container col-lg-4 col-md-6 col-sm-8 my-auto c_div">	
	    <form class="signup">
		    <div class="logo mb-5">
				<a href="./Index">Logo</a>
			</div>
	        <span>아이디</span>
	        <input class="text_area" id="txtid" name="txtid" type="text" placeholder="ID">
	        <span id="result_id" class="css_result"></span>
	        <button id="idcheck_btn">중복확인</button>
			<script type="text/javascript">
				$('#idcheck_btn').click(function(){
					if ($('#txtid').val() != '') {
				        // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
				        $.ajax({
				            type: 'GET',
				            url: '/ajax/views/idcheck.action',
				            data: 'id=' + $('#txtid').val(),
				            dataType: 'json',
				            success: function(result) {
				                if (result == '0') {
				                    $('#result_id').text('사용 가능한 아이디입니다.');
				                } else {
				                    $('#result_id').text('이미 사용중인 아이디입니다.');
				                }
				            },
				            error: function(a, b, c) {
				                console.log(a, b, c);
				            }	
				        });	
				    } else {
				        alert('아이디를 입력하세요.');
				        $('#txtid').focus();
				    }
				});
			</script>
	        <span>비밀번호</span>
	        <input type="password" placeholder="Password">
	
	        <span>비밀번호 확인</span>
	        <input type="password" placeholder="Password">
	
	        <span>닉네임</span>
	        <input class="text_area" id="txtnick" name="txtnick" type="text" placeholder="Nickname">
	        <span id="result_nick" class="css_result"></span>
	        <button id="nickcheck_btn">중복확인</button>
	        <script type="text/javascript">
				$('#nickcheck_btn').click(function(){
					if ($('#txtnick').val() != '') {
				        $.ajax({
				            type: 'GET',
				            url: '/ajax/views/nickcheck.action',
				            data: 'nickname=' + $('#txtnick').val(),
				            dataType: 'json',
				            success: function(result) {
				                if (result == '0') {
				                    $('#result_nick').text('사용 가능한 닉네임입니다.');
				                } else {
				                    $('#result_nick').text('이미 사용중인 닉네임입니다.');
				                }
				            },
				            error: function(a, b, c) {
				                console.log(a, b, c);
				            }	
				        });	
				    } else {
				        alert('닉네임을 입력하세요.');
				        $('#txtnick').focus();
				    }
				});
			</script>
	        <span>이름</span>
	        <input type="text" placeholder="Name">
	        
	        <span>이메일</span>
	        <input type="email" placeholder="Email">
			<div class="row justify-content-center">
	        <button id="sign_btn" class="col-4 my-2" >회원가입</button>
			</div>
	    </form>
    </div>
</div>
</body>
</html>