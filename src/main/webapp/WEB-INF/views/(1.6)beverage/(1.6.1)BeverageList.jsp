<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.dto.BeverageTO" %>
<%@ page import="java.util.ArrayList" %>

<%	

	ArrayList<BeverageTO> beverageLists = (ArrayList<BeverageTO>)request.getAttribute("beverageLists");

	StringBuilder sbHtml = new StringBuilder();
	
	for(BeverageTO to : beverageLists){
		String image = to.getImage();
		String name = to.getName();
        String seq = to.getSeq();
		
		sbHtml.append("<div class='col'>");
		sbHtml.append("		<div class='row'>");
		sbHtml.append("			<a href='./BeverageInfo?name=" + name +"&seq="+seq+"'>"  );
		sbHtml.append("				<img src='" + image + "'" + "class='img-thumbnail img-fluid' alt=''></a>" );
		sbHtml.append("				<p class='beverage_name text-center'>" + name + "</p>");
		sbHtml.append("		</div>");
		sbHtml.append("</div>");
	}

    BeverageTO to =(BeverageTO)request.getAttribute( "to" );
    String category = to.getCategory();

%>
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
    <link rel="stylesheet" href="/css/(1.6.1)beverageList.css">
    <title>Beverage</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
            integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

    <script type="text/javascript" src="/js/(1)header.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function() {

                $("#selectBox").on("change",(function(selOpt){
                        var selOpt = $("#selectBox").val();
                        beverageSort(selOpt);
                        console.log( selOpt );
                    })
                );

                let searchReq = "";

                $("#button-addon2").on("click", function(searchReq){
                    var searchReq = $(".form-control").val();
                    BeverageSearch(searchReq);
                });

            });
        const beverageSort = function(selOpt){
            console.log( "beverageSort" );
            $.ajax({
                url: '/BeverageSort',
                type: 'post',
                data: { selOpt: selOpt },
                dataType: 'json',
                success: function(jsonObject) {
                    console.log("성공");
                    $("#content").empty();

                    let html = '';
                    $.each(jsonObject.data, function(index, item){

                        html += '<div class="col">';
                        html += '		<div class="row">';
                        html += '			<a href="./BeverageInfo?name=' + item.name +'&seq='+ item.seq +'">';
                        html += '				<img src="' + item.image + '"' + 'class="img-thumbnail img-fluid" alt=""></a>';
                        html += '				<p class="beverage_name text-center">' + item.name + '</p>';
                        html += '		</div>';
                        html += '</div>';
                    });
                    $("#content").append(html);
                },
                error: function(err){
                    console.log('error : ' + err.status);
                }
            });
        }

        const BeverageSearch = function(searchReq){

            $.ajax({
                url: '/BeverageSearch',
                type: 'post',
                data: { searchReq: searchReq },
                success: function(result){

                    $("#content").empty();

                    let html = '';
                    result.forEach(function(item){
                        html += '<div class="col">';
                        html += '		<div class="row">';
                        html += '			<a href="./BeverageInfo?name=' + item.name +'&seq='+ item.seq +'">';
                        html += '				<img src="' + item.image + '"' + 'class="img-thumbnail img-fluid" alt=""></a>';
                        html += '				<p class="beverage_name text-center">' + item.name + '</p>';
                        html += '		</div>';
                        html += '</div>';

                    });

                    $("#content").append(html);
                },
                error: function(err){
                    alert('error : ' + err.status);
                }
            });
        }

    </script>
</head>

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
<div class="container col-lg-6 col-md-8 col-sm-10 contents">
    <div class="content_header mt-auto "><%=category %></div>
    <hr class="mt-4 mb-4">
    <!-- 검색, 정렬 -->
    <div class="d-flex justify-content-end mt-4 p-2">
        <div class="">
            <select id="selectBox" class="form-select form-select-sm w_search" aria-label=".form-select-sm example">
                <option value="all" selected>전체 선택</option>
                <option value="kcal_desc">칼로리 높은 순</option>
                <option value="kcal_asc">칼로리 낮은 순</option>
                <option value="caffeine_desc">카페인 높은 순</option>
                <option value="caffeine_asc">카페인 낮은 순</option>
                <option value="sat_fat_desc">지방 높은 순</option>
                <option value="sat_fat_asc">지방 낮은 순</option>
                <option value="sugars_desc">당 높은 순</option>
                <option value="sugars_asc">당 낮은 순</option>
            </select>
        </div>

        <div class=" input-group mb-3 w_search_text  ">
            <input type="text" class="form-control" placeholder="search" aria-label="Recipient's username"
                   aria-describedby="button-addon2">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
        </div>

    </div>

    <div class="container">
        <div id="content" class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
            <%=sbHtml.toString() %>
            <!--
            <div class="col">
                <div class="row">
                    <a href="./BeverageInfo"><img
                            src="/img/(1.6.1.1)스타벅스콜드브루.jpg"
                            class="img-thumbnail img-fluid" alt=""></a>
                    <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <a href="./BeverageInfo"><img
                            src="/img/(1.6.1.1)스타벅스콜드브루.jpg"
                            class="img-thumbnail img-fluid" alt=""></a>
                    <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <a href="./BeverageInfo"><img
                            src="/img/(1.6.1.1)스타벅스콜드브루.jpg"
                            class="img-thumbnail img-fluid" alt=""></a>
                    <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <a href="./BeverageInfo"><img
                            src="/img/(1.6.1.1)스타벅스콜드브루.jpg"
                            class="img-thumbnail img-fluid" alt=""></a>
                    <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <a href="./BeverageInfo"><img
                            src="/img/(1.6.1.1)스타벅스콜드브루.jpg"
                            class="img-thumbnail img-fluid" alt=""></a>
                    <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <a href="./BeverageInfo"><img
                            src="/img/(1.6.1.1)스타벅스콜드브루.jpg"
                            class="img-thumbnail img-fluid" alt=""></a>
                    <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <a href="./BeverageInfo"><img
                            src="/img/(1.6.1.1)스타벅스콜드브루.jpg"
                            class="img-thumbnail img-fluid" alt=""></a>
                    <p class="beverage_name text-center">나이트로 바닐라 크림</p>
                </div>
            </div>
            -->
        </div>
    </div>
</div>

<!-- 풋터 영역 -->
<footer></footer>
</body>

</html>