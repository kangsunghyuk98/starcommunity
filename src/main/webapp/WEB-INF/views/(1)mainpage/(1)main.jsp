<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="/css/(1)main.css">
        
    <!-- AOS 설정 -->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <title>Index</title>

    <script src="https://code.jquery.com/jquery-3.6.3.js"
            integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <script type="text/javascript" src="/js/(1)header.js"></script>
    <!-- <style>
        #main_contents {
            position: absolute;
            font-size: 5em;
            width: 300px;
            top: 200px;
            left: 400px;
            animation: slideContents 2s ease-out;
        }
        
        @keyframes slideContents {
            from {
               left: -100px;
                opacity: 0;
            }
            to {
                left: 400px;
                opacity: 1;
            }
        }
    </style> -->
</head>

<body>
<!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
<!-- AOS 스크립트 초기화 -->
<script>
AOS.init();
</script>
<!-- 1페이지 -->
<div class="w-100 overflow-hidden bg-gray-100" id="top">
<div class="container position-relative">
  <div class="col-12 col-lg-8 mt-0 h-100 position-absolute top-0 end-0" data-aos="fade-left" style="background-image: url(/img/main_img.webp); background-size: 80%, 60%; background-repeat: no-repeat; opacity: 0.5;"></div>
    <div class="row">
		<div class="col-lg-7 py-vh-6 position-relative" data-aos="fade-right">
  			<h1 class="display-1 fw-bold mt-5">스타벅스의 모든것,</h1>
  			<h1 class="display-1 fw-bold mt-n1">별다방 커뮤니티</h1>
  			<p class="lead">스타벅스를 125% 즐길 수 있는 커뮤니티의 탄생. 스타벅스를 즐기는 사람들과 소통하고 나만의 레시피를 만들어 사람들과 공유해보세요!</p>
  			<p class="lead"><span class="count_num">${allMemberCount}</span>명의 이용자와 <span class="count_num">${allBoardCounts}</span>개의 게시글이 당신을 기다리고 있습니다 </p>
  			<a href="/DailyBoardList?boardname=dlife_board" class="btn btn-success btn-xl shadow me-3 rounded-0 my-3">별다방 들어가기</a>
		</div>
	</div>
</div>
</div>


<!-- 2페이지 -->
<div class="py-vh-5 w-100 overflow-hidden" id="page2">
 	<div class="container position-relative">
    	<div class="row d-flex justify-content-end">
			<div class="col-lg-8 my-5" data-aos="fade-down">
				<h2 class="display-6">다양한 게시판으로 사람들과 소통하세요!</h2> 
				<h2 class="display-6">일상을 나누는 것부터 프리퀀시 교환까지 모두 별다방 커뮤니티에서 가능합니다.</h2>
			</div>
		</div>
		<div class="row d-flex align-items-center">
			<div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="200">
  				<span class="h5 fw-lighter">01.</span>
  				<h3 class="py-5 border-top border-dark">일상게시판</h3>
  				<p class="page2_text">스타벅스 애호가들의 일상은 어떨까요? 시시한 주제라도 좋아요. 오늘 하루 있었던 일을 공유해보세요.</p>
  				<a href="/DailyBoardList?boardname=dlife_board" class="link-fancy">일상게시판 바로가기</a>
			</div>
			<div class="col-md-6 col-lg-4 py-vh-4 pb-0" data-aos="fade-up" data-aos-delay="400">
  				<span class="h5 fw-lighter">02.</span>
  				<h3 class="py-5 border-top border-dark">매장 방문 후기 게시판</h3>
  				<p class="page2_text">오늘 내가 방문한 스타벅스 매장은 어땠나요? 나의 스타벅스 매장 방문후기를 남겨주세요. 내가 남긴 방문 후기는 다른사람들이 보고 댓글을 남길 수도 있어요. 또한 다른 사람들의 방문후기를 보고 다음 방문 예정 매장에 대한 정보도 알아보세요!</p>
  				<a href="/ReviewBoardList?boardname=review_board" class="link-fancy">매장방문 후기게시판 바로가기</a>
			</div>
			<div class="col-md-6 col-lg-4 py-vh-6 pb-0" data-aos="fade-up" data-aos-delay="600">
  				<span class="h5 fw-lighter">03.</span>
  				<h3 class="py-5 border-top border-dark">프리퀀시 게시판</h3>
  				<p class="page2_text">스타벅스 프리퀀시 교환 게시판에서 보다 쉽게 프리퀀시를 모아보세요. 내가 글을 올려서 교환할 수도 있고 다른사람이 올린 글에 댓글을 달아서 교환할 수도 있어요.</p>
  				<a href="/FrequencyBoardList?boardname=frequency_board" class="link-fancy">프리퀀시 게시판 바로가기</a>
			</div>
		</div>
	</div>
