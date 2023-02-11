<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.dto.BeverageTO"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.BeverageCmtTO" %>
<%
	BeverageTO to = (BeverageTO)request.getAttribute( "to" );

    String seq = to.getSeq();
	String category = to.getCategory();
	String name = to.getName();
	String engName = to.getEngName();
	String image = to.getImage();
	String productInfo = to.getProductInfo();
	String kcal = to.getKcal();
	String sat_fat = to.getSat_fat();
	String protein = to.getProtein();
	String sodium = to.getSodium();
	String sugars = to.getSugars();
	String caffeine = to.getCaffeine();
	String allergyCause = to.getAllergyCause();
	String drinkInfo = to.getDrinkInfo();

    List<BeverageCmtTO> allCmtList = (List<BeverageCmtTO>) request.getAttribute("allCmtList");
    
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
            
    		$(".cmt_btn").on("click", function(){
    			let text = document.getElementById("comment").innerText;
    			if( text != "" || text != null ){
    				alert("코멘트가 등록되었습니다");
    			} else {
    				alert("코멘트를 작성해야합니다");
    			}
    		});

            $('.comment_d_btn').click(function(){

                if(confirm('댓글을 삭제하시겠습니까?')){
                    let queryString = location.search;
                    const urlParams = new URLSearchParams(queryString);

                    let bevcseq = $(this).attr('value');
                    let seq = urlParams.get("seq"); 

                    $.ajax({
                        type: 'POST',
                        url: '/Beverage_cmt_delete',
                        data: 'bevcseq=' + bevcseq,
                        dataType: 'text',
                        success: function (result) {
                            if (result == 0) {
                                alert('댓글이 삭제되었습니다.');
                                location.href = '/BeverageInfo?seq='+seq;
                            }else{
                                alert('삭제 실패하였습니다. (유효하지 않은 memberkey)');
                            }
                        },
                        error: function () {
                            alert('삭제 실패')
                            return;
                        }
                    });
                } else {
                    return false;
                }
            });
            
            let seq = '<%=seq%>';
        	let addNum = 3;
        	
            $('.show_cmt_btn').on('click', function(){

            	addCmt(seq, addNum);
            	addNum = addNum + 3;
            	//console.log(addNum);
            	
            	return addNum; 
            });
            
            $('.close_cmt_btn').on('click', function(){
            	$('#cmt_table').empty();
            	addNum = 3
            	
            	return addNum;
            });
  		});
    	
    	function addCmt(seq, addNum){
    	    $.ajax({
    	        type: 'POST',
    	        url: '/Beverage_add_cmt',
    	        data: {
    	            seq: seq,
    	            addNum: addNum
    	        },
    	        success: function (result) {
    	        	
   	            	// console.log(result);
    	            let html = '';

    	            $.each(result, function (index, item) {

    	            	let memberKey = 0;
        	        	let KeyResult = false;
        	        
        	        	<sec:authorize access="isAuthenticated()">
        	        	<sec:authentication property="principal" var="principal"/>;
        	    	    	memberKey = ${principal.to.memberKey};
        	    	    	let memberKeyStr = memberKey.toString();
        	    	    	KeyResult = (memberKeyStr == item.memberKey);
        	        	</sec:authorize>
    	            	
    	            	 html += '<tr class="clearfix border-top comment_tr">';
   	                     html += '    <td class="coment_re_txt float-start">';
   	                     html += '        <div class="mt-2 mb-2">';
   	                     html += '            <strong>'+ item.nickname +'</strong>('+ item.cdate +')';
    	                 html += '        </div>';
   	                     html += '        <div class="coment_re_txt mb-2">';
   	                     html += '            '+ item.comment +'';
   	                     html += '        </div>';
   	                     html += '    </td>';
   	                     
   	                     //console.log("memberKeyStr : " + memberKeyStr + " " + typeof memberKeyStr);
	                     //console.log("item.memberkey : " + item.memberKey + " " + typeof item.memberKey);
	                     
	                   	 //console.log(KeyResult);
	                   	 // if( memberKeyStr == item.memberKey ){ => 왜 이 조건문은 false로 나오는가?ㄴ
   	                     if( KeyResult ){
   	                    	console.log("true ");
   	                    	html += '            <td class="coment_re_btn float-end">';
       	                    html += '               <button type="button" value="'+ item.bevcseq +'" class="comment_d_btn btn btn-outline-secondary btn-sm mt-2 mb-2">삭제</button>';
       	                    html += '            </td>';
       	                    
   	                     } else {
   	                    	console.log("false ");
   	                     }
    	                 html += '</tr>';
    	            });
    	            $("#cmt_table").append(html);
    	        },
    	        error: function () {
    	            alert('[error] 댓글추가 실패. ' + err.status)
    	            return;
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
    <div class="container col-lg-6 col-md-8 col-sm-10">
        <!-- 음료 정보 -->
        <div class="row Beverage_info  ">
            <div class="content_header mt-auto mb-4 "><%=category %></div>
            <div class="col-8 col-md-4 Beverage_img mt-2 " style="float: left;">
                <img src="<%=image %>" class="img-fluid" alt="">
            </div>
            <div class="col-sm-4 col-md-8 Beverage_info_table " style="float: right;">
                <div class=" mt-auto mb-4 Beverage_name "><%=name %>
                    <div class="Beverage_E_name"><%=engName %></div>
                    <hr style="border:0; height:3px; background: #000; ">
                </div>
                <table class="table">
                    <tr scope="row">
                        <th colspan="2" style="font-weight: bold; font-size: medium;">제품 영양 정보</th>
                        <th colspan="2" style="font-weight: bold; font-size: medium;" class="txt_align_r"><%=productInfo %></th>
                    </tr>
                    <tr scope="row">
                        <td scope="col">1회 제공량 (kcal)</td>
                        <td scope="col" class="kcal txt_align_r"><%=kcal %></td>
                        <td>나트륨 (mg)</td>
                        <td class="sodium txt_align_r"><%=sodium %></td>                        
                    </tr>
                    <tr scope="row">
                    	<td scope="col">포화지방 (g)</td>
                        <td scope="col" class="sat_FAT txt_align_r"><%=sat_fat %></td>
                        <td>당류 (g)</td>
                        <td class="sugars txt_align_r"><%=sugars %></td>                       
                    </tr>
                    <tr scope="row">
                   		<td>단백질 (g)</td>
                        <td class="protein txt_align_r"><%=protein %></td>
                        <td>카페인 (mg)</td>
                        <td class="caffeine last txt_align_r"><%=caffeine %></td>                        
                    </tr>                   
                </table>
                <div class="product_factor">
                    <p style="text-align: right; font-size: small;"><%=allergyCause %></p>
                </div>
            </div>
                <div class="Beverage_txt"><%=drinkInfo %></div>
                <div>
                    <button type="button" onclick="location.href='./BeverageList'"
                        class=" btn btn-outline-secondary l_btn style float-end" >목록</button>
                </div>
        </div>
        <hr class="mt-3 mb-5">
        <!-- 댓글 -->
        <div class="container-fluid mt-4 w3-border w3-round ws-grey clearfix" style="padding:20px 30px">
			<sec:authorize access="isAnonymous()">
	        	<div >
	            	<p class="cmt_login_message mt-4 mb-5" >로그인 후 댓글 서비스를 이용하실 수 있습니다</p>
	            	<label class="mb-3 " for="comment" style="font-weight: bold;">Comments</label>
	            </div>
        	</sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <form action="/Beverage_cmtok" method="post">
                <input type="hidden" name="memberKey" value="<sec:authentication property="principal.to.memberKey" />" />
                <input type="hidden" name="seq" value="<%= seq %>" />

                <div class="write_comment">
                    <div class="mb-3 mt-3 ">
                        <label for="comment">Comments:</label>
                        <textarea class="form-control mt-3" rows="2" id="comment" name="comment"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary float-end btn-sm mb-4 cmt_btn">코멘트 등록</button>
                </div>
            </form>
            </sec:authorize>

            <!-- 댓글 리스트 -->
            <div class="comment">
                <table class="container-fluid" >
                    <!-- 댓글이 들어가는 영역 -->
                    <c:forEach var="bto" items="${allCmtList}" begin="0" end="2">
   					<c:out value="${i}"/>
                        <tr class="clearfix border-top comment_tr">
                            <td class="coment_re_txt float-start">
                                <div class="mt-2 mb-2">
                                    <strong>${bto.nickname}</strong>(${bto.cdate})
                                </div>
                                <div class="coment_re_txt mb-2">
                                    ${bto.comment}
                                </div>
                            </td>

                            <sec:authorize access="isAuthenticated()">
                                <sec:authentication property="principal" var="principal"/>
                                <c:if test="${principal.to.memberKey eq bto.memberKey}">
                                    <td class="coment_re_btn float-end">
                                        <button type="button" value="${bto.bevcseq}" class="comment_d_btn btn btn-outline-secondary btn-sm mt-2 mb-2">삭제</button>
                                    </td>
                                </c:if>
                            </sec:authorize>
                        </tr>
                    </c:forEach>
                </table>
                <table class="container-fluid" id="cmt_table">
                </table>
                <div class="coment_re_view">
                    <button type="button" class="btn btn-sm show_cmt_btn">코멘트 더보기</button>
                    <button type="button" class="btn btn-sm close_cmt_btn">코멘트 접기</button>
                </div>
            </div>
        </div>
    </div>
<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
