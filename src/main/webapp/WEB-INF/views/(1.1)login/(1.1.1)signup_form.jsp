<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/css/(1.1.1)signup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="p_div">
    <div class="container col-lg-4 col-md-6 col-sm-8 my-auto c_div">
        <form action="/guest/register_ok" method="post" class="signup">
            <div class="logo mb-5">
                <a href="/home/index">Logo</a>
            </div>
            <p>
                <label for=txtid>아이디</label>
                <input type="text" class="form-control"  id="txtid" placeholder="ID" name="id" required>
                <button type="button" id="idcheck_btn">중복확인</button>
                <span id="result_id" class="css_result"></span>
            </p>
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
            <p>
                <label for="txtpw">비밀번호</label>
                <input type="password" class="form-control" placeholder="Password" id="txtpw" name="password" required>
            <p>
            <p>
                <label for="txtpwchk">비밀번호 확인</label>
                <input type="password" class="form-control" placeholder="Password" id="txtpwchk" required>
                <label class="point successPWChk"></label>
                <input type="hidden" id="pwDoubleChk"/>
            </p>
            <script type="text/javascript">
                $("#txtpwchk").blur(function(){
                    if($("#txtpwchk").val() == $("#txtpw").val()){
                        $(".successPWChk").text("비밀번호가 일치합니다.");
                        $(".successPWChk").css("color", "green");
                        $("#pwDoubleChk").val("true");
                    }else{
                        $(".successPWChk").text("비밀번호가 일치하지 않습니다.");
                        $(".successPWChk").css("color", "red");
                        $("#pwDoubleChk").val("false");
                    }
                });
            </script>
            <p>
                <label>닉네임</label>
                <input type="text" class="form-control" id="txtnick" placeholder="Nickname" name="nickname" required>
                <label id="result_nick" class="css_result"></label>
                <button type="button" id="nickcheck_btn">중복확인</button>
            </p>
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
            <p>
                <label for="txtname">이름</label>
                <input type="text" class="form-control" placeholder="Name" id="txtname" name="name" required>
            </p>
            <p>
                <label>이메일</label>
                <input type="email" class="form-control" placeholder="Email" id="txtem" name="email" required>
            </p>
            <fieldset class="fieldarea f2">
                <label>이용약관</label>
                <p class="agreeText">
                    <input id="agreement1" class="agchk" type="checkbox" name="agreement1"/>
                    <label for="agreement1" class="agreement">아래 사항에 동의 합니다.</label>
                    <textarea id="text1" readonly>
				이용약관
			</textarea>
                </p>
            </fieldset>
            <fieldset class="fieldarea f3">
                <label>개인정보취급방침</label>
                <p class="agreeText">
                    <input id="agreement2" class="agchk" type="checkbox" name="agreement2"/>
                    <label for="agreement2" class="agreement">아래 사항에 동의 합니다.</label>
                    <textarea id="text2" readonly>
				개인정보 방침 및 안내
			</textarea>
                </p>
            </fieldset>
            <script type="text/javascript">
                $("input:checkbox").click(checkedChange);
                function checkedChange() {
                    if($(this).prop("checked")){
                        $("label[for="+this.id+"]").text("동의되었습니다.");
                        $("label[for="+this.id+"]").css("color","black");
                    }else{
                        $("label[for="+this.id+"]").text("동의 해주시기 바랍니다.");
                        $("label[for="+this.id+"]").css("color","red");
                    }
                }

            </script>

            <div class="d-flex justify-content-center">
                <button type="submit" id="sign_btn">회원가입</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>