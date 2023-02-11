<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.dto.BeverageTO" %>
<%@ page import="java.util.ArrayList" %>
<%	

	ArrayList<BeverageTO> customLists = (ArrayList<BeverageTO>)request.getAttribute("customLists");

	StringBuilder sbHtml = new StringBuilder();
	
	for(BeverageTO to : customLists){
		String image = to.getImage();
		String name = to.getName();
        String seq = to.getSeq();
		
		sbHtml.append("<div class='col'>");
		sbHtml.append("		<div class='row'>");
		sbHtml.append("			<a href='./Custom2?name=" + name+"&seq="+seq +"'>"  );
		sbHtml.append("				<img src='" + image + "'" + "class='img-thumbnail img-fluid' alt=''></a>" );
		sbHtml.append("				<p class='beverage_name text-center'>" + name + "</p>");
		sbHtml.append("		</div>");
		sbHtml.append("</div>");       
        	
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
    <link rel="stylesheet" href="/css/(1)contents.css">
    <link rel="stylesheet" href="/css/(1.8)custom1.css">
    <title>커스텀 레시피</title>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

    <script type="text/javascript" src="/js/(1)header.js"></script>
</head>

<body>
	<!-- 헤더 영역 -->
	<jsp:include page="../include/header.jsp"/>

	<!-- 콘텐츠 영역 -->
	<br>
	<br>
	<div class="container col-lg-6 col-md-8 col-sm-10">
	    <div class="custom_table mb-5 content px-5 py-5" >
	        <div class="content_header mb-4">My Custom Recipe</div>
	        <div class="mt-5 mb-4 custom_subject_txt" >음료의 이미지를 클릭하면 커스텀 페이지로 이동합니다</div>
	        <div class="container">
	       		<div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
	       		<%=sbHtml.toString() %>
	       			<!--
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	             </div>
	             <div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	                <div class="col">
	                    <div class="row">
	                    	<a href="./Custom2"><img src="/img/(1.8.1).PNG" class="img-thumbnail img-fluid" alt=""></a> 
	                        <p class="beverage_name text-center">그린티 프라푸치노</p>
	                    </div>
	                </div>
	                 -->
	             </div>
	        </div>
	    </div>
	</div>
	
	
<!-- 풋터 영역 -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>