<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%
    int flag = (Integer)request.getAttribute( "flag" );
	String boardName = (String)request.getAttribute( "boardName" );

	out.println( "<script type='text/javascript'>" );
    if ( flag == 0 ) {
    	out.println( "alert('글쓰기에 성공했습니다.');" );
    	
    	// 게시판 list가 여러개라 테이블 이름으로 판별해서 각각의 게시판 list로 보냄.
    	if( boardName == "dlife_board" ) {
    		out.println( "location.href='/DailyBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "beverage_board" ) {
    		out.println( "location.href='/BeverageBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "review_board" ) {
    		out.println( "location.href='/ReviewBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "md_board" ) {
    		out.println( "location.href='/MDBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "frequency_board" ) {
    		out.println( "location.href='/FrequencyBoardList?boardname=" + boardName + "'");
    	}
    } else {
    	out.println( "alert('글쓰기에 실패했습니다.');" );
    	
    	if( boardName == "dlife_board" ) {
    		out.println( "location.href='/DailyBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "beverage_board" ) {
    		out.println( "location.href='/BeverageBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "review_board" ) {
    		out.println( "location.href='/ReviewBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "md_board" ) {
    		out.println( "location.href='/MDBoardList?boardname=" + boardName + "'");
    	} else if( boardName == "frequency_board" ) {
    		out.println( "location.href='/FrequencyBoardList?boardname=" + boardName + "'");
    	}     
    }
    out.print( "</script>" );
%>
