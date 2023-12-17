<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
try
{
	//JDBC 드라이버 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/test";
    String db_username = "root";
    String db_pwd = "1234";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    //문자열의 인코딩 방식 결정
    request.setCharacterEncoding("UTF-8");
    
    //파라미터를 통해 전해진 정보를 받아와 각 문자열 변수에 저장
	String ItemName = request.getParameter("ItemName");
	String UserId = request.getParameter("UserId");
	String ItemDescription = request.getParameter("ItemDescription");
	String SaleDate = request.getParameter("SaleDate");
	String SalePrice = request.getParameter("SalePrice");
	
	//게시글 번호를 결정하기 위한 임시 정수형 변수
	int SaleId = 0;
	
	String insertQuery = "SELECT MAX(SaleId) from sales";
	
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	ResultSet result = psmt.executeQuery();
	
	while(result.next())
	{
		SaleId = result.getInt("MAX(SaleId)") + 1;
	}
	
	insertQuery = "INSERT INTO sales(SaleId, ItemName, UserId, ItemDescription, SaleDate, SalePrice) VALUES (?, ?, ?, ?, ?, ?)";
	
	psmt = connection.prepareStatement(insertQuery);
	
	psmt.setInt(1, SaleId);
	psmt.setString(2, ItemName);
	psmt.setString(3, UserId);
	psmt.setString(4, ItemDescription);
	psmt.setString(5, SaleDate);
	psmt.setString(6, SalePrice);
	
	psmt.executeUpdate();
	
	response.sendRedirect("post_list.jsp");
}
catch (Exception ex)
{
    out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>