<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	<script>
		$(document).ready(function() {
			$("#return_menu").on("click", function(){
				recipe_txt_func();
				console.log(recipe_txt);
				
				if(recipe_txt != '     ' || null ){
					alert("나만의 레시피가 저장되었습니다");	
				} else {
					alert("레시피를 선택해 주세요")
				}
				
			});
		});
	</script>
</head>

<body>
	<!-- 헤더 영역 -->
	<jsp:include page="../include/header.jsp" />

	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<div class="container content col-lg-6 col-md-8 col-sm-10 px-5 py-5 ">
		<div class="content_header">My Custom Recipe</div>
		<dlv class="row mt-5 justify-content-center">
			<div class="col-sm-6" >
				<img id="beverage_img" src="/img/(1.8.1).PNG" class="img-fluid img-thumbnail mt-2">
				<div class=" mt-2 mb-4 Beverage_name ">그린티 프라푸치노</div>
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
						<li class="list-group-item" id="shot_li">
								<label for="shot" class="li_label">샷추가</label> 
								<select class="form-select" id="shot" onchange="handleOnChange1(this)">
									<option value="" disabled selected>---선택---</option>
									<option value="1">1샷 </option>
									<option value="2">2샷 </option>
									<option value="3">3샷 </option>
									<option value="4">4샷 </option>
									<option value="5">5샷 </option>
								</select>
						</li>
						<li class="list-group-item" id="syrup_li">
							<label for="syrup" class="li_label">시럽</label>
							<select class="form-select" id="syrup" onchange="handleOnChange2(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="syrup" value="vanilla">바닐라 시럽</option>
								<option id="syrup" value="hazelnut">헤이즐넛 시럽</option>
								<option id="syrup" value="caramel">카라멜 시럽</option>
							</select>
						</li>
						<li class="list-group-item" id="milk_li">
							<label for="milk" class="li_label">우유</label>
							<select class="form-select" id="milk" onchange="handleOnChange3(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="milk" value="less">저지방우유</option>
								<option id="milk" value="none">무지방우유</option>
								<option id="milk" value="oats">귀리우유</option>
								<option id="milk" value="soy">두유</option>
							</select>
						</li>
						<li class="list-group-item" id="ice_li">
							<label for="ice" class="li_label">얼음</label>
							<select class="form-select" id="ice" onchange="handleOnChange4(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="ice" value="less">적게</option>
								<option id="ice" value="regular">보통</option>
								<option id="ice" value="extra">많이</option>
							</select>
						</li>
						<li class="list-group-item" id="whippedcream_li">
							<label for="whippedcream" class="li_label">휘핑크림</label>
							<select class="form-select" id="whippedcream"onchange="handleOnChange5(this)">
								<option value="" disabled selected>---선택---</option>
								<option id="whippedcream" value="none">빼고</option>
								<option id="whippedcream" value="less">적게</option>
								<option id="whippedcream" value="regular">보통</option>
								<option id="whippedcream" value="extra">많이</option>
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
		</div>
		<div class="mb-4">
			<form>
				<button id="return_menu" type="button" class="btn btn-outline-secondary recipe_btn">나만의 레시피 저장</button>
				<button type="button" class="btn btn-outline-secondary recipe_btn mx-1 " onclick="location.href='./Custom1'">메뉴</button>
			</form>
		</div>
	</div>
	<script src="/js/(1.8.1)custom_2.js"></script>

	<!-- 풋터 영역 -->
	<footer></footer>

</body>
</html>