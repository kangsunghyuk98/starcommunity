<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
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
    <link rel="stylesheet" href="/css/(1.3.1.1)boardview.css">
    <title>BoardView</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/js/(1)header.js"></script>

    <script>
        $(document).ready(function () {
            $("#d_btn").on("click", function () {
                let inputPassword = prompt("비밀번호를 입력하세요");
                let password = '12345';
                if (inputPassword != null || '') {
                    if (inputPassword == password) {
                        console.log("비밀번호는" + inputPassword);
                        alert("글이 삭제되었습니다");
                    } else {
                        alert("비밀번호가 틀렸습니다");
                    }
                }
            });
            
            let text = "1";
    		$(".cmt_btn").on("click", function(){
    			if( text != "" || null ){
    				alert("댓글이 등록되었습니다");
    			} else {
    				alert("댓글을 작성해야합니다");
    			}
    		});
	
            $(".comment_d_btn").on("click", function () {
                let result = confirm("댓글을 삭제하시겠습니까?");
                if (result == true) {
                    alert('댓글이 삭제되었습니다');
                } else {
                }
            });
        });
    </script>
</head>

<body>
    <!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>

    <!-- 콘텐츠 영역 -->
    <br>
    <br>
     <div class="contents container col-lg-6 col-md-8 col-sm-10" style="height : 100%;">
        <h3 class="mt-4 mb-3">친환경 활동에 함께하세요:)</h3>
        <div class="label clearfix mt-auto ">
            <div class="hstack gap-2 mt-2">
                <div class="view_content_info">작성자</div>
                <div class="vr"></div>
                <div class="view_content_info">별다방지기</div>
                <div class="vr"></div>
                <div class="view_content_info">날짜</div>
                <div class="vr"></div>
                <div class="view_content_info">2023-01-27 12:32</div>
                <div class="view_content_info ms-auto">조회수</div>
                <div class="vr"></div>
                <div class="view_content_info">3</div>
            </div>
        </div>
        <hr class="mt-4">

        <!-- 본문 -->
        <div class="view_content">
            <img src="img/(1.3.1.1)enviro_pic1.jpg" class="img-fluid">
            <p class="mt-auto">친환경 활동</p>
            <p class="mt-auto">
                “스타벅스는 탄소 발자국을 줄이기 위한 다양한 노력을 기울이고 있습니다.”
                스타벅스는 친환경활동의 일환으로, 18년 11월 종이 빨대와 나무 스틱을 전국 매장으로 확대하면서 빨대 없이 마실 수 있는 아이스컵 뚜껑도 함께 소개하며 제품 포장을 위한 비닐 포장재는
                친환경 소재 포장재로 변경해 1회용 플라스틱 사용 절감을 통한 친환경 활동을 시행하고 있습니다.
                또한, 전국 스타벅스 매장에서 텀블러에 음료를 구매 시, 400원 할인 혹은 에코별을 증정하며 다회용컵 이용 고객에게 혜택을 드리고 있습니다.
            </p>
            <p class="mt-auto">
                “구체적으로 매장별 평균 10W 기준의 LED 전구를 최대 10개까지 소등하여 시간당 100W씩 하루 총 300W 이상을 절전하였고, 전국 매장에서 두 달간 약 1,000만W 이상의 전력
                절약에 도전하는 활동을 실시하였습니다.”
                이와 더불어 스타벅스 코리아는 2010년부터 지구촌 기후변화 방지를 위한 전등끄기 캠페인 ‘Earth Hour’에 동참하고 있습니다. 스타벅스는 영업시간 1시간 동안 최소 조명만을 남겨둔
                채, 전국 매장의 간판 및 창가 조명을 소등하고, 고객을 초청해 환경을 주제로 한 커피세미나를 행하고 있습니다.
                스타벅스 코리아는 이처럼 작은 힘을 모아 큰 힘을 만들고 이를 통해 지구온난화 완화에 기여하고자 합니다.
            </p>
        </div>
        <div class="btns hstack gap-2 mt-2">
            <button type="button" onclick="location.href='./DailyBoardList'" class="btn btn-outline-secondary l_btn">목록</button>
            <button type="button" onclick="location.href='./BoardModify'"
                class="btn btn-outline-secondary m_btn ms-auto">수정</button>
            <button type="button" id="d_btn" class="btn btn-outline-secondary ">삭제</button>
        </div>
        <hr class="mt-3 mb-2">

        <!-- 댓글 -->
        <div class="container-fluid mt-4 w3-border w3-round ws-grey clearfix" style="padding:20px 30px">
            <form action="" method="post">
                <div class="write_comment">
                    <div class="mb-3 mt-3 ">
                        <label for="comment">Comments:</label>
                        <textarea class="form-control mt-3" rows="2" id="comment" name="text"></textarea>
                    </div>
                    <button type="button" class="btn btn-primary float-end btn-sm mb-4 cmt_btn">댓글 등록</button>
                </div>
            </form>

            <!-- 댓글 리스트 -->
            <div class="comment">
                <table class="container-fluid">
                    <tr class="clearfix border-top comment_tr">
                        <td class="coment_re_txt float-start">
                            <div class="mt-2 mb-2">
                                <strong>글쓴이1</strong>(2023.09.19 02:00)
                            </div>
                            <div class="coment_re_txt mb-2">
                                “스타벅스는 탄소 발자국을 줄이기 위한 다양한 노력을 기울이고 있습니다.”
                            </div>
                        </td>
                        <td class="coment_re_btn float-end">
                            <button type="button"
                                class="comment_d_btn btn btn-outline-secondary btn-sm mt-2 mb-2  ">삭제</button>
                        </td>
                    </tr>
                    <tr class="clearfix border-top comment_tr">
                        <td class="coment_re_txt float-start">
                            <div class="mt-2 mb-2">
                                <strong>글쓴이1</strong>(2023.09.19 02:00)
                            </div>
                            <div class="coment_re_txt mb-2">
                                “스타벅스는 탄소 발자국을 줄이기 위한 다양한 노력을 기울이고 있습니다.”
                            </div>
                        </td>
                        <td class="coment_re_btn float-end">
                            <button type="button"
                                class="comment_d_btn btn btn-outline-secondary btn-sm mt-2 mb-2  ">삭제</button>
                        </td>
                    </tr>
                </table>
                <div class="coment_re_view">
                    <button type="button" class="btn btn-sm ">댓글 더보기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 풋터 영역 -->
    <footer></footer>
</body>
</html>