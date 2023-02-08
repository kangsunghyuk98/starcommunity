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
    	/*
    	if( boardname == "dlife_board" ) {
    		out.println( "location.href='/DailyBoardList?boardname=" + boardname + "'");
    	} else if( boardname == "beverage_board" ) {
    		out.println( "location.href='/BeverageBoardList?boardname=" + boardname + "'");
    	} else if( boardname == "review_board" ) {
    		out.println( "location.href='/ReviewBoardList?boardname=" + boardname + "'");
    	} else if( boardname == "md_board" ) {
    		out.println( "location.href='/MDBoardList?boardname=" + boardname + "'");
    	} else if( boardname == "frequency_board" ) {
    		out.println( "location.href='/FrequencyBoardList?boardname=" + boardname + "'");
    	}*/     
    }
    out.print( "</script>" );
%>
