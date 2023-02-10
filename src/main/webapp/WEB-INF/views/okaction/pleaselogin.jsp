<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    out.println("<script type='text/javascript'>");
    out.println("alert('로그인이 필요합니다.');");
    out.println("location.href='/redirect/login'");
    out.print("</script>");

%>

