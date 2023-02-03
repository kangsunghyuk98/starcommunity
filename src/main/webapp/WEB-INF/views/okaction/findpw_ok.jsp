<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
int flag = (int) request.getAttribute("flag");

    if (flag == 0) {
        out.println("<script type='text/javascript'>");
        out.println("alert('비밀번호가 재설정 되었습니다. 메일을 확인 해주세요.');");
        out.println("location.href='/guest/login'");
        out.print("</script>");
    } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('등록되지 않은 사용자 입니다. 입력 정보를 다시 확인 해주세요.');");
        out.println("location.href='/guest/findpw'");
        out.print("</script>");
    }

%>
