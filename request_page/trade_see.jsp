<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>데이터베이스 예제 : 데이터 조회 및 삭제</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<h2>데이터 조회 및 삭제</h2>
<%
  Connection con = null;
  Statement stmt = null;
  String driverName = "com.mysql.cj.jdbc.Driver";
  String dbURL = "jdbc:mysql://localhost:3309/test";
  try {
    Class.forName(driverName);
    con = DriverManager.getConnection(dbURL, "root", "1234");
    stmt = con.createStatement();
    ResultSet result = stmt.executeQuery("SELECT * FROM trade_requests;");
%>
<table width=100% border=2 cellpadding=1>
  <tr>
    <td align=center><b>유저아이디</b></td>
    <td align=center><b>판매번호</b></td>
    <td align=center><b>코멘트</b></td>
    <td align=center><b>글 올린 작성시간</b></td>
    <td align=center><b>시작대여일</b></td>
    <td align=center><b>종료대여일</b></td>
    <td align=center><b>삭제</b></td>
  </tr>
  <% while (result.next()) { %>
  <tr>
    <td align=center><%= result.getString("UserId") %></td>
    <td align=center><%= result.getString("SaleId") %></td>
    <td align=center><%= result.getString("Comment") %></td>
    <td align=center><%= result.getString("RequestDate") %></td>
    <td align=center><%= result.getString("RentalStartDate") %></td>
    <td align=center><%= result.getString("RentalEndDate") %></td>
    <td align=center>
      <a href="trade_delete.jsp?UserId=<%= result.getString("UserId") %>&SaleId=<%= result.getString("SaleId") %>">삭제</a>
    </td>
  </tr>
  <% }
    result.close();
  } catch(Exception e) {
    out.println("<p>데이터베이스 조회 중 오류가 발생했습니다.</p>");
    out.println("<p>" + e + "</p>");
    e.printStackTrace();
  } finally {
    if (stmt != null) stmt.close();
    if (con != null) con.close();
  }
  %>
</table>
</body>
</html>
