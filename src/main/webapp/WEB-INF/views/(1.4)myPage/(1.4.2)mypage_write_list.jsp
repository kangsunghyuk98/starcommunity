<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.BoardTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    List<BoardTO> allMyBoardLists = (List<BoardTO>) request.getAttribute("allMyBoardLists");
    StringBuilder sb = new StringBuilder();

    for (BoardTO to:allMyBoardLists) {
        if (to.getSeq() == 0) {
            sb.append("    <tr>");
            sb.append("<td colspan='4' style='text-align: center;'>게시물의 끝입니다.</td>");
            sb.append("    </tr>");
        } else {

            if (to.getBoardname().equals("dlife_board")) {
                sb.append("    <tr>");
                sb.append("    <td>"+to.getSeq()+"</td>");
                sb.append("    <td><a class='view_btn' href='/BoardView?category=DailyBoardList" +
                        "&boardname="+to.getBoardname()+"&currentPage=1&seq="+to.getSeq()+"'>"+to.getSubject()+"</a></td>");
                sb.append("    <td>"+to.getWdate()+"</td>");
                sb.append("    <td>일상게시판</td>");
            } else if (to.getBoardname().equals("md_board")) {
                sb.append("    <tr>");
                sb.append("    <td>"+to.getSeq()+"</td>");
                sb.append("    <td><a class='view_btn' href='/BoardView?category=MDBoardList" +
                        "&boardname="+to.getBoardname()+"&currentPage=1&seq="+to.getSeq()+"'>"+to.getSubject()+"</a></td>");
                sb.append("    <td>"+to.getWdate()+"</td>");
                sb.append("    <td>MD게시판</td>");
            } else if (to.getBoardname().equals("review_board")) {
                sb.append("    <tr>");
                sb.append("    <td>"+to.getSeq()+"</td>");
                sb.append("    <td><a class='view_btn' href='/BoardView?category=ReviewBoardList" +
                        "&boardname="+to.getBoardname()+"&currentPage=1&seq="+to.getSeq()+"'>"+to.getSubject()+"</a></td>");
                sb.append("    <td>"+to.getWdate()+"</td>");
                sb.append("    <td>매장방문 후기게시판</td>");
            } else if (to.getBoardname().equals("frequency_board")) {
                sb.append("    <tr>");
                sb.append("    <td>"+to.getSeq()+"</td>");
                sb.append("    <td><a class='view_btn' href='/BoardView?category=FrequencyBoardList" +
                        "&boardname="+to.getBoardname()+"&currentPage=1&seq="+to.getSeq()+"'>"+to.getSubject()+"</a></td>");
                sb.append("    <td>"+to.getWdate()+"</td>");
                sb.append("    <td>프리퀀시 게시판</td>");
            } else if (to.getBoardname().equals("beverage_board")) {
                sb.append("    <tr>");
                sb.append("    <td>"+to.getSeq()+"</td>");
                sb.append("    <td><a class='view_btn' href='/BoardView?category=BeverageBoardList" +
                        "&boardname="+to.getBoardname()+"&currentPage=1&seq="+to.getSeq()+"'>"+to.getSubject()+"</a></td>");
                sb.append("    <td>"+to.getWdate()+"</td>");
                sb.append("    <td>음료 게시판</td>");
            }
            sb.append("    </tr>");
        }
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
    <link rel="stylesheet" href="/css/(1.4.2)mypageList.css">
    <title>마이페이지</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <script>

        let queryString = location.search;
        const urlParams = new URLSearchParams(queryString);

        let memberKey = urlParams.get("memberKey");

        function fn_paging(currentPage) {
            location.href = '/member/myboardlists?memberKey='+memberKey+'&currentPage='+currentPage;
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
    <div class="mypage_table">
        <div class="content_header">내가 쓴 글</div>
        <b><sec:authentication property="principal.to.nickname"/></b> 님께서 작성하신 게시물은 총 <b>${allMyBoardListCount}</b>건 입니다.
        <hr>
        <table class="table table-hover table_margin">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                    <th>게시판</th>
                </tr>
            </thead>
             <tbody>
             <!-- 여기부터 모든 내가 쓴 글 목록 -->
             <c:choose>
                 <c:when test="${allMyBoardListCount == 0}">
                     <tr>
                         <td colspan="4" style="text-align: center;">작성한 게시물이 없습니다.</td>
                     </tr>
                 </c:when>
                 <c:otherwise>
                     <%= sb.toString() %>
                 </c:otherwise>
             </c:choose>

            </tbody>
        </table>
    </div>



     <div class="container-sm">
         <div class="container row" style="float: none; margin: 100 auto;">
             <div class="col-md-3" style="float: none; margin: 0 auto;">

                 <ul class="pagination justify-content-center">

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

                 </ul>

             </div>
         </div>
     </div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</div>


<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
