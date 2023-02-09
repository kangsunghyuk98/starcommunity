<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header id="header" class="mb-3">
    <div class="memberShip text-end">
        <sec:authorize access="isAnonymous()">
            <button type="button" onclick="location.href='/guest/login'" class="login_btn btn ">Login</button>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal.to.nickname" />님
            <button type="button" onclick="location.href='/guest/logout'" class="signup_btn btn ">Log-out</button>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <button type="button" onclick="location.href='/admin/main'" class="signup_btn btn ">회원 관리</button>
            </sec:authorize>
        </sec:authorize>
    </div>
 
    <nav class="navbar navbar-expand-lg  border-bottom " >
        <div class="container-fluid ">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> 

            <!-- 메뉴 -->
            <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10" style="background-color: white;">
    			<a href="/" class="d-flex Logo mb-4 " value="Logo"><img src="/img/img_files/starcommunity_logo.png" class="img-fluid"  width="150" height="75"></a>        	
                <ul class="nav col-12 col-md-auto mb-3 mx-3">
                    <li><a href="/home/about" class="nav-link px-4 link-dark btn">About</a></li>
                    <li class="nav-item dropdown"><a href="" class="nav-link dropdown-toggle px-4 link-dark btn"
                            role="button" data-bs-toggle="dropdown">Beverage</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/BeverageList">음료 전체 보기</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=콜드 브루">콜드브루</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=브루드 커피">브루드 커피</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=에스프레소">에스프레소</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=프라푸치노">프라푸치노</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=블렌디드">블렌디드</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=스타벅스 리프레셔">스타벅스 리프레셔</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=스타벅스 피지오">스타벅스 피지오</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=티">티</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=기타 제조 음료">기타 제조 음료</a></li>
                            <li><a class="dropdown-item" href="/BeverageList?category=스타벅스 주스(병음료)">스타벅스 주스(병음료)</a></li>
                       	
                        </ul>
                    </li>
                    <li><a href="/home/recommend" class="nav-link px-4 link-dark btn">Recommend</a></li>
                    <li><a href="/Custom1" class="nav-link px-4 link-dark btn">Custom Recipe</a></li>
                    <li class="nav-item dropdown"><a href="" class="nav-link dropdown-toggle px-4 link-dark btn"
                            role="button" data-bs-toggle="dropdown">Community</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/DailyBoardList?boardname=dlife_board">일상 게시판</a></li>
                            <li><a class="dropdown-item" href="/BeverageBoardList?boardname=beverage_board">음료 게시판</a></li>
                            <li><a class="dropdown-item" href="/ReviewBoardList?boardname=review_board">매장 방문 후기게시판</a></li>
                            <li><a class="dropdown-item" href="/MDBoardList?boardname=md_board">MD 게시판</a></li>
                            <li><a class="dropdown-item" href="/FrequencyBoardList?boardname=frequency_board">프리퀀시 게시판</a></li>
                        </ul>
                    </li>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication property="principal" var="principal"/>
                    <li class="nav-item dropdown"><a href="" class="nav-link dropdown-toggle px-4 link-dark btn"
                            role="button" data-bs-toggle="dropdown">Mypage</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/member/myinfo">개인 정보 보기</a></li>
                            <li><a class="dropdown-item" href="/member/myboardlists?memberKey=${principal.to.memberKey}">내가 쓴 글 목록</a></li>
                            <li><a class="dropdown-item" href="/MypageCustom">나만의 레시피</a></li>
                        </ul>
                    </li>
                    </sec:authorize>
                </ul>
            </div>
        </div>
    </nav>
</header>