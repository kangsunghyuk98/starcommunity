<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/css/(1.1.1)signup_form.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script>
	    $(document).ready(function(){
		    $('#idcheck_btn').click(function(){
		    	checkID();
		    });
		    
			$('#nickcheck_btn').click(function(){
				checkNickname();
	        });
		    
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
	    });
	    
	    function checkID(){
	    	let fnResult;
	    	let IDResult;
    		if ($('#txtid').val() != '') {
	            // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
	            $.ajax({
	                type: 'POST',
	                url: '/guest/idcheck',
	                data: 'id=' + $('#txtid').val(),
	                dataType: 'text',
	                async: false, 
	                success: function(result) {
	                    if (result == 0) {
	                        $('#result_id').text('사용 가능한 아이디입니다.');
	                        IDResult = $('#result_id').text();
	                    } else {
	                        $('#result_id').text('이미 사용중인 아이디입니다.');
	                        IDResult = $('#result_id').text();
	                    }
	                },
	                error: function(err) {
	                	alert('error : ' + err.status);
	                }
	            });
	        } else {
	        	let IDResult = 1;
	            alert('아이디를 입력하세요.');
	            $('#txtid').focus();
	            return IDResult = 1;
	        }
    		fnResult = IDResult;
    		return fnResult;
    	}
	    
	    function checkNickname() {
	    	let fnResult;
	    	let NnResult;
	    	if ($('#txtnick').val() != '') {
                $.ajax({
                    type: 'POST',
                    url: '/guest/nickcheck',
                    data: 'nickname=' + $('#txtnick').val(),
                    dataType: 'text',
                    async: false,
                    success: function(result) {
                        if (result == 0) {
                            $('#result_nick').text('사용 가능한 닉네임입니다.');
                            NnResult = $('#result_nick').text();
                        } else {
                            $('#result_nick').text('이미 사용중인 닉네임입니다.');
                            NnResult = $('#result_nick').text();
                        }
                    },
                    error: function(err) {
	                	alert('error : ' + err.status);
	                }
                });
            } else {
            	let NnResult = 1;
                alert('닉네임을 입력하세요.');
                $('#txtnick').focus();
                
		    	return NnResult;
            }
	    	
	    	fnResult = NnResult;
	    	return fnResult;
	    }
	    
	    function confirmSubmit() {	    	 
	    	if(  $('#result_id').text() == "사용 가능한 아이디입니다."){
				if( $(".successPWChk").text() == "비밀번호가 일치합니다." ){
					if(  $('#result_nick').text() == "사용 가능한 닉네임입니다." ){
						
		    		} else {
		    			alert('닉네임 중복확인을 해주세요.');
		    			return false;
		    		}
	    		} else {
	    			alert('비밀번호를 확인해 주세요.');
	    			return false;
	    		}
	    	} else {
	    		alert('아이디 중복확인을 해주세요');
	    		return false;
	    	}
		}
    </script>
</head>
<body>
<div class="p_div">
    <div class="container col-lg-4 col-md-6 col-sm-8 my-auto c_div">
	    <form action="/guest/register_ok" method="post" class="signup" onsubmit="return confirmSubmit();">
	        <div class="logo mb-3">
	            <a href="/home/index"><img src="/img/img_files/starcommunity_logo.png" class="img-fluid" width="200" height="100"></a>
	        </div>
	        <p>
	        	<label for=userid>아이디</label>
	        	<input type="text" class="form-control" id="txtid" placeholder="ID" name="id" check_result="fail" required>
	        	<button type="button" id="idcheck_btn">중복확인</button>
	        	<input type="hidden" name="idDuplication" value="inUncheck">
	        	<span id="result_id" class="css_result"></span>
	        </p>
			<p>
	        	<label for="userpass">비밀번호</label>
	        	<input type="password" class="form-control" placeholder="Password" id="txtpw" name="password" required>
			<p>
	        <p>
	        	<label for="passchk">비밀번호 확인</label>
	        	<input type="password" class="form-control" placeholder="Password" id="txtpwchk" required>
	        	<label class="point successPWChk"></label>
				<input type="hidden" id="pwDoubleChk"/>
			</p>
	        <p>
	        	<label>닉네임</label>
	        	<input type="text" class="form-control" id="txtnick" placeholder="Nickname" name="nickname" required>
	        	<label id="result_nick" class="css_result"></label>
	        	<button type="button" id="nickcheck_btn">중복확인</button>
	        </p>
			<p>
	        	<label for="username">이름</label>
	        	<input type="text" class="form-control" placeholder="Name" id="txtname" name="name" required>
	        </p>
	        <p>
	        	<label>이메일</label>
	        	<input type="email" class="form-control" placeholder="Email" id="txtem" name="email" required>
	        </p>
	        
	        <div class=" mb-2">
	        	<label>이용약관</label>	
	    		<label class="form-check-label" for="Check1" style="font-size: 0.8rem;"><input type="checkbox" class="form-check-input" id="Check1" required> 아래 사항에 동의합니다.</label>
	    		<div class="invalid-feedback">체크박스를 눌러주세요</div>
	    		<textarea id="text1" readonly style="text-align: center;">이용약관</textarea>
	  		</div>
	  		
	        <div class=" mb-3">
	        	<label>개인정보취급방침</label>
	    		<label class="form-check-label" for="Check2" style="font-size: 0.8rem;"><input type="checkbox" class="form-check-input" id="Check2" required> 아래 사항에 동의합니다.</label>
	    		<div class="invalid-feedback">체크박스를 눌러주세요</div>
	    		<textarea id="text1" readonly style="text-align: center;">개인정보취급방침</textarea>
	  		</div>
	        <div class="d-flex justify-content-center">
	        	<button type="submit" id="sign_btn" class="btn-sm" >회원가입</button>
			</div>
	    </form>
    </div>
</div>
</body>
</html>