<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dto.BoardTO"%>
<%	
	String category = (String)request.getAttribute("category");
	String boardname = (String)request.getAttribute("boardname");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int seq = (int)request.getAttribute("seq");
	BoardTO to = (BoardTO)request.getAttribute("to");
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
    <link rel="stylesheet" href="/css/(1.3.1.2)boardwrite.css">
    <title>BoardModify</title>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="/js/(1.3.1.3)boardModify.js"></script>
	<script type="text/javascript" src="/js/(1)header.js"></script>
	
    <script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript">
			// 스마트 에디터 설정입니다.  
			submitPost = function() {
				oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", [])
				
			}
			
			$(document).ready(function () {
				document.getElementById( 'm_btn' ).onclick = function() {
					
					if( document.mfrm.subject.value.trim() == '' ) {
						alert( '제목을 입력하셔야 합니다.' );
						return false;
					}	
					// 첨부파일 이미지인지 검사
					let fileExt = document.mfrm.upload.value.trim().slice(-3);
					console.log( fileExt );
					if( fileExt != '' ){
						if( fileExt != 'png' ){
							if( fileExt != 'jpg' ){
								if( fileExt != 'gif' ){
									alert( '첨부하신 파일은 이미지 파일이 아닙니다.' );
									return false;
								}
							}
						}
					}
					// 에디터 API에서 내용 가져와서 검사
					submitPost();
					let content = document.getElementById("editorTxt").value
					if(content == '<p>&nbsp;</p>') {
					    alert("내용을 입력해주세요.")
					    oEditors.getById["editorTxt"].exec("FOCUS")
					    return false;
					} else {
					    console.log(content)
					}
					
	 				document.mfrm.submit();
				};
			}) 
		
	</script>
</head>

<body>
    <!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>

    <!-- 콘텐츠 영역 -->
    <br>
    <br>
    <div class="contents container col-lg-6 col-md-8 col-sm-10 ">
    	<form action="/board/BoardModify_ok?category=<%= category %>&boardname=<%= boardname %>&currentPage=<%= currentPage %>&seq=<%= seq %>" method="post" name="mfrm" enctype="multipart/form-data">
    		<!-- <input type="hidden" name="memberkey" value="<sec:authentication property="principal.to.memberKey" />" /> -->
	        <div class="content_header mt-auto ">글수정</div>
	        <div class="mb-3 title">
	            <label for="exampleInputEmail1" class="form-label">제목</label>
	            <input type="text" name="subject" class="form-control" value="<%= to.getSubject() %>">
	        </div>
	        <div class="mb-3">
	            <label for="formFileMultiple" class="form-label">파일 이름 : <%= to.getImgname() %></label>
	            <label for="formFileMultiple" class="form-label">파일 크기 : <%= to.getFilesize()/(1024*1024) + "MByte" %></label>
	            <input class="form-control" type="file" name="upload" value="" multiple>
	        </div>
	        <textarea name="content" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요" style="width: 100%"><%= to.getContent() %></textarea>
	        <div>
		    <button type="button" id="m_btn" style="float: right;" class="btn btn-outline-secondary ">글수정</button>
		    <button type="button" onclick="history.back();" style="float: right;"
				class="btn btn-outline-secondary ">취소</button>
	        </div>
        </form>
    </div>

<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>
</body>
</html>