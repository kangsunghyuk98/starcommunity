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
        <hr>

        <form action="/member/myinfo_modify_ok" method="post">
	        <input type="hidden" name="memberKey" value="<sec:authentication property="principal.to.memberKey" />" />
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
	                    <td>
	                        <input type="text" name="nickname" value="<sec:authentication property="principal.to.nickname" />" />
	                        <button id="check_btn" type="button" class="btn btn-secondary">중복확인</button>
	                    </td>
	                </tr>
	                <tr>
	                    <th>이메일</th>
	                    <td>
	                        <input type="email" name="email" value="<sec:authentication property="principal.to.email" />" />
	                    </td>
	                </tr>
	                <tr>
	                    <th>비밀번호 변경</th>
	                    <td>
	                        <input type="password" name="password" placeholder="수정할 비밀번호를 입력해주세요." />
	                    </td>
	                </tr>
	                <tr>
	                    <th>비밀번호 확인</th>
	                    <td>
	                        <input type="password" />
	                    </td>
	                </tr>
	            </thead>
	        </table>
	        <div class="d-flex flex-row-reverse">
	        	<button id="m_btn" type="submit" class="btn btn-outline-secondary btn-lg px-4 ">수정</button>
	        	<button id="c_btn" type="button" class="btn btn-outline-secondary btn-lg px-4 mx-1" onclick="location.href='/member/myinfo'" >취소</button>
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