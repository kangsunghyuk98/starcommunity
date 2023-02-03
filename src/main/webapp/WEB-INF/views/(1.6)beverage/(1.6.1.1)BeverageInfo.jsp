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
    <link rel="stylesheet" href="/css/(1.6.1.1)beverageInfo.css">
    <title>Beverage</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
    integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="/js/(1)header.js"></script>
    
    <script>
    	$(document).ready(function () {
    		let text = "";
    		$(".cmt_btn").on("click", function(){
    			if( text != "" || null ){
    				alert("코멘트가 등록되었습니다");
    			} else {
    				alert("코멘트를 작성해야합니다");
    			}
    		});
    		
    		$(".comment_d_btn").on("click", function () {
                let result = confirm("코멘트를 삭제하시겠습니까?");
                if (result == true) {
                    alert('코멘트가 삭제되었습니다');
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
    <div class="container col-lg-6 col-md-8 col-sm-10">
        <!-- 음료 정보 -->
        <div class="row Beverage_info  ">
            <div class="content_header mt-auto mb-4 ">콜드 브루</div>
            <div class="col-8 col-md-4 Beverage_img mt-2 " style="float: left;">
                <img src="/img/(1.6.1.1)스타벅스콜드브루.jpg" class="img-fluid" alt="">
            </div>
            <div class="col-sm-4 col-md-8 Beverage_info_table " style="float: right;">
                <div class=" mt-auto mb-4 Beverage_name ">돌체 콜드 브루
                    <div class="Beverage_E_name">Dolce Cold Brew</div>
                    <hr style="border:0; height:3px; background: #000; ">
                </div>
                <table class="table">
                    <tr scope="row">
                        <th colspan="2" style="font-weight: bold; font-size: medium;">제품 영양 정보</td>
                        <th colspan="2" style="font-weight: bold; font-size: medium;" class="txt_align_r">Tall(톨) /
                            355ml (12 fl oz)</td>
                    </tr>
                    <tr scope="row">
                        <td scope="col">1회 제공량 (kcal)</td>
                        <td scope="col" class="kcal txt_align_r">265</td>
                        <td scope="col">포화지방 (g)</td>
                        <td scope="col" class="sat_FAT txt_align_r">9</td>
                    </tr>
                    <tr scope="row">
                        <td>단백질 (g)</td>
                        <td class="protein txt_align_r">8</td>
                        <td>지방 (g)</td>
                        <td class="fat txt_align_r">12</td>
                    </tr>
                    <tr scope="row">
                        <td>트랜스지방 (kcal)</td>
                        <td class="trans_FAT txt_align_r">0</td>
                        <td>나트륨 (mg)</td>
                        <td class="sodium txt_align_r">130</td>
                    </tr>
                    <tr>
                        <td>당류 (g)</td>
                        <td class="sugars txt_align_r">29</td>
                        <td>카페인 (mg)</td>
                        <td class="caffeine last txt_align_r">155</td>
                    </tr>
                </table>
                <div class="product_factor">
                    <p style="text-align: right; font-size: small;">알레르기 유발요인 : 우유</p>
                </div>
            </div>
                <div class="Beverage_txt">무더운 여름철, 동남아 휴가지에서 즐기는 커피를 떠오르게 하는 스타벅스 음료의 베스트조합인 돌체 콜드 브루를 만나보세요! 무더운 여름철, 동남아 휴가지에서 즐기는 커피를 떠오르게 하는 스타벅스 음료의 베스트조합인 돌체 콜드 브루를 만나보세요!</div>
                <div>
                    <button type="button" onclick="location.href='./BeverageList'"
                        class=" btn btn-outline-secondary l_btn style float-end" >목록</button>
                </div>
        </div>
        <hr class="mt-3 mb-5">

        <!-- 댓글 -->
        <div class="container-fluid mt-4 w3-border w3-round ws-grey clearfix" style="padding:20px 30px">
            <form action="" method="post">
                <div class="write_comment">
                    <div class="mb-3 mt-3 ">
                        <label for="comment">Comments:</label>
                        <textarea class="form-control mt-3" rows="2" id="comment" name="text"></textarea>
                    </div>
                    <button type="button" class="btn btn-primary float-end btn-sm mb-4 cmt_btn">코멘트 등록</button>
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
                    <button type="button" class="btn btn-sm ">코멘트 더보기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 풋터 영역 -->
    <footer></footer>
</body>
</html>