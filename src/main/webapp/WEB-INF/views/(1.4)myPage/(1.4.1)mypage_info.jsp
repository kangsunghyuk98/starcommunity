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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
 <div class="container col-lg-8 col-md-8 col-sm-10 mb-5">
    <div class="contariner-sm mypage_table">
        <div class="content_header">내 정보</div>
        <hr>
        <table class="table table-hover table_margin">
            <thead>
                <tr>
                    <th width="20%;" >이름</th>
                    <td><sec:authentication property="principal.to.name" /></td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td id="principal_id"><sec:authentication property="principal.to.id" /></td>
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
        <div class="hstack">
	        <button id="q_btn" value="<sec:authentication property="principal.to.memberKey" />" type="button" class="btn btn-outline-secondary btn-lg px-4">회원탈퇴</button>
	        <button id="m_btn" type="button" class="btn btn-outline-secondary btn-lg px-4 ms-auto" onclick="location.href='/member/myinfo_modify'">내 정보 수정</button>
        </div>
        <script>
            $('#q_btn').click(function(){
                let inputPass1 = prompt("비밀번호를 입력해주세요.");

                if(inputPass1 != null) {
                    let trimPass1 = inputPass1.trim();

                    if(trimPass1 != "" && trimPass1 != undefined) {
                        let inputPass2 = prompt("비밀번호를 다시 입력해주세요.");
                        let trimPass2 = inputPass2.trim();

                        if(trimPass1 == trimPass2) {

                            let memberId = document.getElementById("principal_id").innerText.trim();
                            let memberKey = $(this).attr('value');

                            $.ajax({
                                type: 'GET',
                                data: {
                                  id : memberId,
                                  password : trimPass1,
                                  memberKey : memberKey
                                },
                                url: "/member/myinfo_delete_ok",
                                dataType: "text",
                                success: function(flag) {
                                    if (flag == 0) {
                                        alert("탈퇴가 처리되었습니다.");
                                        location.href="/guest/logout";
                                    } else {
                                        alert("탈퇴 실패하였습니다. 정보를 다시 입력해주세요.");
                                    }
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
<jsp:include page="../include/footer.jsp"/>

</body>
</html>