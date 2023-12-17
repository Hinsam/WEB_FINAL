<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
	
    String Email = request.getParameter("Email");
    String Id = request.getParameter("Id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
	
    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/test";
        String dbId = "root";
        String dbPass = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        // SQL 쿼리 작성
        String sql = "INSERT INTO user (Id, name, Email, password) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        //rs = stmt.executeQuery();
        stmt.setString(1, Id);
        stmt.setString(2, name);
        stmt.setString(3, Email);
        stmt.setString(4, password);

        int rowsAffected = stmt.executeUpdate();

        // 삽입이 성공했을 경우
        if (rowsAffected > 0) {
            // Redirect to success.html
            response.sendRedirect("success.html");
        } else {
            // Redirect to fail.html
            response.sendRedirect("fail.html");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
