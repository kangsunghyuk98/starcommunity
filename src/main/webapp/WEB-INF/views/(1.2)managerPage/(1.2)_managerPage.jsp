<%@ page import="java.util.List" %>
<%@ page import="com.example.dto.MemberTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

    List<MemberTO> memberList = (List<MemberTO>) request.getAttribute("memberList");
    StringBuilder sb = new StringBuilder();

    for (MemberTO to:memberList) {
        sb.append("    <tr>");
        sb.append("         <td>"+to.getMemberKey()+"</td>");
        sb.append("         <td>"+to.getId()+"</td>");
        sb.append("         <td>"+to.getNickname()+"</td>");
        sb.append("         <td>"+to.getName()+"</td>");
        sb.append("         <td>"+to.getEmail()+"</td>");
        sb.append("         <td class=\"text-center\"><button type=\"button\" class=\"btn btn-outline-danger btn-sm d_btn\" value='"+to.getMemberKey()+"'>삭제</button></td>");
        sb.append("    </tr>");
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
    <link rel="stylesheet" href="/css/(1.2)_managerPage.css">
    <title>관리자 페이지</title>
 	<script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
	<script>
       function fn_paging(currentPage) {
           location.href = '/admin/main?currentPage='+currentPage;
       }
	</script>
</head>

<body>
<!-- 헤더 영역 -->
<jsp:include page="../include/header.jsp"/>

<!-- 콘텐츠 영역 -->
<br>
<br>
<div>
    <div class="container col-lg-8 col-md-8 col-sm-10">

        <div class="content_header">회원 관리</div>
        <p>회원의 정보로 검색하여 관리할 수 있습니다. (리스트 초기화 하려면 아무것도 입력하지 않은 상태에서 search)</p>
        
        <div class="dropdown">
            <form action="/admin/main_search" method="get" class="d-inline-flex">
                <select name="selectCondition" class="form-select for_search">
                    <option selected disabled>검색조건</option>
                    <option name="id" value="id">ID</option>
                    <option name="nickname" value="nickname">닉네임</option>
                    <option name="name" value="name">이름</option>
                </select>
                <input class="form-control for_search" name="keyword" type="text" placeholder="Search">
                <button class="btn btn-primary" type="submit">Search</button>
            </form>
        </div>   

        <hr />
        
        <div class="table-responsive mt-3">
            <table class="table table-hover table_margin">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Nickname</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th width="100" class="text-center">회원 삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 회원 정보 다 들어가는 곳-->
                    <%= sb.toString() %>
                </tbody>
            </table>

            <script>

                $('.d_btn').click(function(){
                    if(confirm('해당 회원을 삭제하시겠습니까?')){
                        let memberkey = $(this).attr('value');

                        $.ajax({
                            type: 'POST',
                            url: '/admin/member_delete',
                            data: 'memberkey=' + memberkey,
                            dataType: 'text',
                            success: function (result) {
                                if (result == 0) {
                                    alert('삭제 성공');
                                    location.href = '/admin/main';
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

            </script>

        </div>

    </div>
</div>
<br>

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


<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>