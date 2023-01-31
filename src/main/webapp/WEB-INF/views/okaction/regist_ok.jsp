<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int flag = (int)request.getAttribute("flag");
  if (flag==0) {
     out.println("<script type='text/javascript'>");
     out.println("alert('회원가입 성공하셨습니다.');");
     out.println("location.href='/guest/login'");
     out.print("</script>");
  }else {
    out.println("<script type='text/javascript'>");
    out.println("alert('회원가입 실패 다시시도 해주세요.');");
    out.print("</script>");
  }
%>
