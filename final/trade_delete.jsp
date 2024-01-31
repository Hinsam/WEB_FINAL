<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html> 
<head>
    <title>레코드 삭제</title>
</head>
<body>
<%
    String userId = request.getParameter("UserId");
    String saleId = request.getParameter("SaleId");
    Connection con = null;
    PreparedStatement pstmt = null;
    String driverName = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/test";
    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "1234");

        String deleteQuery = "DELETE FROM trade_requests WHERE UserId = ? AND SaleId = ?";
        pstmt = con.prepareStatement(deleteQuery);
        pstmt.setString(1, userId);
        pstmt.setString(2, saleId);
        int result = pstmt.executeUpdate();
        if (result > 0) {
        	out.println("<script type='text/javascript'>");
        	out.println("레코드가 성공적으로 삭제되었습니다.");
            out.println("window.location.href='trade_see.jsp';");
            out.println("</script>");
            
        } else {
        	out.println("<script type='text/javascript'>");
        	out.println("레코드가 삭제에 실패했습니다.");
            out.println("window.location.href='trade_see.jsp';");
            out.println("</script>");
        }
    } catch (Exception e) {
    	out.println("<script type='text/javascript'>");
    	out.println("삭제 중 오류가 발생하였습니다.");
        out.println("window.location.href='trade_see.jsp';");
        out.println("</script>");
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>
<a href="trade_see.jsp">목록으로 돌아가기</a>
</body>
</html>