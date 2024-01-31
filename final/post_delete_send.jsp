<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/test";
    String db_username = "root";
    String db_pwd = "1234";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
    
    String saleId = request.getParameter("SaleId");
    String loggedInUserId = (String) session.getAttribute("User");
    
    // Check if the SaleId belongs to the logged-in user
    String checkOwnershipQuery = "SELECT UserId FROM sales WHERE SaleId=?";
    PreparedStatement checkOwnershipPsmt = connection.prepareStatement(checkOwnershipQuery);
    checkOwnershipPsmt.setString(1, saleId);
    ResultSet ownershipResult = checkOwnershipPsmt.executeQuery();
    
    if (ownershipResult.next()) {
        String ownerUserId = ownershipResult.getString("UserId");
        
        if (loggedInUserId.equals(ownerUserId)) {
            String deleteTradeRequestQuery = "DELETE FROM trade_requests WHERE SaleId=?";
            PreparedStatement tradeRequestPsmt = connection.prepareStatement(deleteTradeRequestQuery);
            tradeRequestPsmt.setString(1, saleId);
            tradeRequestPsmt.executeUpdate();
            
            // Delete the record from the "sales" table
            String deleteSalesQuery = "DELETE FROM sales WHERE SaleId=?";
            PreparedStatement salesPsmt = connection.prepareStatement(deleteSalesQuery);
            salesPsmt.setString(1, saleId);
            salesPsmt.executeUpdate();
            
            response.sendRedirect("post_list.jsp");
        } else {
            out.println("<script>alert('본인의 게시물이 아니면 삭제가 불가능합니다.'); window.location='post_list.jsp';</script>");
        }
    } 
    else {
        out.println("<script>alert('Invalid SaleId.'); window.location='post_list.jsp';</script>");
    }
} catch (Exception ex) {
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>
