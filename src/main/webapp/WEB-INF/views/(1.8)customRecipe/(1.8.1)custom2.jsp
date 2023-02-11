<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.dto.CustomRecipeTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.dto.BeverageTO"%>	
<%
	BeverageTO to = (BeverageTO)request.getAttribute("to");
	
	
	String seq = to.getSeq();
	
	String name= to.getName();
	
	String image = to.getImage();	
	
	List<CustomRecipeTO> allCustom = (List<CustomRecipeTO>) request.getAttribute("allCustom");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
	<!-- 폰트는 따로 css파일을 만들었습니다 -->
	<link rel="stylesheet" href="/font/font.css">
	<link rel="stylesheet" href="/css/(1)header.css">
	<link rel="stylesheet" href="/css/(1)contents.css">
	<link rel="stylesheet" href="/css/(1.8.1)custom2.css">
	<title>커스텀 레시피</title>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.js"
	        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script>
		
	
		$(document).ready(function() {	
			let memberKey = 0;
			<sec:authorize access="isAuthenticated()">
        	<sec:authentication property="principal" var="principal"/>;
    	    	memberKey = ${principal.to.memberKey};     	    	
        	</sec:authorize>
			$("#return_menu").on("click", function(){
				var recipe = recipe_txt_func();
				const beverage = urlParams.get('name');
				
				console.log(recipe);				
				console.log(beverage);
				
				if(recipe_txt && recipe_txt.trim() != '' ){		
					
					alert("나만의 레시피가 저장되었습니다");	
				
					$.ajax({
						type: 'POST',
					url: '/CustomInsert',
						data:{
						recipe: recipe,
						memberKey: memberKey,
						beverage: beverage	
						},
						dataType:'text',
						success: function(result){
							
					},
						error: function(){
							alert('오류')
							return;
						}
					})
				} 
				
				else {
					alert("레시피를 선택해 주세요");
				}
				
			});
		});
	</script>
	
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
		        title: '나만의 레시피 공유',
		        description: '스타벅스에서 즐기실 수 있는 나만의 레시피 공유',
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
	<script src="/js/(1.8.1)custom_2Select.js"></script>
	
	
</head>

<body>
	<!-- 헤더 영역 -->
	<jsp:include page="../include/header.jsp" />
