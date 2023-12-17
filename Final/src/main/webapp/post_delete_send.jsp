<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/test";
    String db_username = "root";
    String db_pwd = "1234";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
    
    String SaleId = request.getParameter("SaleId");
    
    // Delete related records in the "trade_request" table
    String deleteTradeRequestQuery = "DELETE FROM trade_requests WHERE SaleId=" + SaleId;
    PreparedStatement tradeRequestPsmt = connection.prepareStatement(deleteTradeRequestQuery);
    tradeRequestPsmt.executeUpdate();
    
    // Delete the record from the "test" table
    String deleteTestQuery = "DELETE FROM sales WHERE SaleId=" + SaleId;
    PreparedStatement testPsmt = connection.prepareStatement(deleteTestQuery);
    testPsmt.executeUpdate();
    
    response.sendRedirect("post_list.jsp");
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>