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
    <link rel="stylesheet" href="/css/(1.4.1)mypageInfo.css">
    <title>마이페이지</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
 <div class="container col-lg-6 col-md-8 col-sm-10">
    <div class="mypage_table">
        <div class="content_header">내 정보</div>
        <hr>
        <table class="table table-hover table_margin">
            <thead>
                <tr>
                    <th>이름</th>
                    <td><sec:authentication property="principal.to.name" /></td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td><sec:authentication property="principal.to.id" /></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><sec:authentication property="principal.to.nickname" /></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><sec:authentication property="principal.to.email" /></td>
                </tr>
            </thead>
        </table>
        <button id="m_btn" type="button" class="btn btn-outline-secondary btn-lg px-4" onclick="location.href='#'">내 정보 수정</button>
        <button id="q_btn" type="button" class="btn btn-outline-secondary btn-lg px-4">회원탈퇴</button>
        <script>
		$('#q_btn').click(function(){
			var inputPass1 = prompt("비밀번호를 입력해주세요.");
			 
		    if(inputPass1 != null) {
		        var trimPass1 = inputPass1.trim();
		 
		        if(trimPass1 != "" && trimPass1 != undefined) {            
		            var inputPass2 = prompt("비밀번호를 다시 입력해주세요.");
		            var trimPass2 = inputPass2.trim();
		            
		            if(trimPass1 == trimPass2) {
		                
		                var memberId = $("#id").val();
		                var param = {"id":memberId, "password":trimPass1}
		            
		                $.ajax({
		                    type: 'POST',
		                    data: JSON.stringify(param),
		                    url: "/memberDelete",
		                    dataType: "text",
		                    contentType: "application/json; charset=UTF-8",
		                    success: function(data) {                    
		                        alert("탈퇴가 처리되었습니다.");
		                        location.href="/index";
		                    },
		                    error: function(jqXHR, textStatus, errorThrown) {
		                        alert("ERROR : " + textStatus + " : " + errorThrown);
		                    }            
		                })    
		            } else alert("비밀번호가 일치하지 않습니다.");    
		        } else {
		            alert("비밀번호를 제대로 입력해주세요.");
		        }
		    } 

       		});
        </script>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</div>



<!-- 풋터 영역 -->
<footer></footer>

</body>
</html>