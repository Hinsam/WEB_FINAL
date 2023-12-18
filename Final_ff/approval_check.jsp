<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    Connection con = null;
    PreparedStatement pstmt = null;
    String driverName = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/test";

    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "1234");

        String userIdToApprove = request.getParameter("UserIdToApprove");
        String saleIdToApprove = request.getParameter("SaleIdToApprove");
        String newApprovalStatus = request.getParameter("type_form");
		
        System.out.println(userIdToApprove);
        System.out.println(saleIdToApprove);
        System.out.println(newApprovalStatus);
        
        if (userIdToApprove != null && saleIdToApprove != null && newApprovalStatus != null) {
            String updateQuery = "UPDATE trade_requests SET approval = ? WHERE UserId = ? AND SaleId = ?";
            pstmt = con.prepareStatement(updateQuery);
            pstmt.setString(1, newApprovalStatus);
            pstmt.setString(2, userIdToApprove);
            pstmt.setString(3, saleIdToApprove);

            int updateResult = pstmt.executeUpdate();
            if (updateResult > 0) {
            	out.println("<script type='text/javascript'>");
                out.println("alert('변경성공'); window.location='approval.jsp';</script>");
                out.println("</script>");
            } else {
            	out.println("<script type='text/javascript'>");
                out.println("alert('변경실패');  window.location='approval.jsp';</script>");
                out.println("</script>");
            }
        } else {
        	out.println("<script type='text/javascript'>");
            out.println("alert('변경실패');  window.location='approval.jsp';</script>");
            out.println("</script>");
        }
    } catch (Exception e) {
    	out.println("<script type='text/javascript'>");
        out.println("alert('데이터 베이스 로드 실패');");
        out.println("</script>");
        out.println(e);
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>
</body>
</html>
