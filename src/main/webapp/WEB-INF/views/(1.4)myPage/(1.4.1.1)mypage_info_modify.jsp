<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 폰트는 따로 css파일을 만들었습니다 -->
    <link rel="stylesheet" href="/css/(1)header.css">
    <link rel="stylesheet" href="/css/(1)contents.css">
    <link rel="stylesheet" href="/font/font.css">
    <link rel="stylesheet" href="/css/(1.4.1.1)mypageModify.css">
    <title>마이페이지</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    
    <script type="text/javascript">
  	 
	    $(document).ready(function(){
	        	 
			$('#nickcheck_btn').click(function(){
				$('#result_nick_pass').empty();
				$('#result_nick_false').empty();
				checkNickname();
	        });
			
			 
			$(document).on('click', '#password_modify_btn', function(){
				
				$(".password_table").empty();
				$(".password_cfm_table").empty();
				
				let html = '';
				html += '    <th width="20%;" >비밀번호 변경</th>';
				html += '    <td>';
				html += '        <input type="password" id="txtpw" name="password" placeholder="수정할 비밀번호를 입력해주세요." required />';
				html += '    </td>';
				
				let cfmHtml = '';			
				cfmHtml += '    <th>비밀번호 확인</th>';
				cfmHtml += '    <td>';
				cfmHtml += '        <input type="password" id="txtpwchk" required  />';
				cfmHtml += '		<label class="point successPWChk"></label>';
				cfmHtml += '    </td>';
			
				
	            $(".password_table").append(html);
	            $(".password_cfm_table").append(cfmHtml);
	            
	            
	            $("#txtpwchk").blur(function(){
	        		if($("#txtpwchk").val() == $("#txtpw").val()){
						$(".successPWChk").text("비밀번호가 일치합니다.");
						$(".successPWChk").css("color", "green");
						$(".successPWChk").css("font-size", "0.9rem");

					}else{
						$(".successPWChk").text("비밀번호가 일치하지 않습니다.");
						$(".successPWChk").css("color", "red");
						$(".successPWChk").css("font-size", "0.9rem");
					}
	            });
	            
			});
	    });
	    
	    // &#45796 -> 엔티티 문자열. 자바스크립트에서는 innerHTML로 문자열을 입력하면 변환되어 출력된다...
	    
		function decodeHtmlEntity( str ){ 
      	  let textarea = document.createElement("textarea");  
      	  textarea.innerHTML = str;

      	  let result = textarea.value;
      	  
      	  return result;  
      	 }
	    
	    function checkNickname() {
	    	let fnResult;
	    	let NnResult;
	    	let nickname = '<sec:authentication property="principal.to.nickname" />';
	    	
	    	let dcdEntityNickname = decodeHtmlEntity(nickname);
	    		    	
	    	if ( $('#txtnick').val() != '' ) {
	    		if( $('#txtnick').val() == dcdEntityNickname ){
	    			  $('#result_nick_pass').text('현재 닉네임입니다.');
	    		} else {
	                $.ajax({
	                    type: 'POST',
	                    url: '/guest/nickcheck',
	                    data: 'nickname=' + $('#txtnick').val(),
	                    dataType: 'text',
	                    async: false,
	                    success: function(result) {
	                        if (result == 0) {
	                        	console.log(result);
	                            $('#result_nick_pass').text('사용 가능한 닉네임입니다.');
	                            NnResult = $('#result_nick_pass').text();
	                        } else {
	                        	console.log(result);
	                            $('#result_nick_false').text('이미 사용중인 닉네임입니다.');
	                            NnResult = $('#result_nick_false').text();
	                        }
	                    },
	                    error: function(err) {
		                	alert('error : ' + err.status);
		                }
	                });
	    		}
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
				if(  $('#result_nick_pass').text() == '사용 가능한 닉네임입니다.' || $('#result_nick_pass').text() == '현재 닉네임입니다.'){
					
					if( $("#txtpw").val() == $("#txtpwchk").val() || document.querySelector('.successPWChk') == null  ){
						
					} else {
						alert('비밀번호를 확인해 해주세요.');
		    			return false;
					}
	    		} else {
	    			alert('닉네임 중복확인을 해주세요.');
	    			return false;
	    		}
		}
    </script>
</head>

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
 <div class="container col-lg-8 col-md-8 col-sm-10 mb-5">
    <div class="container-sm mypage_table">
        <div class="content_header">내 정보</div>

        <form action="/member/myinfo_modify_ok" method="post" onsubmit="return confirmSubmit();">
	        <input type="hidden" name="memberKey" value="<sec:authentication property="principal.to.memberKey" />" />
	        <table class="table table-hover table_margin border-top">
	            <thead id="modify_table">
	                <tr>
	                    <th width="20%;" >이름</th>
	                    <td><sec:authentication property="principal.to.name" /></td>
	                </tr>
	                <tr>
	                    <th>아이디</th>
	                    <td><sec:authentication property="principal.to.id" /></td>
	                </tr>
	                <tr>
	                    <th>닉네임</th>
	                    <td>
	                    	<div class="hstack gap-1">
		                        <input type="text" name="nickname" id="txtnick" value="<sec:authentication property="principal.to.nickname" />" />
		                        <button id="nickcheck_btn" type="button" class="btn btn-secondary btn-sm" >중복확인</button>
		                        <label id="result_nick_false" class="css_result" style="color: red; font-size: 0.9rem;"></label>
		                        <label id="result_nick_pass" class="css_result" style="color: green; font-size: 0.9rem;"></label>
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <th>이메일</th>
	                    <td>
	                        <input type="email"  name="email" value="<sec:authentication property="principal.to.email" />" />
	                    </td>
	                </tr>
	                
	                <tr class="password_table">
	                </tr>
	                
	                <tr class="password_cfm_table">
	                </tr>
	            </thead>
	        </table>
	        <div class="d-flex flex-row-reverse">
	        	
	        	<button id="m_btn" type="submit" class="btn btn-outline-secondary  px-4 ">수정</button>
	        	<button id="c_btn" type="button" class="btn btn-outline-secondary  px-4 mx-1" onclick="location.href='/member/myinfo'" >취소</button>
	        	<button id="password_modify_btn" type="button" class="btn btn-secondary btn" style="font-size: 0.9rem;" >비밀번호 변경하기</button>
	        </div>
        </form>
		
        
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</div>


<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>