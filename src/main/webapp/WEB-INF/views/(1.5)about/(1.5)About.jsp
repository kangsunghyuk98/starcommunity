<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
     <!-- AOS 설정 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
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
<!-- AOS 스크립트 초기화 -->
<script>
AOS.init();
</script>
<br>
    <!-- 콘텐츠 영역 -->
    <!-- <div class="container col-lg-6 col-md-8 col-sm-10 About-contents vstack gap-2 mx-auto">
        <div class="col about-txt">About</div>
        <div class="col about-img mt-3 mb-5 "  >
            <image src="/img/(1.5)about.png" class="img-fluid" width="800"; alt="커뮤니티 이미지"> </image>
        </div>
        <div class="col team-name">Team 별 다섯</div>
        <div class="col team-image mt-2 mb-5" >
            <image src="/img/(1.5)Member.PNG" class="img-fluid" width="400"; alt="별다섯 이미지"></image>
        </div> 
    </div>-->
<div class="untree_co-section" id="about-section">
	<div class="container">
    	<div class="row justify-content-between mb-5">
       		<div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
          		<img src="/img/team.webp" alt="Image" class="img-fluid">
        	</div>
        	<div class="col-lg-6">
          		<div class="mb-4">
            		<span class="caption">About</span>
            		<h2 style="font-weight: bold;">소개</h2>
          		</div>
          		<div class="mb-4">
            		<p style="font-size: 1.35rem;">방문을 환영합니다. 저희는 별다섯팀입니다. 5명이 모여서 별점 5개를 목표로 사이트를 제작했습니다. 2023년 1월 13일부터 프로젝트를 진행했고 같은해 2023년 2월 16일에 프로젝트를 마무리했습니다.</p>
            		<p style="font-size: 1.35rem;">별다방 커뮤니티는 사용자에게 필요한 정보를 제공하고, 취향에 맞는 추천을 해주고, 사람들과 공유할 수 있는 즐거움을 선사하며, 편리한 UI로 원활한 소통을 할 수 있는 차별화된 커뮤니티입니다. </p>
            		<p style="font-size: 1.35rem;">커뮤니티 이용 시 불편한 점은 하단의 이메일 주소를 통해 남겨주시기 바랍니다</p>
            		<p style="font-size: 1.35rem; color: #2E8B57;">byeoldabang_community@gmail.com</p>
          		</div>
          		<br>
          		<br>
        	</div>
      	</div> 
	</div>
</div>
<div class="container col-lg-8 col-md-8 col-sm-10 About-contents vstack gap-2 mx-auto">
	<div class="mb-4">
		<span class="caption">words</span>
    	<h2 style="font-weight: bold;">소감</h2>
    </div>
    <div class="col team-image mt-2 mb-5" >
    	<image src="/img/(1.5)Member.png" class="img-fluid" width="600"; alt="별다섯 이미지"></image>
    </div> 
    <div class="mb-5 team">
      	<p class="team_text"><span style="color: #5AC8C8;">민트티</span>에 샷 추가 일명 '민샷추'를 사랑하는 음료 추천에 진심인 전 바리스타, 현 개발자로서 별다섯팀의 팀장을 맡아 즐겁게 작업했습니다.</p>
       	<p class="team_role">from. 팀장 이효원</p>		
		<p class="team_text">집 앞에 스타벅스를 종종 이용합니다. 아침엔 <span style="color: #CDA27D;">카페 라떼</span>죠. 프로젝트도 아이스 카페 라떼와 함께 잘 마쳤습니다:)</p>
		<p class="team_role">from. 프론트엔드 리더 박은총</p>
		<p class="team_text">팀 프로젝트를 하면서 비로소야 개발과 겨우 친해진 기분이었어요~ 최애 음료는 달달하지만 씁쓸한 티 많이 넣은 <span style="color: #FF8200;">자몽허니블랙티</span>입니다.</p>
		<p class="team_role">from. 프론트엔드 김민수</p>
		<p class="team_text">별다섯 팀의 백엔드 리더를 맡으면서 너무 재밌었습니다! 제일 좋아하는 음료는 <span style="color: #8B4513;">콜드브루</span>입니다.</p>
		<p class="team_role">from. 백엔드 리더 강성혁</p>
		<p class="team_text">회의 때마다 방문했던 스타벅스 교대법원점이 그리울 것 같습니다. 자주 먹었던 <span style="color: #FFD732;">아이스 바닐라빈 라떼</span>가 앞으로도 개발할 때 종종 생각날 거 같아요.</p>
		<p class="team_role">from. 백엔드 최용혁</p>
	</div>
</div>
	
<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>