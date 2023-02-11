<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    int flag = (int)request.getAttribute("flag");
    String category = (String) request.getAttribute("category");
    String seq = (String) request.getAttribute("seq");
    String boardname = (String) request.getAttribute("boardname");
    int currentPage = (int) request.getAttribute("currentPage");

    if (flag==0) {
        out.println("<script type='text/javascript'>");
        out.println("alert('댓글을 성공적으로 작성하셨습니다.');");
        out.println("location.href='/board/BoardView?category="+category+"&boardname="+boardname+"&currentPage="+currentPage+"&seq="+seq+"'");
        out.print("</script>");
    }else {
        out.println("<script type='text/javascript'>");
        out.println("alert('댓글 작성 실패하였습니다.');");
        out.println("location.href='/board/BoardView?category="+category+"&boardname="+boardname+"&currentPage="+currentPage+"&seq="+seq+"'");
        out.print("</script>");
    }

%>
