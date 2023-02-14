<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link rel="stylesheet" href="/css/(1.4.3)mypageCustom.css">
    <title>마이페이지</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <script>
        function fn_paging(currentPage) {
            location.href = '/member/mycustom?currentPage='+currentPage+'&memberKey=${memberKey}';
        }
    </script>
</head>

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
 <div class="container col-lg-8 col-md-8 col-sm-10 mb-5">
    <div class="mypage_table">
        <div class="content_header">나만의 레시피</div>
        <b><sec:authentication property="principal.to.nickname"/></b> 님께서 제작하신 나만의 레시피는 <b>${myCustomCount}</b>개 입니다.
        <hr>
        <table class="table table-hover table_margin">
            <thead>
                <tr>
                    <th style="width: 5%; text-align: center;" >번호</th>
                    <th style="width: 10%;">작성일자</th>
                    <th style="width: 20%;">음료명</th>
                    <th style="width: 57%;">레시피 내용</th>
                    <th style="width: 8%;"></th>                    
                </tr>
            </thead>
            <tbody>
                <!--나만의 레시피 작성한 내역 노출 -->

                <c:forEach var="cto" items="${allMyCutomList}">

                <tr>
                    <td class="text-center">${cto.cusseq}</td>
                    <td>${cto.wdate}</td>
                    <td>${cto.beverage}</td>
                    <td>${cto.recipe}</td>
                    <td style="text-align: center; vertical-align: middle; ">
                    	<form action="/CustomDelete" method="post" name="dfrm">
                    		<input type="hidden" name="cusseq" value="${cto.cusseq}">
                    		<input type="hidden" name="memberKey" value="<sec:authentication property="principal.to.memberKey" />">
                    		<button type="submit" class="btn btn-outline-danger btn-sm">삭제</button>
                    	</form>
                    </td>
                </tr>

                </c:forEach>

            </tbody>
        </table>
        <button id="custom_btn" type="button" class="btn btn-outline-secondary btn-lg px-4 " onclick="location.href='/Custom1'">나만의 레시피 만들기</button>
    </div>

     <!-- 페이징 처리 -->
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
<jsp:include page="../include/footer.jsp"/>

</body>
</html>