</div>

<!-- 3페이지 -->
 <div class="untree_co-section" id="page3">
    <div class="container">
      <div class="row mb-5">
        <div class="col-12 text-center" data-aos="fade-up" data-aos-delay="0">
          <span class="caption">byeoldabang community</span>
          <h2 class="heading" style="font-size: 2.2rem;">별다방 125% 즐기는 방법</h2>
          <p style="font-size: 1.1rem;">취향에 맞는 추천음료 부터 나만의 레시피 만들기 까지</p>
        </div>
      </div> <!-- /.row -->

      <div class="row">
        <div class="col-lg-6 mb-4" data-aos="fade-up" data-aos-delay="100">
          <div class="service horizontal d-flex">
            <div class="service-icon color-1 mb-4">
              <svg class="bi bi-app-indicator" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M5.5 2A3.5 3.5 0 0 0 2 5.5v5A3.5 3.5 0 0 0 5.5 14h5a3.5 3.5 0 0 0 3.5-3.5V8a.5.5 0 0 1 1 0v2.5a4.5 4.5 0 0 1-4.5 4.5h-5A4.5 4.5 0 0 1 1 10.5v-5A4.5 4.5 0 0 1 5.5 1H8a.5.5 0 0 1 0 1H5.5z"/>
                <path d="M16 3a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
              </svg>
            </div> 
            <div class="service-contents">
              <h2>추천 음료</h2>
              <p style="font-size: 1.2rem;">오늘의 기분에 따라서 취향에 따라서 맞춤형 음료를 추천해드려요. 매일 같은 음료만 먹기 질렸다면 음료추천을 받아보세요!</p>  
              <p><a href="/home/recommend" class="read-more">Recommend 바로가기</a></p>
            </div>
          </div>
        </div>
        
        <div class="col-lg-6 mb-4" data-aos="fade-up" data-aos-delay="200">
          <div class="service horizontal d-flex">
            <div class="service-icon color-2 mb-4">
              <svg class="bi bi-arrow-repeat" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M2.854 7.146a.5.5 0 0 0-.708 0l-2 2a.5.5 0 1 0 .708.708L2.5 8.207l1.646 1.647a.5.5 0 0 0 .708-.708l-2-2zm13-1a.5.5 0 0 0-.708 0L13.5 7.793l-1.646-1.647a.5.5 0 0 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0 0-.708z"/>
                <path fill-rule="evenodd" d="M8 3a4.995 4.995 0 0 0-4.192 2.273.5.5 0 0 1-.837-.546A6 6 0 0 1 14 8a.5.5 0 0 1-1.001 0 5 5 0 0 0-5-5zM2.5 7.5A.5.5 0 0 1 3 8a5 5 0 0 0 9.192 2.727.5.5 0 1 1 .837.546A6 6 0 0 1 2 8a.5.5 0 0 1 .501-.5z"/>
              </svg>
            </div>
            <div class="service-contents">
              <h2>원하는 정보로 음료보기</h2>
              <p style="font-size: 1.2rem;">칼로리 낮은 순부터 지방 낮은순까지, 원하는 정보로 정렬하여 음료를 찾아보세요! 키워드로 음료를 찾고 음료에 대한 자세한 정보까지 제공합니다.</p>  
              <p><a href="/BeverageList" class="read-more">Beverage 바로가기</a></p>
            </div>
          </div>
        </div>
        
        <div class="col-lg-6 mb-4" data-aos="fade-up" data-aos-delay="300">
          <div class="service horizontal d-flex">
            <div class="service-icon color-3 mb-4">
              <svg class="bi bi-briefcase" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M0 12.5A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-6h-1v6a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-6H0v6z"/>
                <path fill-rule="evenodd" d="M0 4.5A1.5 1.5 0 0 1 1.5 3h13A1.5 1.5 0 0 1 16 4.5v2.384l-7.614 2.03a1.5 1.5 0 0 1-.772 0L0 6.884V4.5zM1.5 4a.5.5 0 0 0-.5.5v1.616l6.871 1.832a.5.5 0 0 0 .258 0L15 6.116V4.5a.5.5 0 0 0-.5-.5h-13zM5 2.5A1.5 1.5 0 0 1 6.5 1h3A1.5 1.5 0 0 1 11 2.5V3h-1v-.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5V3H5v-.5z"/>
              </svg>
            </div>
            <div class="service-contents">
              <h2>나만의 레시피</h2>
              <p style="font-size: 1.2rem;">어려운 스타벅스 커스텀을 그만! 음료별로 손쉽게 커스텀 옵션을 확인하고 내가 원하는 커스텀을 만들어보세요.</p>  
              <p><a href="/Custom1" class="read-more">coustom recipe 바로가기</a></p>
            </div>
          </div>
        </div>
        
        <div class="col-lg-6 mb-4" data-aos="fade-up" data-aos-delay="400">
          <div class="service horizontal d-flex">
            <div class="service-icon color-4 mb-4">
              <svg class="bi bi-collection" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M14.5 13.5h-13A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5zm-13 1A1.5 1.5 0 0 1 0 13V6a1.5 1.5 0 0 1 1.5-1.5h13A1.5 1.5 0 0 1 16 6v7a1.5 1.5 0 0 1-1.5 1.5h-13zM2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1z"/>
              </svg>
            </div>
            <div class="service-contents">
              <h2>가까운 매장 찾기</h2>
              <p style="font-size: 1.2rem;">내 근처 스타벅스 매장은 어디? 가까운 스타박스 매장을 스타벅스커뮤니티에서 찾아볼 수 있어요!</p>  
              <p><a href="#" class="read-more">가까운 매장 찾기</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
