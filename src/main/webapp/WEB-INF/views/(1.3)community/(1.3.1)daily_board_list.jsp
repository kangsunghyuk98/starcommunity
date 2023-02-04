<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dto.BoardTO"%>
<%@ page import="java.util.ArrayList"%>    
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
    
    <script type="text/javascript">
    		$(document).ready(function() {   			
 
    			let searchReq = "";
    			
    			$("#button-addon2").on("click", function(searchReq){
    				searchReq = $(".form-control").val();
    				searchOption = $("#select_box option:selected").val();
    				searchBoardList(searchReq); 
    			});
    		});
    		
    		const searchBoardList = function(searchReq){
 
	    			$.ajax({
	    				url: '/searchBoardList',
	    				type: 'post',
	    				data: { searchReq: searchReq,
	    					 searchOption: searchOption
	    					},
	    				dataType: 'json',
	    				success: function(jsonData){
	    					
	    					$("#tbody").empty();	
	    					
	    					let html = '';
	    					$.each(jsonData.data, function(index, item){
	    						html += '<tr>';
	    						html += '    <td>'+ item.dlifeseq +'</td>';
	    						html += '    <td>'+ item.nickname +'</td>';
	    						html += '    <td><a class="view_btn" href="./BoardView?'+ item.dlifeseq +'">'+ item.subject+'</a></td>';
	    						html += '    <td>'+ item.wdate +'</td>';
	    						html += '    <td>'+ item.hit +'</td>';
	    						html += '    <td>'+ item.recommend +'</td>';
	    						html += '	 <td>';
	    						if( item.imgname != "" ){
	    							html += '<img src="/img/icon/icon_file.gif">';	
	    						} else if( item.imgname != null) {
	    							html += '<img src="/img/icon/icon_file.gif">';
	    						} else {
	    						}
	    						html += '	 </td>';
	    						html += '</tr>';	
	    					});
	    					
	    					$("#tbody").append(html);
	    				},
	    				error: function(err){
	    					alert('error : ' + err.status);
	    				} 
				});
    		}
    		
    		/* const showBoardList = function(){
	    			$.ajax({
	    				url: '/showBoardList',
	    				type: 'get',
	    				dataType: 'json',
	    				success: function(jsonData){
	    					console.log("showBoardList")
	    					console.log(jsonData);
	    					
	    					$("#tbody").empty();	
	    					
	    					let html = '';
	    					$.each(jsonData.data, function(index, item){
	    						html += '<tr>';
	    						html += '    <td>seq'+ item.seq +'</td>';
	    						html += '    <td><a class="view_btn" href="./BoardView">'+ item.subject+'</a></td>';
	    						html += '    <td>2xxx.xx.xx</td>';
	    						html += '    <td>xx</td>';
	    						html += '    <td>xx</td>';
	    						html += '    <td>i</td>';
	    						html += '</tr>';	
	    					});
	    					
	    					$("#tbody").append(html);
	    				},
	    				error: function(err){
	    					alert('error : ' + err.status);
	    				} 
				});
    		} */
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
                    <li class="page-item"><a class="page-link" href="#">previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">next</a></li>
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