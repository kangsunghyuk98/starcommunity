<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    int flag = (int)request.getAttribute("flag");
    String seq = (String) request.getAttribute("seq");

    if (flag==0) {
        out.println("<script type='text/javascript'>");
        out.println("location.href='/BeverageInfo?seq="+seq+"'");
        out.print("</script>");
    }else {
        out.println("<script type='text/javascript'>");
        out.println("alert('코멘트 작성 실패하였습니다.');");
        out.println("location.href='/BeverageInfo?seq="+seq+"'");
        out.print("</script>");
    }

%>
