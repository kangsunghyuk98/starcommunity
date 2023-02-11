<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dto.BoardTO"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	int seq = (int)request.getAttribute("seq");
	String boardname = (String)request.getAttribute("boardname");
	String category = (String)request.getAttribute("category");
	int currentPage = (Integer)request.getAttribute("currentPage");
	BoardTO to = (BoardTO)request.getAttribute("to");
	
	String subject = to.getSubject();  
	String content = to.getContent();  
	String wdate = to.getWdate();    
	int hit = to.getHit();         
	String imgname = to.getImgname();  
	String imgPath = "/imgPath/" + imgname;
	
	if( imgname == null  ){
		imgPath = "";	
	} else if( imgname.equals("") ){
		imgPath = "";
	} else {
		
	}
	
	String imgformat = to.getImgformat();
	int recommend = to.getRecommend();
	int memberkey = to.getMemberkey();   
	
	String id = to.getId();        	  
	String nickname = to.getNickname(); 
	
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
        	
        	let queryString = location.search;
            const urlParams = new URLSearchParams(queryString);            		 
            
            let seq = urlParams.get("seq");
            let boardname = urlParams.get("boardname");
            let category = '${category}';

            $.ajax({
                type: 'POST',
                url: '/board/selectlike',
                data: {
                    seq : seq,
                    memberKey : <sec:authentication property="principal.to.memberKey"/>,
                    boardname : boardname
                },
                dataType: 'text',
                success: function (result) {
                    let element = document.getElementById("inner");
                    console.log(element);

                    if (result == 1) {
                        element.innerHTML = "<img id='heart_img' src='/img/icon/like_full.png' width='28px' height='28px'/>";
                    }else{
                        element.innerHTML = "<img id='heart_img' src='/img/icon/like_empty.png' width='28px' height='28px'/>";
                    }
                },
                error: function () {
                    alert('시스템 오류')
                    return;
                }
            });
            
            
            $("#d_btn").on("click", function () {
            	if ( confirm("글을 삭제하시겠습니까?") ) {
            		$.ajax({
	    				url: '/board/BoardDelete',
	    				type: 'get',
	    				data: {
	    					seq: seq,
	    					boardname: boardname,
	    					imgname : '<%=imgname%>'
	    				},
	    				dataType: 'text',
	    				success: function(result){
	    					if (result == 0){
	    						alert("글이 삭제되었습니다");
	    						  location.href='/'+category+"?boardname="+boardname;
	    					} else {
	    						 alert("삭제 실패하였습니다.");
	    					}
	    					
	    				},
	    				error: function(err){
	    					alert('error : ' + err.status);
	    				} 
            		});
            		
                    
                } else {
                	alert("취소되었습니다");
                }
                
            });
            
            let text = document.getElementById("comment").innerText;
    		$(".cmt_btn").on("click", function(){
    			if( text != "" || text != null ){
    			} else {
    				alert("댓글을 작성해야합니다");
    			}
    		});
	
            $(".comment_d_btn").on("click", function () {

                let cseq = $(this).attr('value');

                if(confirm('댓글을 삭제하시겠습니까?')){
                    let queryString = location.search;
                    const urlParams = new URLSearchParams(queryString);

                    let seq = urlParams.get("seq");
                    let currentPage = urlParams.get("currentPage");
                    let category = urlParams.get("category");
                    let boardname = urlParams.get("boardname");

                    $.ajax({
                        type: 'POST',
                        url: '/board/deletecmt',
                        data: {
                            cseq : cseq,
                            boardname : boardname
                        },
                        dataType: 'text',
                        success: function (result) {
                            if (result == 0) {
                                alert('댓글이 삭제되었습니다.');
                                location.href = '/board/BoardView?category='+category+'&boardname='+boardname+'&currentPage='+currentPage+'&seq='+seq+'';
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

            $(".like_btn").on("click",function () {

                let queryString = location.search;
                const urlParams = new URLSearchParams(queryString);

                let seq = urlParams.get("seq");
                let memberKey = $(this).attr("value");

                let currentPage = urlParams.get("currentPage");
                let category = urlParams.get("category");
                let boardname = urlParams.get("boardname");

                $.ajax({
                    type: 'POST',
                    url: '/board/clicklike',
                    data: {
                        seq : seq,
                        memberKey : memberKey,
                        boardname : boardname
                    },
                    dataType: 'text',
                    success: function (result) {
                        if (result == 1) {
                            location.href = '/board/BoardView?category='+category+'&boardname='+boardname+'&currentPage='+currentPage+'&seq='+seq+'';
                        }else{
                            location.href = '/board/BoardView?category='+category+'&boardname='+boardname+'&currentPage='+currentPage+'&seq='+seq+'';
                        }
                    },
                    error: function () {
                        alert('시스템 오류')
                        return;
                    }
                });

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
        <h3 class="mt-4 mb-3"><%=subject %></h3>
        <div class="label clearfix mt-auto ">
            <div class="hstack gap-2 mt-2">
                <div class="view_content_info">작성자</div>
                <div class="vr"></div>
                <div class="view_content_info"><%=nickname %></div>
                <div class="vr"></div>
                <div class="view_content_info">날짜</div>
                <div class="vr"></div>
                <div class="view_content_info"><%=wdate %></div>
                <div class="view_content_info ms-auto">조회수</div>
                <div class="vr"></div>
                <div class="view_content_info"><%=hit %></div>
            </div>
        </div>
        <hr class="mt-4">

        <!-- 본문 -->
        <div class="view_content">
	        <div>
	        	<img src="<%=imgPath %>" class="img-fluid"/>
	        	<br>
	        </div>
	        <div>
	        	<%=content %>
	        </div>
        </div>
        <div class="btns hstack gap-2 mt-2">
        	<sec:authorize access="isAuthenticated()">
	            <button type="button" class="like_btn hstack gap-1" style="border: none; background-color:transparent;" value='<sec:authentication property="principal.to.memberKey"/>'>
	                <div id="inner"></div>
	                <div> 좋아요 ${to.recommend}</div>
	            </button>
        	</sec:authorize>
			<button type="button" onclick="location.href='/${category}?boardname=${boardname}&currentPage=${currentPage}'" class="btn btn-sm btn-outline-secondary l_btn ms-auto">목록</button>           
			<sec:authorize var="" access="isAuthenticated()">
				<sec:authentication property="principal" var="principal"/>
				<c:if test="${principal.to.memberKey eq to.memberkey}">
					 <button type="button" onclick="location.href='/board/BoardModify?category=${category}&boardname=${boardname}&currentPage=${currentPage}&seq=${seq}'"
	                class="btn btn-sm btn-outline-secondary m_btn">수정</button>
					<button type="button" id="d_btn" class="btn btn-sm btn-outline-secondary ">삭제</button>
            	</c:if>
			</sec:authorize>
        </div>
        <hr class="mt-3 mb-2">

        <!-- 댓글 -->
        <div class="container-fluid mt-4 w3-border w3-round ws-grey clearfix" style="padding:20px 30px">
			<sec:authorize access="isAnonymous()">
		       	<div >
		           	<p class="cmt_login_message mt-4 mb-5" >로그인 후 댓글 서비스를 이용하실 수 있습니다</p>
		           	<label class="mb-3 " for="comment" style="font-weight: bold;">Comments</label>
	           </div>
       		</sec:authorize>
       	
            <!-- 댓글작성폼 -->
            <sec:authorize access="isAuthenticated()">
                <form action="/board/writecmt" method="post">
                    <input type="hidden" name="memberKey" value="<sec:authentication property="principal.to.memberKey" />" />
                    <input type="hidden" name="seq" value="<%= seq %>" />
                    <input type="hidden" name="boardname" value="<%= boardname %>" />
                    <input type="hidden" name="currentPage" value="<%= currentPage %>" />
                    <input type="hidden" name="category" value="<%= category %>" />

                    <div class="write_comment">
                        <div class="mb-3 mt-3 ">
                            <label for="comment">Comments:</label>
                            <textarea class="form-control mt-3" rows="2" id="comment" name="comment"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary float-end btn-sm mb-4 cmt_btn">댓글 등록</button>
                    </div>
                </form>
            </sec:authorize>

            <!-- 댓글 리스트 -->
            <div class="comment">
                <table class="container-fluid">


                    <!-- 댓글이 들어가는 영역 -->

                    <c:forEach var="bto" items="${allCmtList}">

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
                                        <button type="button" value="${bto.cseq}" class="comment_d_btn btn btn-outline-secondary btn-sm mt-2 mb-2">삭제</button>
                                    </td>
                                </c:if>

                            </sec:authorize>

                        </tr>

                    </c:forEach>

                </table>
                <div class="coment_re_view">
                    <button type="button" class="btn btn-sm ">댓글 더보기</button>
                </div>
            </div>
        </div>
    </div>

<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
