<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  int flag = (int)request.getAttribute("flag");
  if (flag==0) {
     out.println("<script type='text/javascript'>");
     out.println("alert('회원정보 수정 하셨습니다. 다시 로그인 해주세요!');");
     out.println("location.href='/guest/logout'");
     out.print("</script>");
  }else {
    out.println("<script type='text/javascript'>");
    out.println("alert('회원수정 실패하였습니다. 모든 항목을 다시 확인 해주세요.');");
    out.print("</script>");
  }
%>
