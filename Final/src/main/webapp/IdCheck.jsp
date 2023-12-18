<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    String inputId = request.getParameter("Id");
    String result = null;
	
    try {
    	String jdbcUrl = "jdbc:mysql://localhost:3306/test";
        String dbId = "root";
        String dbPass = "0000";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        // SQL 쿼리 작성
        String sql = "SELECT * FROM user";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()) {
            String id = rs.getString("Id");

            if (inputId.equals(id)) {
                out.print("동일한 아이디가 존재합니다.");
                break;
            }
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