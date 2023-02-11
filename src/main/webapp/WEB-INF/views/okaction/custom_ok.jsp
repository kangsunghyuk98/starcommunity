<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (int)request.getAttribute("flag");
	String beverage = (String)request.getAttribute("beverage");
	String seq = (String) request.getAttribute("seq");
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '나만의 레시피 저장에 성공했습니다' );" );
		out.println( "location.href='/Custom1'" );
	} else {
		out.println( "alert( '나만의 레시피 저장에 실패했습니다' );" );
		out.println( "location.href='/Custom1;" );
	}
	out.println( "</script>" );
%>