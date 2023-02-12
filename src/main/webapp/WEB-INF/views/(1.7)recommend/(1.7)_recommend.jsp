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
  	<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
	        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    
    <!--  카카오 공유하기 (임시) -->
	<script type="text/javascript">
	try {
		  function sendLinkDefault() {
			var urlNow = window.location.href;
			var image =$('#Himage').val();
			console.log(urlNow);
		    Kakao.init('c8df747b7573e11f1ae3c257b67fa344')
		    Kakao.Link.sendDefault({
		      objectType: 'feed',
		      content: {
		        title: '음료 추천 공유',
		        description: '오늘의 기분에 따라서 취향에 따라서 맞춤형 음료를 추천해드려요.',
		        imageUrl:
		          image,
		        link: {
		          mobileWebUrl: urlNow,
		          webUrl: urlNow
		        },
		      },		      
		      buttons: [
		        {
		          title: '웹으로 보기',
		          link: {
		            mobileWebUrl: urlNow,
		            webUrl: urlNow
		          },
		        },
		        {
		          title: '앱으로 보기',
		          link: {
		            mobileWebUrl: urlNow,
		            webUrl: urlNow
		          },
		        },
		      ],
		    })
		  }
		; window.kakaoDemoCallback && window.kakaoDemoCallback() }
		catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
	</script>
	
</head>  

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<input type="hidden" id="Himage" class="Himage" value="https://i.ibb.co/QnkGzjH/1-7-main.jpg">
<br>
<br>
<div class="container col-lg-8 col-md-8 col-sm-10">
    <section id="main" class="mx-auto mb-5 px-3 py-5">
        <div class="content_header">Can I recommend something to you?</div>
        <div class="col-lg-6 col-md-8 col-sm-10 mx-auto my-5">
            <img src="/img/(1.7)_main.jpg" alt="mainImage" class="img-fluid" style="max-width: 90%;">
        </div>
        <p>
            오늘은 뭘 마실까 고민이 되시나요?<br />
            나와 꼭 맞는 음료를 찾고 싶은 당신을 위해 준비했습니다<br />
        </p>
        <button type="button" class="btn btn-success mt-3" onclick="js:begin()" style="width: 20%">  Start Now  </button>
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
        <div>
        	<button type="button" class="btn btn-success mt-5" onclick="location.href='/home/recommend'" style="width: 20%">  Again?  </button>
        </div>
        <div class="mt-2">
        	<!-- 카카오 공유 버튼 (임시) -->		 
    		<input type="button" onClick="sendLinkDefault();" class="btn btn-warning recipe_btn" value="카카오톡으로 음료 추천 기능 공유하기"/>
    	</div>
        <!-- 결과 내용을 sns로 공유하는 기능으로 확장할 가능성을 대비해 주석처리 -->
        <!-- <button type="button" class="btn btn-primary kakao mt-3 py-2 px-3" onclick="">공유하기</button> -->
    </section>
    <!-- 객체를 먼저 만들어야 함수를 사용할 수 있으므로 (1.7)_recommendQnaObjects.js를 먼저 선언해줌 -->
    <script src="/js/(1.7)_recommendQnaObject.js" charset="utf-8"></script>
    <script src="/js/(1.7)_recommendLogics.js" charset="utf-8"></script>
</div>


<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>