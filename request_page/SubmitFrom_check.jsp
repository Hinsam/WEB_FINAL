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
    Statement stmt = null;
    String driverName = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3309/test";
    try {
        Class.forName(driverName);
        con = DriverManager.getConnection(dbURL, "root", "1234");
        stmt = con.createStatement();

    String userId = request.getParameter("UserId");
    String saleId = request.getParameter("SaleId");
    String comment = request.getParameter("Comment");
    String requestDate = request.getParameter("RequestDate");
    String rentalStartDate = request.getParameter("RentalStartDate");
    String rentalEndDate = request.getParameter("RentalEndDate");

    String insertQuery = "INSERT INTO trade_requests (UserId, SaleId, Comment, RequestDate, RentalStartDate, RentalEndDate) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement insertPstmt = con.prepareStatement(insertQuery);
    insertPstmt.setString(1, userId);
    insertPstmt.setString(2, saleId);
    insertPstmt.setString(3, comment);
    insertPstmt.setString(4, requestDate);
    insertPstmt.setString(5, rentalStartDate);
    insertPstmt.setString(6, rentalEndDate);

    int result = insertPstmt.executeUpdate();
    if (result > 0) {
        out.println("<p>데이터가 성공적으로 추가되었습니다.</p>");
    } else {
        out.println("<p>데이터 추가에 실패했습니다.</p>");
    }
    insertPstmt.close();
    // 데이터 삽입 로직 끝
    stmt = con.createStatement();

    } catch (Exception e) {
        out.println("univdb DB의 조회 문제가 있음 <hr>");
        out.println(e);
        e.printStackTrace();
    } finally {
        if (con != null) con.close();
    }
%>
<a href="trade_see.jsp">목록으로 돌아가기</a>
</body>
</html>
