<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 폰트는 따로 css파일을 만들었습니다 -->
    <link rel="stylesheet" href="/font/font.css">
    <link rel="stylesheet" href="/css/(1)header.css">
    <link rel="stylesheet" href="/css/(1)contents.css">
    <link rel="stylesheet" href="/css/(1.5)about.css">
    <title>About</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
            integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

    <script type="text/javascript" src="/js/(1)header.js"></script>

</head>

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

    <!-- 콘텐츠 영역 -->
    <div class="container-fluid About-contents">
        <div class="about-txt">About</div>
        <div class="about-img">
            <image src="/img/(1.5)스타벅스 커뮤니티.png" class="img-fluid" alt="커뮤니티 이미지"> </image>
        </div>
        <div class="team-name">Team 별 다섯</div>
        <div class="team-image">
            <image src="/img/(1.5)MemberImage.PNG" alt="별다섯 이미지"></image>
        </div>
    </div>

    <!-- 풋터 영역 -->
    <footer></footer>
</body>
</html>