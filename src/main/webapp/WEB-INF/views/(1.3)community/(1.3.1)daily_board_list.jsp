<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dto.BoardTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<BoardTO> boardLists = (ArrayList<BoardTO>)request.getAttribute("boardLists");

	StringBuilder sbHtml = new StringBuilder(); 	
	
	for(BoardTO to : boardLists){
		int dlifeseq = to.getDlifeseq();
		String subject = to.getSubject();
		String content = to.getContent();
		String wdate = to.getWdate();
		int hit = to.getHit();
		String imgname = to.getImgname();
		String imgformat = to.getImgformat();
		int recommend = to.getRecommend();
		int memberkey = to.getMemberkey();
		String nickname = to.getNickname();
		
		sbHtml.append("<tr>");
		sbHtml.append("    <td>"+ dlifeseq +"</td>");
		sbHtml.append("    <td>"+ nickname +"</td>");
		sbHtml.append("    <td><a class='view_btn' href='/BoardView?Dlifeseq="+ dlifeseq +"'>"+ subject +"</a></td>");
		sbHtml.append("    <td>"+ wdate +"</td>");
		sbHtml.append("    <td>"+ hit +"</td>");
		sbHtml.append("    <td>"+ recommend +"</td>");
		sbHtml.append("    <td>");
		if( imgname != "" ){
			sbHtml.append("<img src='/img/icon/icon_file.gif'>");	
		} else if( imgname != null) {
			sbHtml.append("<img src='/img/icon/icon_file.gif'>");
		} else {
		}
		sbHtml.append("    </td>");
		sbHtml.append("</tr>");
	}

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 폰트는 따로 css파일을 만들었습니다 -->
    <link rel="stylesheet" href="/font/font.css">
    <link rel="stylesheet" href="/css/(1)header.css">
    <link rel="stylesheet" href="/css/(1.3.1)dailyList.css">
    
    <title>일상게시판</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
       function fn_paging(currentPage) {
           location.href = '/DailyBoardList?currentPage='+currentPage;
       }
	</script>
	
    <script type="text/javascript">
    		$(document).ready(function() {   			
 
    			let searchReq = "";
    			
    			$("#button-addon2").on("click", function(searchReq){
    				searchReq = $(".form-control").val();
    				searchOption = $("#select_box option:selected").val();
    				
    				let currentPage = 1;
    				searchBoardList(searchReq, searchOption, currentPage); 
    			});
    			
 
    		});
    		
    		
    		const searchBoardList = function(searchReq, searchOption, currentPage){
 
	    			$.ajax({
	    				url: '/searchBoardList?currentPage='+currentPage,
	    				type: 'get',
	    				data: { searchReq: searchReq,
	    					 searchOption: searchOption,
	    					 currentPage: currentPage
	    					},
	    				dataType: 'json',
	    				success: function(jsonData){
	    					
	    					$("#tbody").empty();	
	    					
	    					let html = '';
	    					let index = (jsonData.data.length) - 1;
	    					let arr = jsonData.data;
	    					
	    					console.log("index : " + index);
	    					for(let i=0; i <= index; i++){
	    						
	    						html += '<tr>';
	    						html += '    <td>'+ arr[i].dlifeseq +'</td>';
	    						html += '    <td>'+ arr[i].nickname +'</td>';
	    						html += '    <td><a class="view_btn" href="./BoardView?'+ arr[i].dlifeseq +'">'+ arr[i].subject+'</a></td>';
	    						html += '    <td>'+ arr[i].wdate +'</td>';
	    						html += '    <td>'+ arr[i].hit +'</td>';
	    						html += '    <td>'+ arr[i].recommend +'</td>';
	    						html += '	 <td>';
	    						if( arr[i].imgname != "" ){
	    							html += '<img src="/img/icon/icon_file.gif">';	
	    						} else if( arr[i].imgname != null) {
	    							html += '<img src="/img/icon/icon_file.gif">';
	    						} else {
	    						}
	    						html += '	 </td>';
	    						html += '</tr>';
	    						
	    					}
	    					
	    					
	    					$("#tbody").append(html);
	    					
	    					
	    					let pagination = jsonData.pagination;
	    					$(".pagination").empty();
	    					
	    					let htmlPg = '';
	    					
	    					if( pagination.curRange != 1){
	    						htmlPg += '<li class="page-item"><a href="/searchBoardList?currentPage=1" class="page-link">처음</a></li>';	
	    					}
	    					if( pagination.curPage != 1 ){
    							htmlPg += '<li class="page-item"><a href="/searchBoardList?currentPage='+pagination.prevPage+'" class="page-link">이전</a></li>';
	    					}
	    					for(let i=pagination.startPage; i<=pagination.endPage; i++){
	    						if ( i = pagination.curPage ) {
	    							htmlPg += '<span style="font-weight: bold;"><li class="page-item">'+i+'</li></span>';
	    						} else {
	    							htmlPg += '<li class="page-item"><a href="/searchBoardList?currentPage='+i+'" class="page-link">'+i+'</a></li>';
	    						}
	    					}
	    					if( pagination.curPage != pagination.pageCnt && pagination.pageCnt > 0 ){
	    						htmlPg += '<li class="page-item"><a href="/searchBoardList?currentPage='+pagination.nextPage+'" class="page-link">다음</a></li>';	
	    					}
	    					if( pagination.curRange != pagination.rangeCnt && pagination.rangeCnt > 0 ) {
	    						htmlPg += '<li class="page-item"><a href="/searchBoardList?currentPage='+pagination.pageCnt+'" class="page-link">끝</a></li>';
	    					}
	    					
	    					$(".pagination").append(htmlPg);
	    					
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
	<div class="content container col-lg-6 col-md-8 col-sm-10">
        <div class="content_header">일상 게시판</div>
        <div>
            <select class="form-select form-select-sm w_search" id="select_box" aria-label=".form-select-sm example">
                <option value="subject_content">제목 + 내용</option>
                <option value="nickname">닉네임</option>
            </select>
            <div class="input-group mb-3 w_search_text">
                <input type="text" class="form-control" placeholder="search" aria-label="Recipient's username" aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="">검색</button>
            </div>
        </div>
        <hr>
        <div class="table-responsive">
	        <table class="table table-hover table_margin">
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>닉네임</th>
	                    <th>제목</th>
	                    <th>작성일자</th>
	                    <th>조회수</th>
	                    <th>추천수</th>
	                    <th>img</th>
	                </tr>
	            </thead>
	            
	            <!-- 글 목록 -->
	            <tbody id="tbody">
	                <%=sbHtml.toString()%> 
	            </tbody>
	        </table>
        </dsiv>
    <div>
        <button id="w_btn" type="button" class="btn btn-outline-secondary btn-lg px-4" onclick="location.href='./BoardWrite'">글쓰기</button>
    </div>
    
    <div class="container-sm">
        <div class="container row" style="float: none; margin: 100 auto;">
            <div class="col-md-3" style="float: none; margin: 0 auto;">
                <ul class="pagination justify-content-center">
                    <c:if test="${pagination.curRange ne 1 }">
                        <li class="page-item"><a href="#" class="page-link" onClick="fn_paging(1)">처음</a></li>
                    </c:if>
      
                    <c:if test="${pagination.curPage ne 1}">
                        <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${pagination.prevPage }')">이전</a></li>
                    </c:if>
                    
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq pagination.curPage}">
                                <span style="font-weight: bold;"><li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum}</a></li></span>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <li class="page-item"><a href="#" onClick="fn_paging('${pagination.nextPage }')" class="page-link">다음</a></li>
                    </c:if>

                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <li class="page-item"><a href="#" onClick="fn_paging('${pagination.pageCnt }')" class="page-link">끝</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</div>

<!-- 풋터 영역 -->
<footer></footer>

</body>
</html>