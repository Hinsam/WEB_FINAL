<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
	
    String Id = request.getParameter("Id");
    String password = request.getParameter("password");
	
    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/test";
        String dbId = "root";
        String dbPass = "1234";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

        // SQL 쿼리 작성
        String sql = "SELECT * FROM user WHERE Id=? AND password=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, Id);
        stmt.setString(2, password);

        rs = stmt.executeQuery();
        
        if (rs.next()) {
            session.setAttribute("User", Id);
            //원하는 html 코드나 jsp 코드 밑에다 입력하면 됨
            //response.sendRedirect("welcome.jsp"); 
            out.println("<p>로그인 성공</p>");
            
            // 세션 아이디 확인하기
            String loggedInUserId = (String) session.getAttribute("User");
            out.println(loggedInUserId);
        } else {
            out.println("<p>Invalid username or password</p>");
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
