<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="header">
    <div class="memberShip text-end">
        <button type="button" onclick="location.href='./Login';" class="login_btn btn ">Login</button>
        <button type="button" onclick="location.href='./SignUp';" class="signup_btn btn ">Sign-up</button>
        <button type="button" onclick="location.href='./ManagerPage';" class="btn ">회원 관리</button>
    </div> 

    <nav class="navbar navbar-expand-lg  border-bottom">
        <div class="container-fluid">
            <a href="./Index" class="d-flex Logo">Logo</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> 

            <!-- 메뉴 -->
            <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
                <ul class="nav col-12 col-md-auto mb-2 ">
                    <li><a href="./About" class="nav-link px-4 link-dark btn">About</a></li>
                    <li class="nav-item dropdown"><a href="" class="nav-link dropdown-toggle px-4 link-dark btn"
                            role="button" data-bs-toggle="dropdown">Beverage</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="./BeverageList">음료 전체 보기</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">콜드브루</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">브루드 커피</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">에스프레소</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">프라푸치노</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">블렌디드</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">스타벅스 리프레셔</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">스타벅스 피지오</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">티(티바나)</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">기타 음료 제조</a></li>
                            <li><a class="dropdown-item" href="./BeverageList">스타벅스 주스(병음료)</a></li>
                        </ul>
                    </li>
                    <li><a href="./Recommend" class="nav-link px-4 link-dark btn">Recommend</a></li>
                    <li><a href="./Custom1" class="nav-link px-4 link-dark btn">Custom Recipe</a></li>
                    <li class="nav-item dropdown"><a href="" class="nav-link dropdown-toggle px-4 link-dark btn"
                            role="button" data-bs-toggle="dropdown">Community</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="./DailyBoardList">일상 게시판</a></li>
                            <li><a class="dropdown-item" href="./BeverageBoardList">음료 게시판</a></li>
                            <li><a class="dropdown-item" href="./ReviewBoardList">매장 방문 후기게시판</a></li>
                            <li><a class="dropdown-item" href="./MDBoardList">MD 게시판</a></li>
                            <li><a class="dropdown-item" href="./FrequencyBoardList">프리퀀시 게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown"><a href="" class="nav-link dropdown-toggle px-4 link-dark btn"
                            role="button" data-bs-toggle="dropdown">Mypage</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="./MypageInfo">개인 정보 보기</a></li>
                            <li><a class="dropdown-item" href="./MypageWriteList">내가 쓴 글 목록</a></li>
                            <li><a class="dropdown-item" href="./MypageCustom">나만의 레시피</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>