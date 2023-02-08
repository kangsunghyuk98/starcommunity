<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
    int flag = (Integer)request.getAttribute( "flag" );
	String boardname = (String)request.getAttribute( "boardname" );
	String category = (String)request.getAttribute( "category" );

	out.println( "<script type='text/javascript'>" );
    if ( flag == 0 ) {
    	out.println( "alert('글쓰기에 성공했습니다.');" );
    	out.println( "location.href='/" + category + "?boardname=" + boardname + "'");   	
    } else {
    	out.println( "alert('글쓰기에 실패했습니다.');" );
    	out.println( "location.href='/" + category + "?boardname=" + boardname + "'");   
    }
    out.print( "</script>" );
%>
