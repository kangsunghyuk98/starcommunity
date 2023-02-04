<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/css/(1.4.2)mypageList.css">
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
        <div class="content_header">내가 쓴 글</div>
        <hr>
        <table class="table table-hover table_margin">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                    <th>게시판</th>
                </tr>
            </thead>
             <tbody>
                <tr>
                    <td>seq</td>
                    <td><a class="view_btn" href="#">subject</a></td>
                    <td>wdate</td>
                    <td>board</td>
                </tr>
                <tr>
                    <td>seq</td>
                    <td><a class="view_btn" href="#">subject</a></td>
                    <td>wdate</td>
                    <td>board</td>
                </tr>
                <tr>
                    <td>seq</td>
                    <td><a class="view_btn" href="#">안녕하세요 난 제목입니다</a></td>
                    <td>20xx.xx.xx</td>
                    <td>일상게시판</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="container-sm">
        <div class="container row" style="float: none; margin: 100 auto;">
            <div class="col-md-3" style="float: none; margin: 0 auto;">      
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">next</a></li>
                </ul>
            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</div>


<!-- 풋터 영역 -->
<footer></footer>

</body>
</html>