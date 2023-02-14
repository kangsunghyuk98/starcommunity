<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (int)request.getAttribute("flag");
	String memberkey = (String)request.getAttribute("memberkey");

	out.println("<script type='text/javascript'>");
	if( flag == 0){
		out.println("alert('레시피가 삭제되었습니다.');");
		out.println("location.href='/member/mycustom?memberKey="+memberkey+"';");
	} else {
		out.println("alert('레시피 삭제에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>