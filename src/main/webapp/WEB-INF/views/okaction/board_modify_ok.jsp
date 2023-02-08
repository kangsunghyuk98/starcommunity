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
    	out.println( "location.href='/BoardView?category="+ category +"&boardname=" + boardname + "&currentPage=" + currentPage + "&seq=" + seq + "'");
    } else {
    	out.println( "alert('글수정에 실패했습니다.');" );
    	out.println( "location.href='/"+ category +"?boardname=" + boardname + "&currentPage=" + currentPage + "&seq=" + seq + "'");    
    }
    out.print( "</script>" );
%>
