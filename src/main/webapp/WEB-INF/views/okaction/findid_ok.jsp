<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String id = (String) request.getAttribute("id");
    out.println("<script type='text/javascript'>");
    out.println("alert('등록된 아이디는 "+id+" 입니다. 위 아이디로 로그인 해주세요.');");
    out.println("location.href='/guest/login'");
    out.print("</script>");
%>
