<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/test";
    String db_username = "root";
    String db_pwd = "0000";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
    
    String ItemName = request.getParameter("ItemName");
	String UserId = request.getParameter("UserId");
	String ItemDescription = request.getParameter("ItemDescription");
	String SaleDate = request.getParameter("SaleDate");
	String SalePrice = request.getParameter("SalePrice");
    
    String SaleId = request.getParameter("SaleId");
    
    String insertQuery = "SELECT * FROM test WHERE SaleId=" + SaleId;
    
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);
 	
 	ResultSet result = psmt.executeQuery();
 	
 	while(result.next())
 	{
        insertQuery = "UPDATE test set ItemName=?, UserId=?, ItemDescription=?, SaleDate=?, SalePrice=? WHERE SaleId=" + SaleId;
 	    
 	    psmt = connection.prepareStatement(insertQuery);
        
 	   	psmt.setString(1, ItemName);
 		psmt.setString(2, UserId);
 		psmt.setString(3, ItemDescription);
 		psmt.setString(4, SaleDate);
 		psmt.setString(5, SalePrice);
        
        psmt.executeUpdate();
        
        response.sendRedirect("post_list.jsp");
 	}
}
catch (Exception ex)
{
	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>