<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 폰트는 따로 css파일을 만들었습니다 -->
    <link rel="stylesheet" href="font/font.css">
    <link rel="stylesheet" href="css/(1)header.css">
    <link rel="stylesheet" href="css/(1)contents.css">
    <link rel="stylesheet" href="css/(1.6.1)beverageList.css">
    <title>Beverage</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

    <script type="text/javascript" src="js/(1)header.js"></script>
</head>

<body>
    <!-- 헤더 영역 -->
    <div id="header">
        <div class="memberShip text-end">
            <button type="button" href="#" class="login_btn btn ">Login</button>
            <button type="button" href="#" class="signup_btn btn ">Sign-up</button>
        </div>

        <nav class="navbar navbar-expand-lg  border-bottom">
            <div class="container-fluid">
                <a href="./(1)Index.html" class="d-flex Logo">Logo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- 메뉴 -->
                <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
                    <ul class="nav col-12 col-md-auto mb-2 ">
                        <li><a href="./(1.5)About.html" class="nav-link px-4 link-dark btn">About</a></li>
                        <li class="nav-item dropdown"><a href="#2" class="nav-link dropdown-toggle px-4 link-dark btn"
                                role="button" data-bs-toggle="dropdown">Beverage</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">음료 전체 보기</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">콜드브루</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">브루드 커피</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">에스프레소</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">프라푸치노</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">블렌디드</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">스타벅스 리프레셔</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">스타벅스 피지오</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">티(티바나)</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">기타 음료 제조</a></li>
                                <li><a class="dropdown-item" href="./(1.6.1)BeverageList.html">스타벅스 주스(병음료)</a></li>
                            </ul>
                        </li>
                        <li><a href="#3" class="nav-link px-4 link-dark btn">Recommend</a></li>
                        <li><a href="#4" class="nav-link px-4 link-dark btn">Custom Recipe</a></li>
                        <li class="nav-item dropdown"><a href="#5" class="nav-link dropdown-toggle px-4 link-dark btn"
                                role="button" data-bs-toggle="dropdown">Community</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">일상 게시판</a></li>
                                <li><a class="dropdown-item" href="#">음료 게시판</a></li>
                                <li><a class="dropdown-item" href="#">매장 방문 후기게시판</a></li>
                                <li><a class="dropdown-item" href="#">MD 게시판</a></li>
                                <li><a class="dropdown-item" href="#">프리퀀시 게시판</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown"><a href="#5" class="nav-link dropdown-toggle px-4 link-dark btn"
                                role="button" data-bs-toggle="dropdown">Mypage</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">개인 정보 보기</a></li>
                                <li><a class="dropdown-item" href="#">내가 쓴 글 목록</a></li>
                                <li><a class="dropdown-item" href="#">나만의 레시피</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <!-- 콘텐츠 영역 -->
    <br>
    <br>
    <div class="container contents">
        <div class="content_header mt-auto ">음료 전체 보기</div>
        <hr class="mt-4 mb-4">
        <!-- 검색, 정렬 -->
        <div class="d-flex justify-content-end mt-4 p-2">
            <div class="">
                <select class="form-select form-select-sm w_search" aria-label=".form-select-sm example">
                    <option value="all" selected>전체 선택</option>
                    <option value="calorie_des">칼로리 높은 순</option>
                    <option value="calorie_acs">칼로리 낮은 순</option>
                    <option value="calorie_acs">카페인 높은 순</option>
                    <option value="calorie_acs">카페인 낮은 순</option>
                    <option value="calorie_acs">지방 높은 순</option>
                    <option value="calorie_acs">지방 낮은 순</option>
                    <option value="calorie_acs">당 높은 순</option>
                    <option value="calorie_acs">당 낮은 순</option>
                </select>
            </div>
            <div class=" input-group mb-3 w_search_text  ">
                <input type="text" class="form-control" placeholder="search" aria-label="Recipient's username"
                    aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
            </div>
        </div>

        <div class="container">
            <div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img src="img/(1.6.1.1)스타벅스콜드브루.jpg" class="img-thumbnail img-fluid" alt=""></a> 
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img
                                src="img/(1.6.1.1)스타벅스콜드브루.jpg"
                                class="img-thumbnail img-fluid" alt=""></a>
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img
                                src="img/(1.6.1.1)스타벅스콜드브루.jpg"
                                class="img-thumbnail img-fluid" alt=""></a>
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img
                                src="img/(1.6.1.1)스타벅스콜드브루.jpg"
                                class="img-thumbnail img-fluid" alt=""></a>
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img
                                src="img/(1.6.1.1)스타벅스콜드브루.jpg"
                                class="img-thumbnail img-fluid" alt=""></a>
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img
                                src="img/(1.6.1.1)스타벅스콜드브루.jpg"
                                class="img-thumbnail img-fluid" alt=""></a>
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img
                                src="img/(1.6.1.1)스타벅스콜드브루.jpg"
                                class="img-thumbnail img-fluid" alt=""></a>
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <a href="./(1.6.1.1)BeverageInfo.html"><img
                                src="img/(1.6.1.1)스타벅스콜드브루.jpg"
                                class="img-thumbnail img-fluid" alt=""></a>
                        <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 풋터 영역 -->
    <footer></footer>
</body>

</html>