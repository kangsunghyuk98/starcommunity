<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/css/(1.1.1)signup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form action="/guest/register_ok" method="post" class="signup">
        <div class="logo">
            <a href="/home/index">Logo</a>
        </div>
        <span>아이디</span>
        <input class="text_area" type="text" id="txtid" placeholder="ID" name="id">
        <span id="result_id" class="css_result"></span>
        <button type="button" id="idcheck_btn">중복확인</button>
        <script type="text/javascript">
            $('#idcheck_btn').click(function(){
                if ($('#txtid').val() != '') {
                    // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
                    $.ajax({
                        type: 'POST',
                        url: '/guest/idcheck',
                        data: 'id=' + $('#txtid').val(),
                        dataType: 'text',
                        success: function(result) {
                            if (result == 0) {
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
        <input type="password" placeholder="Password" name="password">

        <span>비밀번호 확인</span>
        <input type="password" placeholder="Password">

        <span>닉네임</span>
        <input class="text_area" type="text" id="txtnick" placeholder="Nickname" name="nickname">
        <span id="result_nick" class="css_result"></span>
        <button type="button" id="nickcheck_btn">중복확인</button>
        <script type="text/javascript">
            $('#nickcheck_btn').click(function(){
                if ($('#txtnick').val() != '') {
                    $.ajax({
                        type: 'POST',
                        url: '/guest/nickcheck',
                        data: 'nickname=' + $('#txtnick').val(),
                        dataType: 'text',
                        success: function(result) {
                            if (result == 0) {
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
        <input type="text" placeholder="Name" name="name">
        
        <span>이메일</span>
        <input type="email" placeholder="Email" name="email">

        <button type="submit" id="sign_btn">회원가입</button>

    </form>
</body>