<input type="hidden" id="Himage" class="Himage" value = "<%=image %>">
	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<div class="container content col-lg-6 col-md-8 col-sm-10 px-5 py-5 ">
		<div class="content_header">My Custom Recipe</div>
		<hr>
		<dlv class="row mt-5 justify-content-center">
			<div class="col-sm-6">
				<img id="beverage_img" src="<%=image %>" class="img-fluid img-thumbnail mt-2" style="width: 100%;">
				<div class="mt-2 mb-4 Beverage_name"><%=name %></div>
     		</div>
			<div class="custom_text col-sm-6" >
				<form id="custom_form">
					<ul class="list-group list-group-flush" id="custom_ul">
						<li class="list-group-item" id="size_li"><label for="size" class="li_label">사이즈</label>
							<select class="form-select" id="select_value" name="select_value" onchange="handleOnChange0(this)">
								<option value="" disabled selected>---선택---</option>
								<option value="tall">톨 사이즈</option>
								<option value="grande">그란데 사이즈</option>
								<option value="venti">벤티 사이즈</option>
							</select>
						</li>
						<li class="list-group-item" id="coffee1_li">
								<label for="coffee1" class="li_label">커피 추가</label> 
								<select class="form-select" id="coffee1" onchange="handleOnChange1(this)">
									<option value="" disabled selected>---선택---</option>
									<option value="1">에스프레소 샷 </option>
									<option value="2">에스프레소 옵션 </option>
									<option value="3">프라푸치노 로스트 </option>									
								</select>
						</li>
						<li class="list-group-item" id="coffee2_li">
								<label for="coffee2" class="li_label">커피 추가</label> 
								<select class="form-select" id="coffee2" onchange="handleOnChange2(this)">
									<option value="" disabled selected>---선택---</option>
									<option value="1">블론드 </option>
									<option value="2">디카페인 </option>
									<option value="3">1/2 디카페인 </option>									
								</select>
						</li>
						<li class="list-group-item" id="coffee3_li">
								<label for="coffee3" class="li_label">샷추가</label> 
								<select class="form-select" id="coffee3" onchange="handleOnChange3(this)">
									<option value="" disabled selected>---선택---</option>
									<option value="1">1 </option>
									<option value="2">2</option>
									<option value="3">3 </option>
									<option value="4">4 </option>
									<option value="5">5 </option>
									<option value="6">6 </option>
									<option value="7">7 </option>
									<option value="8">8 </option>
									<option value="9">9 </option>
								</select>
						</li>
						<li class="list-group-item" id="syrup_li">
							<label for="syrup1" class="li_label">시럽</label>
							<select class="form-select" id="syrup1" onchange="handleOnChange4(this)">
								<option value="" disabled selected>---선택---</option>
								<option value="mocha">모카 시럽</option>
								<option value="whiteMocha">화이트모카 시럽</option>
								<option value="dolce">돌체 시럽</option>														
								<option value="vanilla">바닐라 시럽</option>
								<option value="hazelnut">헤이즐넛 시럽</option>
								<option value="caramel">카라멜 시럽</option>
								<option value="strawberry">딸기소스</option>
								<option value=frappuccino>프라푸치노용 시럽</option>
								<option value=classic>클래식 시럽</option>
								
							</select>
						</li>
						
						<li class="list-group-item" id="syrup2_li">
								<label for="syrup2" class="li_label">시럽 옵션</label> 
								<select class="form-select" id="syrup2" onchange="handleOnChange5(this)">
									<option value="" disabled selected>---선택---</option>
									<option value="1">1 </option>
									<option value="2">2 </option>
									<option value="3">3 </option>
									<option value="4">4 </option>
									<option value="5">5 </option>
									<option value="6">6 </option>
									<option value="7">7 </option>
									<option value="8">8 </option>
									<option value="9">9 </option>
								</select>
						</li>
						<li class="list-group-item" id="syrup3_li">
								<label for="syrup3" class="li_label">프라푸치노 시럽 옵션</label> 
								<select class="form-select" id="syrup3" onchange="handleOnChange6(this)">
									<option value="" disabled selected>---선택---</option>
									<option value="normal">일반 </option>
									<option value="light">라이트</option>									
								</select>
						</li>
						<li class="list-group-item" id="tea_li">
							<label for="tea" class="li_label">티</label>
							<select class="form-select" id="tea" onchange="handleOnChange7(this)">
								<option value="" disabled selected>---선택---</option>
								<option value="less">적게</option>
								<option value="normal">보통</option>
								<option value="more">많이</option>								
							</select>
						</li>
						<li class="list-group-item" id="milk_li">
							<label for="milk" class="li_label">우유</label>
							<select class="form-select" id="milk" onchange="handleOnChange8(this)">
								<option value="" disabled selected>---선택---</option>
								<option value="less">저지방우유</option>
								<option value="none">무지방우유</option>
								<option value="oats">귀리우유</option>
								<option value="soy">두유</option>
								<option value="normal">일반</option>
								<option value="none">없이</option>
							</select>
						</li>
						<li class="list-group-item" id="ice_li">
							<label for="ice" class="li_label">얼음</label>
							<select class="form-select" id="ice" onchange="handleOnChange9(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="ice" value="less">적게</option>
								<option id="ice" value="regular">보통</option>
								<option id="ice" value="extra">많이</option>
							</select>
						</li>
						<li class="list-group-item" id="java_chip1_li">
							<label for="java_chip1" class="li_label">자바칩</label>
							<select class="form-select" id="java_chip1"onchange="handleOnChange10(this)">
								<option value="" disabled selected>---선택---</option>
								<option value="normal">통 자바칩 토핑</option>
								<option value="frappuccino">프라푸치노 자바칩</option>
								<option value="half">자바칩&토핑(반반)</option>								
							</select>
						</li>
						<li class="list-group-item" id="java_chip2_li">
							<label for="java_chip2" class="li_label">자바칩 옵션</label>
							<select class="form-select" id="java_chip2"onchange="handleOnChange11(this)">
								<option value="" disabled selected>---선택---</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5 </option>
								<option value="6">6 </option>
								<option value="7">7 </option>
								<option value="8">8 </option>
								<option value="9">9 </option>
							</select>
						</li>
						<li class="list-group-item" id="whippedcream1_li">
							<label for="whippedcream1" class="li_label">휘핑크림</label>
							<select class="form-select" id="whippedcream1"onchange="handleOnChange12(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="whippedcream1" value="none">일반 휘핑</option>
								<option id="whippedcream1" value="less">에스프레소 휘핑</option>								
							</select>
						</li>
						<li class="list-group-item" id="whippedcream2_li">
							<label for="whippedcream2" class="li_label">휘핑크림 옵션</label>
							<select class="form-select" id="whippedcream2"onchange="handleOnChange13(this)">
								<option value="" disabled selected>---선택---</option>								
								<option id="whippedcream2" value="less">적게</option>
								<option id="whippedcream2" value="normal">보통</option>
								<option id="whippedcream2" value="more">많이</option>								
							</select>
						</li>
						<li class="list-group-item" id="drizzle1_li">
							<label for="drizzle1" class="li_label">드리즐</label>
							<select class="form-select" id="drizzle1"onchange="handleOnChange14(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="drizzle1" value="caremel">카라멜 드리즐</option>
								<option id="drizzle1" value="chocolate">초콜릿 드리즐</option>														
							</select>
						</li>
						<li class="list-group-item" id="drizzle2_li">
							<label for="drizzle2" class="li_label">드리즐 옵션</label>
							<select class="form-select" id="drizzle1"onchange="handleOnChange15(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="drizzle2" value="less">적게</option>
								<option id="drizzle2" value="normal">보통</option>
								<option id="drizzle2" value="more">많이</option>														
							</select>
						</li>
						<li class="list-group-item" id="etc1_li">
							<label for="etc1" class="li_label">기타:민트 초콜릿 칩 파우더 </label>
							<select class="form-select" id="etc1"onchange="handleOnChange16(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="etc1" value="less">적게</option>
								<option id="etc1" value="normal">보통</option>																					
							</select>
						</li>
						<li class="list-group-item" id="etc2_li">
							<label for="etc2" class="li_label">기타:망고 주스 </label>
							<select class="form-select" id="etc2"onchange="handleOnChange17(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="etc2" value="less">적게</option>
								<option id="etc2" value="normal">보통</option>	
								<option id="etc2" value="more">많이</option>																					
							</select>
						</li>
						<li class="list-group-item" id="etc3_li">
							<label for="etc3" class="li_label">기타:유기농 말차 </label>
							<select class="form-select" id="etc3"onchange="handleOnChange18(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="etc3" value="1">1</option>
								<option id="etc3" value="2">2</option>
								<option id="etc3" value="3">3</option>
								<option id="etc3" value="4">4</option>
								<option id="etc3" value="5">5</option>
								<option id="etc3" value="6">6</option>
								<option id="etc3" value="7">7</option>
								<option id="etc3" value="8">8</option>
								<option id="etc3" value="9">9</option>																			
							</select>
						</li>
						<li class="list-group-item" id="topping_li">
							<label for="topping" class="li_label">에스프레소 칩 토핑 </label>
							<select class="form-select" id="topping"onchange="handleOnChange19(this)">
								<option value="" disabled selected>---선택---</option>
								<option value="less">적게</option>
								<option value="normal">많이</option>																										
							</select>
						</li>
					</ul>
				</form>
			</div>
		</dlv>
		<!-- 레시피 생성 구역 -->
		<!-- <div class="text_result container mt-5" style="background: url('img/img_files/source11.jpg'); background-size: cover; background-position: center; "> -->
		<div class="text_result container mt-5">
			<div id="result0"></div>
			<div id="result1"></div>
			<div id="result2"></div>
			<div id="result3"></div>
			<div id="result4"></div>
			<div id="result5"></div>
			<div id="result6"></div>
			<div id="result7"></div>
			<div id="result8"></div>
			<div id="result9"></div>
			<div id="result10"></div>
			<div id="result11"></div>
			<div id="result12"></div>
			<div id="result13"></div>
			<div id="result14"></div>
			<div id="result15"></div>
			<div id="result16"></div>
			<div id="result17"></div>
			<div id="result18"></div>
			<div id="result19"></div>
		</div>
		<div class="mb-4">
			<form>		
			<!-- 카카오 공유 버튼 (임시) -->		 
			    <input type="button" onClick="sendLinkDefault();" class="btn btn-warning recipe_btn" value="카카오톡 공유하기"/>
			    
			
			<sec:authorize var="" access="isAuthenticated()">
				
					<form action="/CustomInsert" method="post">		                              
	                  
						<button type="button" id="return_menu" class="btn btn-success recipe_btn" >레시피 저장</button>
		 		   </form>	
	 		  
			</sec:authorize>	
				<button type="button" class="btn btn-success recipe_btn" onclick="location.href='./Custom1'">메뉴</button>
			<sec:authorize access="isAnonymous()">
	        	<div >
	            	<p class="cmt_login_message mt-4 mb-5" >로그인 후 나만의 레시피를 저장하실 수 있습니다</p>
	            </div>
        	</sec:authorize>
			
			</form>		
		</div>
	</div>
	<script src="/js/(1.8.1)custom_2.js"></script>
	

	<!-- 풋터 영역 -->
	<footer></footer>

</body>
</html>