<!-- 4페이지 -->
<div class="py-vh-4 bg-gray-100 w-100 overflow-hidden" id="page4">
	<div class="container">  
		<div class="row d-flex justify-content-between align-items-center">
  			<div class="col-lg-6">
  				<div class="row gx-5 d-flex">
    				<div class="col-md-11">
      					<div class="shadow ratio ratio-16x9 rounded bg-cover bp-center align-self-end" data-aos="fade-right" style="background-image: url(/img/main_aboutus1.webp); background-size: 100%; background-repeat: no-repeat; --bs-aspect-ratio: 50%;"></div>
    				</div>
    				<div class="col-md-5 offset-md-1">
      					<div class="shadow ratio ratio-1x1 rounded bg-cover mt-5 bp-center float-end" data-aos="fade-up" style="background-image: url(/img/main_aboutus2.webp); background-size: 100%; background-repeat: no-repeat;"></div>
    				</div>
    				<div class="col-md-6">
      					<div class="col-12 shadow ratio rounded bg-cover mt-5 bp-center" data-aos="fade-left" style="background-image: url(/img/main_aboutus3.webp); background-size: 100%; background-repeat: no-repeat; --bs-aspect-ratio: 130%;"></div>
    				</div>
  				</div>
			</div>
			<div class="col-lg-4">
  				<h2 class="py-5 border-top border-dark" data-aos="fade-left">별다방 커뮤니티</h2>
  				<p data-aos="fade-left" data-aos-delay="200" style="font-size: 1.2rem;">
  				별다방 커뮤니티에 오신 걸 환영합니다. 별다방 커뮤니티에선 사용자에게 필요한 정보를 제공하고 나만의 커스텀 레시피를 저장 및 공유할 수 있습니다. 성향에 맞추어 음료를 추천해주고 편리한 UI를 제공하는 사이트입니다. 아래 ahout us를 클릭하면 커뮤니티에 대한 정보를 더 얻을 수 있습니다.
  				</p>
  				<p>
    				<a href="/home/about" data-aos="fade-left" data-aos-delay="400">About us</a>
  				</p>
			</div>
		</div>
  	</div>
</div>

<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>
</body>
</html>