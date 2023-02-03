<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- css 적용을 위한 부분 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/font/font.css">
    <link rel="stylesheet" href="/css/(1)header.css">
    <link rel="stylesheet" href="/css/(1.7)_recommend.css">   
    <title>Recommend</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>  

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
<div class="container col-lg-6 col-md-8 col-sm-10">
    <section id="main" class="mx-auto mb-5 px-3 py-5">
        <h1>Can I recommend something to you?</h1>
        <div class="col-lg-6 col-md-8 col-sm-10 mx-auto my-5">
            <img src="/img/(1.7)_main.jpg" alt="mainImage" class="img-fluid">
        </div>
        <p>
            오늘은 뭘 마실까 고민이 되시나요?<br />
            나와 꼭 맞는 음료를 찾고 싶은 당신을 위해 준비했습니다<br />
        </p>
        <button type="button" class="btn btn-primary mt-3" onclick="js:begin()">  Start Now  </button>
    </section>
    <section id="qna" >
        <div class="status mx-auto mt-5">
            <div class="statusBar">

            </div>
        </div>
        <div class="q_OutLine my-5 py-3 mx-auto">
            <div class="qBox">

            </div>
        </div>
        <div class="answerBox">
            
        </div>
    </section>
    <section id="result" class="mx-auto mt-3 mb-5 px-3 py-5" >
        <h3><< 추천 결과 >></h3>
        <div class="resultName">

        </div>
        <div id="resultImg" class="col-lg-6 col-md-8 col-sm-10 mx-auto mt-3 mb-5">
            
        </div>
        <div class="resultDesc">

        </div>
        <button type="button" class="btn btn-primary mt-5" onclick="location.href='/Recommend'">  Again?  </button>
        <!-- 결과 내용을 sns로 공유하는 기능으로 확장할 가능성을 대비해 주석처리 -->
        <!-- <button type="button" class="btn btn-primary kakao mt-3 py-2 px-3" onclick="">공유하기</button> -->
    </section>
    <!-- 객체를 먼저 만들어야 함수를 사용할 수 있으므로 (1.7)_recommendQnaObjects.js를 먼저 선언해줌 -->
    <script src="/js/(1.7)_recommendQnaObject.js" charset="utf-8"></script>
    <script src="/js/(1.7)_recommendLogics.js" charset="utf-8"></script>
</div>


<!-- 풋터 영역 -->
<footer></footer>

</body>
</html>