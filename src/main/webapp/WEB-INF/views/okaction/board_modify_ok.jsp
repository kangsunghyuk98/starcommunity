<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
    int flag = (Integer)request.getAttribute( "flag" );
	String boardname = (String)request.getAttribute( "boardname" );
	String category = (String)request.getAttribute( "category" );
	int currentPage = (Integer)request.getAttribute("currentPage");
	int seq = (Integer)request.getAttribute( "seq" );

	out.println( "<script type='text/javascript'>" );
    if ( flag == 0 ) {
    	out.println( "alert('글수정에 성공했습니다.');" );	
    	out.println( "location.href='/board/BoardView?category="+ category +"&boardname=" + boardname + "&currentPage=" + currentPage + "&seq=" + seq + "'");
    } else if( flag == 1 ){
    	out.println( "alert('글수정에 실패했습니다.');" );
    	out.println( "location.href='/board/BoardView?category="+ category +"&boardname=" + boardname + "&currentPage=" + currentPage + "&seq=" + seq + "'");
    } else if( flag == 2 ){
    	out.println( "alert('첨부 파일이 이미지 형식이 아닙니다.');" );
		out.println( "history.back();" );
    }
    out.print( "</script>" );
%>
