<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dto.BoardTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	ArrayList<BoardTO> boardLists = (ArrayList<BoardTO>)request.getAttribute("boardLists");

	StringBuilder sbHtml = new StringBuilder(); 	
	String boardname = (String)request.getAttribute("boardname");
	String category = (String)request.getAttribute("category");
	int currentPage = (int)request.getAttribute("currentPage");
	for(BoardTO to : boardLists){
		int seq = to.getSeq();
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
		sbHtml.append("    <td>"+ seq +"</td>");
		sbHtml.append("    <td><a class='view_btn' href='/BoardView?category="+category+"&boardname="+boardname+"&currentPage="+currentPage+"&seq="+ seq +"'>"+ subject +"</a></td>");
		sbHtml.append("    <td>"+ nickname +"</td>");
		sbHtml.append("    <td>"+ wdate +"</td>");
		sbHtml.append("    <td>"+ hit +"</td>");
		sbHtml.append("    <td>"+ recommend +"</td>");
		sbHtml.append("    <td>");
		
		if( !imgname.equals("") ){
			sbHtml.append("<img src='/img/icon/icon_file.gif'>");	
		} else {
			sbHtml.append("<img />");
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
    <link rel="stylesheet" href="/css/(1)header.css">
    <link rel="stylesheet" href="/css/(1)contents.css">
    <link rel="stylesheet" href="/font/font.css">
    <link rel="stylesheet" href="/css/(1.3.1)dailyList.css">
    
    <title>매장방문 후기게시판</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
    	let boardname = "${boardname}";
    	let category = '${category}';
    	function fn_paging(category, boardname, currentPage) {
           location.href = '/'+category+'?boardname='+boardname+'&currentPage='+currentPage;
    	}
	</script>
	
    <script type="text/javascript">
    		$(document).ready(function() {   			
    			let searchReq = "";
    			let searchOption = "";
    			let url = "";
    			//검색 버튼 클릭
    			$("#button-addon2").on("click", function(){
    				
    				searchReq = $(".form-control").val();
    				searchOption = $("#select_box option:selected").val();
    				let currentPage = 1;
    				let boardname = '${boardname}';
    				let category = '${category}';

    				url = "/searchBoardList?boardname="+boardname+"&currentPage="+currentPage+"&searchReq="+searchReq+"&searchOption="+searchOption ;
    				searchBoardList(boardname,searchReq, searchOption, currentPage, url, category);
    				
    			});
    			
    			//검색 후 페이징 버튼 클릭
    			$(document).on('click', '.ajaxCall', function(){
    				
    				searchReq = $(".form-control").val();
    				searchOption = $("#select_box option:selected").val();
    				let currentPage = '${currentPage};'
    				let boardname = '${boardname}';
    				let category = '${category}';
    				
    				url = $(this).attr("url");
    				searchBoardList(boardname, searchReq, searchOption, currentPage, url, category); 
    				
    			});
    		});
    		
    		const searchBoardList = function(boardname, searchReq, searchOption, currentPage, url, category){
	    			$.ajax({
	    				url: url,
	    				type: 'get',
	    				dataType: 'json',
	    				success: function(jsonData){
	    					//검색 후 게시판 글 리스트
	    					$("#tbody").empty();	
	    					
	    					let html = '';
	    					let index = (jsonData.data.length) - 1;
	    					let arr = jsonData.data;
	    					
	    					for(let i=0; i <= index; i++){
	    						
	    						html += '<tr>';
	    						html += '    <td>'+ arr[i].seq +'</td>';
	    						html += '    <td><a class="view_btn" href="/BoardView?category='+category+'&boardname='+boardname+'&currentPage='+currentPage+'&seq='+ arr[i].seq +'">'+ arr[i].subject+'</a></td>';
	    						html += '    <td>'+ arr[i].nickname +'</td>';
	    						html += '    <td>'+ arr[i].wdate +'</td>';
	    						html += '    <td>'+ arr[i].hit +'</td>';
	    						html += '    <td>'+ arr[i].recommend +'</td>';
	    						html += '	 <td>';
	    						
	    						if( arr[i].imgname != "" ){
	    							html += '<img src="/img/icon/icon_file.gif">';	
	    						} else {	
	    							html += '<img/>';
	    						}
	    						
	    						html += '	 </td>';
	    						html += '</tr>';
	    					}
	    					$("#tbody").append(html);
	    					
	    					//검색 후 페이징
	    					let pagination = jsonData.pagination;
	    					
	    					$(".pagination").empty();
	    					
	    					let htmlPg = '';	    					
	    					if( pagination.curRange != 1){
	    						htmlPg += '<li class="page-item"><button class="page-link ajaxCall" url="/searchBoardList?boardname='+boardname+'&currentPage=1&searchReq='+searchReq+'&searchOption='+searchOption+'">처음</button></li>';
	    					}
	    					if( pagination.curPage != 1 ){
    							htmlPg += '<li class="page-item"><button class="page-link ajaxCall" url="/searchBoardList?boardname='+boardname+'&currentPage='+pagination.prevPage+'&searchReq='+searchReq+'&searchOption='+searchOption+'">이전</button></li>';
	    					}
	    					for(let i=pagination.startPage; i<=pagination.endPage; i++){
	    						if ( i == pagination.curPage ) {
	    							htmlPg += '<span style="font-weight: bold;"><li class="page-item"><a class="page-link">'+i+'</a></li></span>';
	    							
	    						} else {
	    							htmlPg += '<li class="page-item"><button id="'+i+'" class="page-link ajaxCall" url="/searchBoardList?boardname='+boardname+'&currentPage='+i+'&searchReq='+searchReq+'&searchOption='+searchOption+'">'+i+'</button></li>';
	    						}
	    					}
	    					if( pagination.curPage != pagination.pageCnt && pagination.pageCnt > 0 ){
	    						htmlPg += '<li class="page-item"><button class="page-link ajaxCall" url="/searchBoardList?boardname='+boardname+'&currentPage='+pagination.nextPage+'&searchReq='+searchReq+'&searchOption='+searchOption+'">다음</button></li>';
	    					}
	    					if( pagination.curRange != pagination.rangeCnt && pagination.rangeCnt > 0 ) {
	    						htmlPg += '<li class="page-item"><a class="page-link ajaxCall" url="/searchBoardList?boardname='+boardname+'&currentPage='+pagination.pageCnt+'&searchReq='+searchReq+'&searchOption='+searchOption+'">끝</a></li>';
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
        <div class="content_header">매장방문 후기게시판</div>
        <div>
            <select class="form-select form-select-sm w_search" id="select_box" aria-label=".form-select-sm example">
                <option value="subject_content">제목+내용</option>
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
	                    <th>제목</th>
	                    <th>닉네임</th>
	                    <th>작성일자</th>
	                    <th>조회수</th>
	                    <th>추천수</th>
	                    <th>img</th>
	                </tr>
	            </thead>
	            <tbody id="tbody">
	                 <%=sbHtml.toString()%> 
	            </tbody>
	        </table>
		</div>
		
		<sec:authorize access="isAuthenticated()">
		       <div>
		           <button id="w_btn" type="button" class="btn btn-outline-secondary btn-lg px-4" onclick="location.href='/BoardWrite'">글쓰기</button>
		       </div>
		</sec:authorize>
    
    <div class="container-sm">
        <div class="container row" style="float: none; margin: 100 auto;">
            <div class="col-md-3" style="float: none; margin: 0 auto;">
                <ul class="pagination justify-content-center">
                	
                    <c:if test="${pagination.curRange ne 1 }">
                        <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${category}', '${boardname}', 1)">처음</a></li>
                    </c:if>
      
                    <c:if test="${pagination.curPage ne 1}">
                        <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${category}', '${boardname}', '${pagination.prevPage }')">이전</a></li>
                    </c:if>
                    
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq pagination.curPage}">
                                <span style="font-weight: bold;"><li class="page-item"><a class="page-link">${pageNum}</a></li></span>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="#" class="page-link" onClick="fn_paging('${category}', '${boardname}', '${pageNum }')">${pageNum}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <li class="page-item"><a href="#" onClick="fn_paging('${category}', ${boardname}, '${pagination.nextPage }')" class="page-link">다음</a></li>
                    </c:if>

                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <li class="page-item"><a href="#" onClick="fn_paging('${category}', ${boardname}, '${pagination.pageCnt }')" class="page-link">끝</a></li>
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